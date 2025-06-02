import { redirect, useOutletContext } from "react-router";
import type { EventOutletContext } from "./ConfirmBooking";
import { format } from "date-fns";
import WideButton from "~/components/WideButton";
import PlusCircle from "~/svgs/PlusCircle.svg?react";
import type { Route } from "./+types/BookingSuccess";
import { getSupabaseClient } from "~/auth/supabase.server";
import { bookingsTable } from "src/db/schema/bookings";
import { db } from "src/db";
import { and, eq } from "drizzle-orm";
import { generateIcsFile } from "~/utils/generateIcsFile";

export const loader = async ({ request, params }: Route.LoaderArgs) => {
  const eventId = Number(params.eventId);
  const { universitySlug } = params;
  const { supabase, headers } = getSupabaseClient(request);
  const {
    data: { user },
    error,
  } = await supabase.auth.getUser();

  if (user) {
    const bookingResult = await db
      .select({
        eventId: bookingsTable.eventId,
        userId: bookingsTable.userId,
        dateBooked: bookingsTable.dateBooked,
      })
      .from(bookingsTable)
      .where(
        and(
          eq(bookingsTable.eventId, eventId),
          eq(bookingsTable.userId, user.id)
        )
      );

    if (!bookingResult.length) {
      return redirect(`/${universitySlug}/events/${eventId}`, { headers });
    }
  }
};

const BookingSuccess = ({ loaderData }: Route.ComponentProps) => {
  console.log(loaderData);
  const { event } = useOutletContext<EventOutletContext>();

  return (
    <>
      <title>{`Booking Confirmed | ${event.title}`}</title>
      <h3>Booking Confirmed!</h3>
      <p className="text-sm">
        It's official - you're going to <b>{event.title}</b> on{" "}
        <b>{format(event.startTime, "iiii do MMMM y")}</b>
      </p>
      <WideButton
        colour="secondary"
        onClick={() =>
          generateIcsFile({
            title: event.title,
            description: event.description,
            venue: event.venue,
            startTime: event.startTime,
            endTime: event.endTime,
          })
        }
      >
        <PlusCircle stroke="#044c3b" className="mr-1" />
        Add to Calendar
      </WideButton>
      <p className="text-sm">
        If you don't want to add it right away, you can always find events your
        signed up for under 'My Events' in the top menu
      </p>
    </>
  );
};

export default BookingSuccess;
