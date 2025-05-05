import PaddedContainer from "~/components/PaddedContainer";
import Chevron from "~/svgs/ChevronSmall.svg?react";
import { useEffect, useRef, useState } from "react";
import { Grid } from "ldrs/react";
import "ldrs/react/Grid.css";
import type { LeafletMapProps } from "~/components/LeafletMap";
import type { Route } from "./+types/EventListing";
import { db } from "src/db";
import { eventsTable } from "src/db/schema/events";
import { venuesTable } from "src/db/schema/venues";
import { categoriesTable } from "src/db/schema/categories";
import { Link } from "react-router";
import { eq } from "drizzle-orm";
import { universitiesTable } from "src/db/schema/universities";
import { data } from "react-router";
import formatPrice from "~/utils/formatPrice";
import EventDetails, { LinkedVenue } from "~/components/EventDetails";
import WideButton from "~/components/WideButton";

export const loader = async ({ request }: Route.LoaderArgs) => {
  const [eventResult] = await db
    .select({
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
    .where(eq(eventsTable.id, 1));

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
  };

  if (!img) {
    responseBody.event.img = defaultImg;
  }

  return data(responseBody);
};

const EventListing = ({ loaderData }: Route.ComponentProps) => {
  const {
    event,
    category,
    university,
    venue: { name: venueName, coords: venueCoords },
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
        <div className="w-full flex items-center justify-start gap-1 text-text-dim text-sm">
          <Link
            to={`/${university.slug}/events`}
            className="underline hover:text-text"
          >
            {university.name}
          </Link>
          <Chevron stroke="#4ba590" className="rotate-270 w-2" />
          <Link
            to={`${university.name}/events?category=${category.id}`}
            className="underline hover:text-text"
          >
            {category.name}
          </Link>
        </div>
        <div className="w-full flex flex-col gap-2 leading-none">
          <h2 className="font-bold">{event.title}</h2>
          <h3 className="font-bold text-text-dim">
            {formatPrice(event.price)}
          </h3>
        </div>
        <WideButton>Book Now</WideButton>
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
        <div
          className={`w-full aspect-square flex items-center justify-center rounded-lg relative z-0 shadow-lg ${
            mapExpanded || "expand-map"
          }`}
          ref={mapRef}
          onClick={() => setMapExpanded(true)}
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
        </div>
      </PaddedContainer>
    </>
  );
};

export default EventListing;
