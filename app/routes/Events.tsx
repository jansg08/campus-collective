import { eq } from "drizzle-orm";
import { useRef, useState } from "react";
import { data, Form, NavLink } from "react-router";
import { db } from "src/db";
import { categoriesTable } from "src/db/schema/categories";
import { eventsTable } from "src/db/schema/events";
import { venuesTable } from "src/db/schema/venues";
import EventCard from "~/components/EventCard";
import InputWithIcon from "~/components/InputWithIcon";
import SquareButton from "~/components/SquareButton";
import ChevronSmall from "~/svgs/ChevronSmall.svg?react";
import Filter from "~/svgs/Filter.svg?react";
import Search from "~/svgs/Search.svg?react";
import Tick from "~/svgs/Tick.svg?react";
import { Squircle } from "ldrs/react";
import "ldrs/react/Squircle.css";
import type { Route } from "./+types/Events";
import { universitiesTable } from "src/db/schema/universities";
import useOutsideClick from "~/utils/useOutSideClick";

interface University {
  id: number;
  name: string;
  crestUrl: string;
  slug: string;
}

interface UniversitiesDropdownProps {
  universities: University[];
  selected: number;
}

export const loader = async ({ params }: Route.LoaderArgs) => {
  const { universitySlug } = params;
  const eventsQuery = db
    .select({
      id: eventsTable.id,
      eventPhotoUrl: eventsTable.coverPhotoUrl,
      price: eventsTable.ticketPrice,
      title: eventsTable.title,
      startTime: eventsTable.startTime,
      endTime: eventsTable.endTime,
      venue: venuesTable.name,
      defaultPhotoUrl: categoriesTable.coverPhotoUrl,
      uniId: universitiesTable.id,
    })
    .from(eventsTable)
    .innerJoin(venuesTable, eq(eventsTable.venueId, venuesTable.id))
    .innerJoin(categoriesTable, eq(eventsTable.categoryId, categoriesTable.id))
    .innerJoin(
      universitiesTable,
      eq(venuesTable.universityId, universitiesTable.id)
    )
    .where(eq(universitiesTable.slug, universitySlug));

  const uniQuery = db
    .select({
      id: universitiesTable.id,
      name: universitiesTable.name,
      crestUrl: universitiesTable.crestUrl,
      slug: universitiesTable.slug,
    })
    .from(universitiesTable)
    .orderBy(universitiesTable.slug);

  const [eventResults, uniResults] = await Promise.all([eventsQuery, uniQuery]);

  const events = eventResults.map(
    ({ eventPhotoUrl, defaultPhotoUrl, price, ...rest }) => ({
      photoUrl: eventPhotoUrl ?? defaultPhotoUrl,
      price: price / 100,
      ...rest,
    })
  );

  const selectedUni = uniResults.findIndex(
    ({ slug }) => slug === universitySlug
  );

  const universities = uniResults.map(({ crestUrl, ...rest }) => ({
    crestUrl: `http://127.0.0.1:54321/storage/v1/object/public${crestUrl}`,
    ...rest,
  }));

  return data({
    events,
    universities,
    selectedUni,
  });
};

const UniversitiesDropdown = ({
  universities,
  selected,
}: UniversitiesDropdownProps) => {
  const [isOpen, setIsOpen] = useState(false);
  const { crestUrl: currentUniCrest, name: currentUniName } =
    universities[selected];

  const dropdownRef = useRef<HTMLUListElement>(null!);
  useOutsideClick({
    ref: dropdownRef,
    handler: () => setIsOpen(false),
  });
  return (
    <div
      className={`flex items-center gap-1 relative w-fit transition-all ml-4 px-1 ${
        isOpen ? "bg-gray-200" : "hover:bg-gray-200"
      } rounded-sm`}
    >
      <img src={currentUniCrest} className="size-6 inline rounded-full" />
      <button
        className="flex items-center gap-1.5 text-2xl  px-1"
        onClick={() => setIsOpen(true)}
      >
        <span className="text-start">{currentUniName}</span>
        <ChevronSmall stroke="#044c3b" />
      </button>
      {isOpen && (
        <ul
          className="absolute z-10 top-[calc(100%+var(--spacing))] left-0 max-h-[40vh] box-border w-fit overflow-y-auto bg-background-light py-1.5 rounded-lg flex flex-col shadow-lg"
          ref={dropdownRef}
        >
          {universities.map(({ name, crestUrl, slug, id }) => (
            <li key={id}>
              <NavLink
                to={`/${slug}/events`}
                className="flex items-center gap-1.5 py-1.5 px-3 hover hover:bg-[#E9E6DC] transition-all"
              >
                {({ isActive, isPending }) => (
                  <>
                    <img
                      src={crestUrl}
                      className="size-6 inline rounded-full"
                    />
                    <span className="leading-normal min-w-32">{name}</span>
                    {isActive && <Tick stroke="#4BA590" />}
                    {isPending && (
                      <Squircle color="#4BA590" size={12} stroke={2} />
                    )}
                  </>
                )}
              </NavLink>
            </li>
          ))}
        </ul>
      )}
    </div>
  );
};

const Events = ({ loaderData }: Route.ComponentProps) => {
  const { events, universities, selectedUni } = loaderData;
  return (
    <div className="flex flex-col">
      <div className="w-full pt-5">
        <p className="text-sm text-text-dim px-5">Viewing events for</p>
        <UniversitiesDropdown
          universities={universities}
          selected={selectedUni}
        />
      </div>
      <div className="flex gap-3 w-full sticky top-20 p-5 blur-down">
        <SquareButton colour="secondary">
          <Filter stroke="#044c3b" />
        </SquareButton>
        <Form className="w-full">
          <InputWithIcon
            icon={<Search stroke="#044c3b" />}
            name="search"
            placeholder="Search events"
            type="text"
          />
        </Form>
      </div>
      <ul className="grid grid-cols-(--event-card-cols) gap-5 px-5">
        {events.map(({ id, ...rest }) => (
          <li key={id}>
            <EventCard {...rest} />
          </li>
        ))}
      </ul>
    </div>
  );
};

export default Events;
