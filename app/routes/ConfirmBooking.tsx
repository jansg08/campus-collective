import {
  data,
  Form,
  redirect,
  useNavigate,
  useOutletContext,
} from "react-router";
import { useLocation } from "react-router";
import Modal from "~/components/Modal";
import type { Route } from "./+types/ConfirmBooking";
import { format } from "date-fns";
import WideButton from "~/components/WideButton";
import { getSupabaseClient } from "~/auth/supabase.server";
import { db } from "src/db";
import { bookingsTable } from "src/db/schema/bookings";

interface OutletContext {
  event: {
    venueName: string;
    title: string;
    startTime: Date;
    endTime: Date;
    price: number;
  };
}

export const action = async ({ request }: Route.ActionArgs) => {
  const eventId = Number.parseInt(
    request.url.match(/(?<=\/)\d+(?=\/confirm)/gi)?.join() || ""
  );
  const { supabase, headers } = getSupabaseClient(request);
  const {
    data: { user },
    error,
  } = await supabase.auth.getUser();

  if (user && eventId) {
    const [newBooking] = await db
      .insert(bookingsTable)
      .values({ userId: user.id, eventId: eventId })
      .returning({
        dateBooked: bookingsTable.dateBooked,
        paymentRef: bookingsTable.paymentRef,
      })
      .onConflictDoNothing();

    if (newBooking) {
      return redirect(`${request.url}/success`, { headers });
    }
  }

  if (user) {
    return data({ err: "Selected event does not exist" }, { headers });
  }

  return redirect("/log-in", { headers });
};

export const loader = async ({ request }: Route.LoaderArgs) => {
  const { supabase, headers } = getSupabaseClient(request);
  const {
    data: { user },
    error,
  } = await supabase.auth.getUser();

  if (!user) {
    throw redirect("/log-in", { headers });
  }
};

const ConfirmBooking = ({}: Route.ComponentProps) => {
  const { event } = useOutletContext<OutletContext>();
  const { pathname } = useLocation();
  const navigate = useNavigate();

  return (
    <Modal closeModal={() => navigate(pathname.replace("/confirm", ""))}>
      <h3>Confirm Booking</h3>
      <div className="leading-normal text-sm">
        <p>
          {event.title} @ {event.venueName}
        </p>
        <p>
          {format(event.startTime, "iiii do MMMM y")},{" "}
          {format(event.startTime, "HH:mm")}-{format(event.endTime, "HH:mm")}
        </p>
      </div>
      {event.price === 0 && (
        <Form method="post" action={pathname} className="flex flex-col gap-2">
          <WideButton type="submit">Free • Confirm Booking</WideButton>
          <p className="text-2xs text-text-dim">
            This event is free - no payment will be taken
          </p>
        </Form>
      )}
    </Modal>
  );
};

export default ConfirmBooking;
