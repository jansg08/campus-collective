import {
  data,
  Form,
  redirect,
  useLocation,
  useNavigation,
  useOutletContext,
} from "react-router";
import type { EventOutletContext } from "~/routes/ConfirmBooking";
import WideButton from "../components/WideButton";
import { format } from "date-fns";
import { getSupabaseClient } from "~/auth/supabase.server";
import { bookingsTable } from "src/db/schema/bookings";
import type { Route } from "./+types/ConfirmBookingForm";
import { db } from "src/db";
import { Mirage } from "ldrs/react";
import "ldrs/react/Mirage.css";

export const action = async ({ request, params }: Route.ActionArgs) => {
  const eventId = Number(params.eventId);
  const { supabase, headers } = getSupabaseClient(request);
  const {
    data: { user },
    error,
  } = await supabase.auth.getUser();

  if (user && eventId) {
    try {
      const [newBooking] = await db
        .insert(bookingsTable)
        .values({ userId: user.id, eventId: eventId })
        .returning({
          dateBooked: bookingsTable.dateBooked,
          paymentRef: bookingsTable.paymentRef,
        });

      if (newBooking) {
        return redirect(`${request.url}/success`, { headers });
      }
      return data(
        {
          err: {
            code: "booking_exists",
            msg: "The booking already exists for the given event and user id",
          },
        },
        { headers }
      );
    } catch (err) {
      return data({ err }, { headers });
    }
  }

  if (user) {
    return data(
      {
        err: {
          code: "event_not_found",
          msg: "The event with the given event id does not exist",
        },
      },
      { headers }
    );
  }

  return redirect("/log-in", { headers });
};

const ConfirmBookingForm = ({ actionData }: Route.ComponentProps) => {
  const err = actionData?.err;
  const { formAction, state } = useNavigation();
  const { pathname } = useLocation();
  const { event } = useOutletContext<EventOutletContext>();
  return (
    <>
      <title>{`Confirm Booking | ${event.title}`}</title>
      <h3>Confirm Booking</h3>
      <div className="leading-normal text-sm flex flex-col gap-2">
        <h6 className="font-bold">What?</h6>
        <p>{event.title}</p>
        <h6 className="font-bold">Where?</h6>
        <p>{event.venue?.name}</p>
        <h6 className="font-bold">When?</h6>
        <p>
          {format(event.startTime, "iiii do MMMM y")},{" "}
          {format(event.startTime, "HH:mm")}-{format(event.endTime, "HH:mm")}
        </p>
      </div>
      {event.price === 0 && (
        <Form method="post" className="flex flex-col gap-2">
          <WideButton type="submit">
            {state !== "idle" && formAction === `${pathname}?index` ? (
              <Mirage size="70" color="#f7f4e9" />
            ) : (
              "Free • Confirm Booking"
            )}
          </WideButton>
          <p className="text-2xs text-text-dim">
            This event is free - no payment will be taken
          </p>
        </Form>
      )}
    </>
  );
};

export default ConfirmBookingForm;
