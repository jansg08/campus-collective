import PaddedContainer from "~/components/PaddedContainer";
import Chevron from "~/svgs/ChevronSmall.svg?react";
import Minimise from "~/svgs/Minimise.svg?react";
import PlusCircle from "~/svgs/PlusCircle.svg?react";
import { useEffect, useRef, useState } from "react";
import { Grid } from "ldrs/react";
import "ldrs/react/Grid.css";
import type { LeafletMapProps } from "~/components/LeafletMap";
import type { Route } from "./+types/EventListing";
import { db } from "src/db";
import { eventsTable } from "src/db/schema/events";
import { venuesTable } from "src/db/schema/venues";
import { categoriesTable } from "src/db/schema/categories";
import { Link, Outlet } from "react-router";
import { and, eq } from "drizzle-orm";
import { universitiesTable } from "src/db/schema/universities";
import { data } from "react-router";
import formatPrice from "~/utils/formatPrice";
import EventDetails, { LinkedVenue } from "~/components/EventDetails";
import WideButton from "~/components/WideButton";
import { getSupabaseClient } from "~/auth/supabase.server";
import SquareButton from "~/components/SquareButton";
import { bookingsTable } from "src/db/schema/bookings";
import { generateIcsFile } from "~/utils/generateIcsFile";

export const loader = async ({ request, params }: Route.LoaderArgs) => {
  const { supabase, headers } = getSupabaseClient(request);
  const {
    data: { user },
    error,
  } = await supabase.auth.getUser();
  const eventId = Number(params.eventId);
  const eventQuery = db
    .select({
      id: eventsTable.id,
      img: eventsTable.coverPhotoUrl,
      defaultImg: categoriesTable.coverPhotoUrl,
      title: eventsTable.title,
      description: eventsTable.description,
      price: eventsTable.ticketPrice,
      startTime: eventsTable.startTime,
      endTime: eventsTable.endTime,
      venueName: venuesTable.name,
      venueCoordinates: venuesTable.location,
      categoryId: categoriesTable.id,
      categoryName: categoriesTable.name,
      uniSlug: universitiesTable.slug,
      uniName: universitiesTable.name,
    })
    .from(eventsTable)
    .innerJoin(venuesTable, eq(eventsTable.venueId, venuesTable.id))
    .innerJoin(categoriesTable, eq(eventsTable.categoryId, categoriesTable.id))
    .innerJoin(
      universitiesTable,
      eq(venuesTable.universityId, universitiesTable.id)
    )
    .where(eq(eventsTable.id, eventId));

  const bookingQuery = user
    ? db
        .select({
          eventId: bookingsTable.eventId,
          userId: bookingsTable.userId,
          dateBooked: bookingsTable.dateBooked,
        })
        .from(bookingsTable)
        .where(
          and(
            eq(bookingsTable.eventId, eventId),
            eq(bookingsTable.userId, user?.id)
          )
        )
    : null;

  const [[eventResult], bookingResult = null] = (await Promise.all([
    eventQuery,
    ...(bookingQuery ? [bookingQuery] : []),
  ])) as [Awaited<typeof eventQuery>, Awaited<typeof bookingQuery> | null];

  const {
    categoryName,
    categoryId,
    uniName,
    uniSlug,
    img,
    defaultImg,
    price,
    venueName,
    venueCoordinates,
    ...rest
  } = eventResult;

  const responseBody = {
    user,
    category: {
      name: categoryName,
      id: categoryId,
    },
    university: {
      name: uniName,
      slug: uniSlug,
    },
    venue: {
      name: venueName,
      coords: venueCoordinates,
    },
    event: { img, price: price / 100, ...rest },
    dateBooked: bookingResult?.length ? bookingResult[0].dateBooked : null,
  };

  if (!img) {
    responseBody.event.img = defaultImg;
  }

  return data(responseBody, { headers });
};

const EventListing = ({ loaderData }: Route.ComponentProps) => {
  const {
    user,
    event,
    category,
    university,
    venue: { name: venueName, coords: venueCoords },
    venue,
    dateBooked,
  } = loaderData;

  const [MapComponent, setMapComponent] =
    useState<React.FC<LeafletMapProps> | null>(null);
  const [mapExpanded, setMapExpanded] = useState(false);
  const mapRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    import("~/components/LeafletMap").then((mod) =>
      setMapComponent(() => mod.LeafletMap)
    );
  });

  useEffect(() => {
    if (mapExpanded && mapRef.current) {
      mapRef.current.scrollIntoView({ behavior: "smooth", block: "start" });
    }
  }, [mapExpanded]);
  return (
    <>
      <div
        style={{
          backgroundImage: `url(${event.img})`,
        }}
        className="h-64 w-full bg-cover bg-center fixed -z-10 top-20"
      />
      <PaddedContainer
        margin="mt-56"
        background="bg-background"
        shadow="shadow-above"
        flexGap="gap-6"
      >
        <Outlet context={{ event: { ...event, venue } }} />
        <div className="w-full flex items-center justify-start gap-1 text-text-dim text-sm">
          <Link
            to={`/${university.slug}/events`}
            className="underline hover:text-text"
          >
            {university.name}
          </Link>
          <Chevron stroke="#4ba590" className="rotate-270 w-2" />
          <Link
            to={`/${university.slug}/events?category=${category.id}`}
            className="underline hover:text-text"
          >
            {category.name}
          </Link>
        </div>
        <div className="w-full flex flex-col gap-6 md:flex-row md:gap-6">
          <div className="w-full flex flex-col gap-6 ">
            <div className="w-full flex flex-col gap-2 leading-none">
              <h2 className="font-bold">{event.title}</h2>
              <h3 className="font-bold text-text-dim">
                {formatPrice(event.price)}
              </h3>
            </div>
            <div className="w-full flex items-center justify-start">
              <WideButton
                isLink={!dateBooked}
                path={
                  user
                    ? `/${university.slug}/events/${event.id}/confirm`
                    : "/log-in"
                }
                colour={dateBooked ? "secondary" : "primary"}
                onClick={
                  dateBooked
                    ? () =>
                        generateIcsFile({
                          title: event.title,
                          description: event.description,
                          venue,
                          startTime: event.startTime,
                          endTime: event.endTime,
                        })
                    : undefined
                }
                buttonWidth="w-[min(100%,30rem)]"
              >
                {dateBooked && <PlusCircle stroke="#044c3b" />}
                {user
                  ? dateBooked
                    ? "Add to Calendar"
                    : "Book Now"
                  : "Log in to book"}
              </WideButton>
            </div>
            <div className="text-sm w-full">
              <p>{event.description}</p>
            </div>
            <EventDetails
              startTime={event.startTime}
              endTime={event.endTime}
              venue={venueName}
              venueLinked
              university={university.name}
            />
          </div>
          <div
            className={`w-full aspect-square flex items-center justify-center rounded-lg relative z-0 shadow-lg ${
              mapExpanded || "expand-map h-48 md:h-72"
            }`}
            ref={mapRef}
            onClick={({ target }) => {
              if (target instanceof HTMLElement) {
                if (
                  !(target.tagName === "svg") &&
                  !(target.tagName === "BUTTON")
                ) {
                  setMapExpanded(true);
                }
              }
            }}
          >
            {venueCoords && MapComponent ? (
              <MapComponent
                center={[venueCoords.y, venueCoords.x]}
                borderRadius="8px"
                popUpContent={
                  <LinkedVenue venue={venueName} university={university.name} />
                }
                expanded={mapExpanded}
              />
            ) : (
              <Grid color="#4BA590" size={72} />
            )}
            {mapExpanded && (
              <SquareButton
                colour="primary"
                size="smaller"
                position="absolute"
                top="top-5"
                right="right-5"
                zIndex="z-400"
                onClick={() => setMapExpanded(false)}
              >
                <Minimise stroke="#f7f4e9" />
              </SquareButton>
            )}
          </div>
        </div>
      </PaddedContainer>
    </>
  );
};

export default EventListing;
