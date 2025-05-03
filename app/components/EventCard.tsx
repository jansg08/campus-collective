import Calendar from "~/svgs/CalendarSmall.svg?react";
import Clock from "~/svgs/ClockSmall.svg?react";
import MapPin from "~/svgs/MapPinSmall.svg?react";
import WideButton from "./WideButton";

import { format } from "date-fns";

interface EventCardProps {
  photoUrl: string;
  price: number;
  title: string;
  startTime: Date;
  endTime: Date;
  venue: string;
}

const EventCard = ({
  photoUrl,
  price,
  title,
  startTime,
  endTime,
  venue,
}: EventCardProps) => {
  return (
    <div className="w-full rounded-lg shadow-lg">
      <div
        style={{ backgroundImage: `url(${photoUrl})` }}
        className={`aspect-video flex justify-between items-start py-4 pr-4 rounded-t-lg bg-cover bg-center bg-[url(--bg-url)]`}
      >
        <div className="h-full flex flex-col justify-end">
          <span className="text-background bg-[rgba(4,76,59,0.8)] leading-none font-bold p-4 text-2xl max-w-56">
            {title}
          </span>
        </div>
        <span className="text-sm text-background bg-accent px-2 py-0.5 font-bold leading-none rounded-xs">
          {price > 0 ? `£${price % 1 ? price.toPrecision(3) : price}` : "Free"}
        </span>
      </div>
      <div className="p-4 bg-secondary-light flex flex-col gap-3 rounded-b-lg">
        <div className="flex flex-col gap-2">
          <p className="flex gap-1.5 items-center text-sm">
            <Calendar stroke="#044c3b" />
            {format(startTime, "iiii do MMMM y")}
          </p>
          <p className="flex gap-1.5 items-center text-sm">
            <Clock stroke="#044c3b" />
            {`${format(startTime, "HH:mm")}-${format(endTime, "HH:mm")}`}
          </p>
          <p className="flex gap-1.5 items-center text-sm">
            <MapPin stroke="#044c3b" />
            {venue}
          </p>
        </div>
        <WideButton colour="primary" isThin>
          View Details
        </WideButton>
      </div>
    </div>
  );
};

export default EventCard;
