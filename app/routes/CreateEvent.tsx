import InputWithIcon from "~/components/InputWithIcon";
import PaddedContainer from "~/components/PaddedContainer";
import MortarBoard from "~/svgs/MortarboardBig.svg?react";
import MapPin from "~/svgs/MapPinBig.svg?react";
import Camera from "~/svgs/CameraBig.svg?react";
import Title from "~/svgs/TitleBig.svg?react";
import Description from "~/svgs/DescriptionBig.svg?react";
import DateFrom from "~/svgs/DateFromBig.svg?react";
import DateTo from "~/svgs/DateToBig.svg?react";
import CreditCard from "~/svgs/CreditCardBig.svg?react";
import type { Route } from "./+types/CreateEvent";
import { getSupabaseClient } from "~/auth/supabase.server";
import { data, Form, redirect } from "react-router";
import { useState } from "react";
import { db } from "src/db";
import { venueAuthoritiesTable } from "src/db/schema/venueAuthorities";
import { venuesTable } from "src/db/schema/venues";
import { universitiesTable } from "src/db/schema/universities";
import { eq } from "drizzle-orm";
import WideButton from "~/components/WideButton";

interface CreateEventProps {}

export const loader = async ({ request }: Route.LoaderArgs) => {
  const { supabase, headers } = getSupabaseClient(request);
  const {
    data: { user },
    error,
  } = await supabase.auth.getUser();
  if (!user) {
    throw redirect("/log-in", { headers });
  }
  if (!user?.user_metadata.is_staff) {
    throw redirect("/", { headers });
  }

  const uniAndVenuesResult = await db
    .select({
      venueId: venueAuthoritiesTable.venueId,
      venueName: venuesTable.name,
      universityId: venuesTable.universityId,
      universityName: universitiesTable.name,
    })
    .from(venueAuthoritiesTable)
    .innerJoin(venuesTable, eq(venueAuthoritiesTable.venueId, venuesTable.id))
    .innerJoin(
      universitiesTable,
      eq(venuesTable.universityId, universitiesTable.id)
    );

  const responseBody = {
    universities: uniAndVenuesResult
      .map(({ universityId, universityName }) => ({
        id: universityId,
        name: universityName,
      }))
      .filter(({ id }, i, arr) => i === arr.findIndex((rec) => rec.id === id)),
    venues: uniAndVenuesResult.map(({ venueId, venueName }) => ({
      id: venueId,
      name: venueName,
    })),
  };

  return data(responseBody, { headers });
};

export const action = async ({ request }: Route.ActionArgs) => {
  const { supabase, headers } = getSupabaseClient(request);
  const {
    data: { user },
    error,
  } = await supabase.auth.getUser();
  if (!user) {
    throw redirect("/log-in", { headers });
  }
  if (!user?.user_metadata.is_staff) {
    throw redirect("/", { headers });
  }

  const formData = await request.formData();
  const insertValues = {
    title: String(formData.get("title")),
  };
};

const CreateEvent = ({ loaderData }: Route.ComponentProps) => {
  const { universities, venues } = loaderData;
  const [photoName, setPhotoName] = useState("");
  return (
    <PaddedContainer>
      <Form method="post" className="flex flex-col gap-5 items-center">
        <h2 className="font-bold">Create an Event</h2>
        <InputWithIcon
          icon={<MortarBoard stroke="#044c3b" />}
          iconSize="large"
          isSelect
          name="university"
        >
          <option disabled>Select University</option>
          {universities.map((uni) => (
            <option value={uni.id}>{uni.name}</option>
          ))}
        </InputWithIcon>
        <InputWithIcon
          icon={<MapPin stroke="#044c3b" />}
          iconSize="normal"
          isSelect
          name="venue"
        >
          <option disabled>Select Venue</option>
          {venues.map((venue) => (
            <option value={venue.id}>{venue.name}</option>
          ))}
        </InputWithIcon>
        {/* Cover Image File Upload
          <label
          htmlFor="photoUpload"
        className="cursor-pointer flex items-center justify-center flex-col gap-4 bg-background-light w-full h-40 rounded-lg shadow-lg"
        >
        <div className="rounded-md bg-secondary p-1.5">
          <Camera stroke="#044c3b" />
          </div>
          <span className="text-wrap">
          {photoName || "Upload a Cover Photo (optional)"}
          </span>
          </label>
          <input
          type="file"
        name="coverPhoto"
        id="photoUpload"
        className="hidden"
        onChange={(e) =>
          setPhotoName(e.target.value.match(/.+?(?!(\/|\\))/gi)?.join() || "")
          }
          /> */}
        <InputWithIcon
          icon={<Title stroke="#044c3b" />}
          name="title"
          placeholder="Title"
          required
        />
        <InputWithIcon
          isTextArea
          icon={<Description stroke="#044c3b" />}
          name="description"
          placeholder="Description"
          required
        />
        <InputWithIcon
          icon={<DateFrom stroke="#044c3b" />}
          name="startDate"
          type="text"
          placeholder="Event starts..."
          onFocus={(e) => (e.target.type = "date")}
          onBlur={(e) => (e.target.type = "text")}
        />
        <InputWithIcon
          icon={<DateTo stroke="#044c3b" />}
          name="endDate"
          type="text"
          placeholder="Event ends..."
          onFocus={(e) => (e.target.type = "date")}
          onBlur={(e) => (e.target.type = "text")}
        />
        <InputWithIcon
          icon={<CreditCard stroke="#044c3b" />}
          name="ticketPrice"
          type="number"
          placeholder="Ticket Price"
          isMoney
        />
        <WideButton colour="primary" type="submit">
          Create Event
        </WideButton>
      </Form>
    </PaddedContainer>
  );
};

export default CreateEvent;
