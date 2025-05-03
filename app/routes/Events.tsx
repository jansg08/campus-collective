import { eq } from "drizzle-orm";
import type { FC } from "react";
import { data, Form } from "react-router";
import { db } from "src/db";
import { categoriesTable } from "src/db/schema/categories";
import { eventsTable } from "src/db/schema/events";
import { venuesTable } from "src/db/schema/venues";
import EventCard from "~/components/EventCard";
import FullPaddedContainer from "~/components/FullPaddedContainer";
import InputWithIcon from "~/components/InputWithIcon";
import SquareButton from "~/components/SquareButton";
import ChevronSmall from "~/svgs/ChevronSmall.svg?react";
import Filter from "~/svgs/Filter.svg?react";
import Search from "~/svgs/Search.svg?react";
import type { Route } from "./+types/Events";
import { universitiesTable } from "src/db/schema/universities";

export const loader = async ({ params }: Route.LoaderArgs) => {
  const { universitySlug } = params;
  const results = await db
    .select({
      id: eventsTable.id,
      eventPhotoUrl: eventsTable.coverPhotoUrl,
      price: eventsTable.ticketPrice,
      title: eventsTable.title,
      startTime: eventsTable.startTime,
      endTime: eventsTable.endTime,
      venue: venuesTable.name,
      defaultPhotoUrl: categoriesTable.coverPhotoUrl,
      uniName: universitiesTable.name,
      uniCrest: universitiesTable.crestUrl,
    })
    .from(eventsTable)
    .innerJoin(venuesTable, eq(eventsTable.venueId, venuesTable.id))
    .innerJoin(categoriesTable, eq(eventsTable.categoryId, categoriesTable.id))
    .innerJoin(
      universitiesTable,
      eq(venuesTable.universityId, universitiesTable.id)
    )
    .where(eq(universitiesTable.slug, universitySlug));

  const events = results.map(
    ({ eventPhotoUrl, defaultPhotoUrl, price, ...rest }) => ({
      photoUrl: eventPhotoUrl ?? defaultPhotoUrl,
      price: price / 100,
      ...rest,
    })
  );

  return data({
    events,
    university: {
      name: results[0].uniName,
      crestUrl: `http://127.0.0.1:54321/storage/v1/object/public${results[0].uniCrest}`,
    },
  });
};

const Events = ({ loaderData }: Route.ComponentProps) => {
  const {
    events,
    university: { name, crestUrl },
  } = loaderData;
  return (
    <FullPaddedContainer>
      <div className="w-full">
        <p className="text-sm text-text-dim">Viewing events for</p>
        <div className="flex items-center gap-1">
          <img src={crestUrl} className="size-6 inline rounded-full" />
          <button className="flex items-center gap-1.5 text-2xl rounded-sm hover:bg-gray-200 px-1 transition-all">
            <span className="text-start">{name}</span>
            <ChevronSmall stroke="#044c3b" />
          </button>
        </div>
      </div>
      <div className="flex gap-3 w-full">
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
      {events.map(({ id, ...rest }) => (
        <EventCard {...rest} key={id} />
      ))}
    </FullPaddedContainer>
  );
};

export default Events;
