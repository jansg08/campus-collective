import { Link } from "react-router";
import EventDetails from "./EventDetails";
import WideButton from "./WideButton";
import formatPrice from "~/utils/formatPrice";

interface EventCardProps {
  photoUrl: string;
  price: number;
  title: string;
  startTime: Date;
  endTime: Date;
  venue: string;
  uniSlug: string;
  id: number;
}

const EventCard = ({
  photoUrl,
  price,
  title,
  startTime,
  endTime,
  venue,
  uniSlug,
  id,
}: EventCardProps) => {
  return (
    <Link to={`/${uniSlug}/events/${id}`}>
      <div className="w-full rounded-lg shadow-lg">
        <div
          style={{ backgroundImage: `url(${photoUrl})` }}
          className="aspect-video flex justify-between gap-4 items-start py-4 pr-4 rounded-t-lg bg-cover bg-center"
        >
          <div className="h-full flex flex-col justify-end">
            <h3 className="text-background bg-[rgba(4,76,59,0.8)] leading-none font-bold p-4 max-w-80">
              {title}
            </h3>
          </div>
          <span className="text-sm text-background bg-accent px-2 py-0.5 font-bold leading-none rounded-xs">
            {formatPrice(price)}
          </span>
        </div>
        <div className="p-4 bg-secondary-light flex flex-col gap-2 rounded-b-lg">
          <EventDetails
            variant="small"
            startTime={startTime}
            endTime={endTime}
            venue={venue}
          />
          <WideButton colour="primary" isThin>
            View Details
          </WideButton>
        </div>
      </div>
    </Link>
  );
};

export default EventCard;
