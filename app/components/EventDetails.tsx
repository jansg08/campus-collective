import { format } from "date-fns";
import ExternalLink from "~/svgs/ExternalLink.svg?react";

// normal icons
import Calendar from "~/svgs/Calendar.svg?react";
import Clock from "~/svgs/Clock.svg?react";
import MapPin from "~/svgs/MapPin.svg?react";

// small icons
import SmallCalendar from "~/svgs/CalendarSmall.svg?react";
import SmallClock from "~/svgs/ClockSmall.svg?react";
import SmallMapPin from "~/svgs/MapPinSmall.svg?react";

interface EventDetailsProps {
  variant?: "normal" | "small";
  startTime: Date;
  endTime: Date;
  venue: string;
  venueLinked?: boolean;
  university?: string;
}

export const LinkedVenue = ({
  venue,
  university = "",
}: {
  venue: string;
  university?: string;
}) => (
  <a
    href={`https://www.google.com/maps/search/?api=1&query=${[venue, university]
      .join(" ")
      .replaceAll(" ", "+")}`}
    target="_blank"
    className="flex items-center justify-center gap-0.5"
  >
    {venue}
    <ExternalLink stroke="#044c3b" />
  </a>
);

const EventDetails = ({
  variant = "normal",
  startTime,
  endTime,
  venue,
  venueLinked = false,
  university = "",
}: EventDetailsProps) => {
  return (
    <div
      className={`w-full flex flex-col ${
        variant === "normal" ? "gap-4" : "gap-2"
      }`}
    >
      <p
        className={`w-full flex gap-1.5 items-center ${
          variant === "small" && "text-sm"
        }`}
      >
        {variant === "normal" ? (
          <Calendar stroke="#044c3b" />
        ) : (
          <SmallCalendar stroke="#044c3b" />
        )}
        {format(startTime, "iiii do MMMM y")}
      </p>
      <p
        className={`w-full flex gap-1.5 items-center ${
          variant === "small" && "text-sm"
        }`}
      >
        {variant === "normal" ? (
          <Clock stroke="#044c3b" />
        ) : (
          <SmallClock stroke="#044c3b" />
        )}
        {`${format(startTime, "HH:mm")}-${format(endTime, "HH:mm")}`}
      </p>
      <p
        className={`w-full flex gap-1.5 items-center ${
          variant === "small" && "text-sm"
        }`}
      >
        {variant === "normal" ? (
          <MapPin stroke="#044c3b" />
        ) : (
          <SmallMapPin stroke="#044c3b" />
        )}
        {venueLinked ? (
          <LinkedVenue venue={venue} university={university} />
        ) : (
          venue
        )}
      </p>
    </div>
  );
};

export default EventDetails;
