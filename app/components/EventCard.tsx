import Calendar from "~/svgs/CalendarSmall.svg?react";
import Clock from "~/svgs/ClockSmall.svg?react";
import MapPin from "~/svgs/MapPinSmall.svg?react";

const EventCard = () => {
  return (
    <div className="w-full rounded-lg shadow-lg">
      <div className="aspect-video flex justify-between items-start p-4 rounded-t-lg bg-cover bg-[url(https://www.shutterstock.com/image-photo/microphone-stool-on-stand-comedy-600nw-1031487514.jpg)]">
        <div className="h-full flex flex-col justify-end">
          <h2 className="bg-text text-background font-bold">
            Stand Up with Stacey
          </h2>
        </div>
        <span className="text-sm text-background bg-accent px-2 py-0.5 font-bold leading-none rounded-xs">
          £10
        </span>
      </div>
      <div className="p-4 bg-secondary-light flex flex-col gap-2.5 rounded-b-lg">
        <p className="flex gap-1.5 items-center">
          <Calendar />
          Friday 9th May
        </p>
        <p className="flex gap-1.5 items-center">
          <Clock />
          18:00–19:00
        </p>
        <p className="flex gap-1.5 items-center">
          <MapPin />
          Northcott Theatre
        </p>
        <button className="w-full bg-primary text-background px-4 py-2 rounded-sm hover:brightness-110 transition-all">
          Log in or sign up to book
        </button>
      </div>
    </div>
  );
};

export default EventCard;
