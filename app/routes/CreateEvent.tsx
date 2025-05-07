import {
  SelectWithIcon,
  InputWithIcon,
  TextareaWithIcon,
  DatePickerWithIcon,
} from "~/components/InputWithIcon";
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
import { useRef, useState } from "react";
import { db } from "src/db";
import { venueAuthoritiesTable } from "src/db/schema/venueAuthorities";
import { venuesTable } from "src/db/schema/venues";
import { universitiesTable } from "src/db/schema/universities";
import { eq } from "drizzle-orm";
import WideButton from "~/components/WideButton";

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
    )
    .where(eq(venueAuthoritiesTable.userId, user.id));

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
  const [isUniversitySelected, setIsUniversitySelected] = useState(
    universities.length === 1
  );
  const [startDate, setStartDate] = useState<Date | null>(null);
  const [endDate, setEndDate] = useState<Date | null>(null);
  const descriptionRef = useRef<HTMLTextAreaElement>(null);

  const handleDescriptionHeight = () => {
    const el = descriptionRef.current;
    if (el) {
      el.style.height = "";
      el.style.height = el.scrollHeight + "px";
    }
  };

  return (
    <PaddedContainer>
      <Form method="post" className="flex flex-col gap-5 items-center">
        <h2 className="font-bold">Create an Event</h2>
        <SelectWithIcon
          key="universitySelect"
          icon={<MortarBoard stroke="#044c3b" />}
          iconSize="large"
          name="university"
          id="universitySelect"
          onChange={(e) =>
            e.target.value !== "-1" && setIsUniversitySelected(true)
          }
        >
          <option value={-1} selected={universities.length !== 1} disabled>
            Select University
          </option>
          {universities.map((uni) => (
            <option value={uni.id} key={uni.id}>
              {uni.name}
            </option>
          ))}
        </SelectWithIcon>
        <SelectWithIcon
          key="venueSelect"
          icon={<MapPin stroke="#044c3b" />}
          iconSize="normal"
          name="venue"
          disabled={!isUniversitySelected}
        >
          <option disabled selected={venues.length !== 1}>
            Select Venue
          </option>
          {venues.map((venue) => (
            <option value={venue.id} key={venue.id}>
              {venue.name}
            </option>
          ))}
        </SelectWithIcon>
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
        <TextareaWithIcon
          icon={<Description stroke="#044c3b" />}
          name="description"
          placeholder="Description"
          cannotResize
          rows={3}
          required
          ref={descriptionRef}
          onInput={handleDescriptionHeight}
        />
        <DatePickerWithIcon
          icon={<DateFrom stroke="#044c3b" />}
          selected={startDate}
          onChange={(date: Date) => setStartDate(date)}
          placeholderText="Start date and time"
          minDate={new Date()}
          showTimeSelect
          dateFormat="iiii do MMMM y @ hh:mm aa"
          timeIntervals={5}
          id="startDatePicker"
        />
        <input
          name="startDate"
          type="hidden"
          value={startDate ? startDate.toISOString() : ""}
        />
        <DatePickerWithIcon
          icon={<DateTo stroke="#044c3b" />}
          selected={endDate}
          onChange={(date: Date) => setEndDate(date)}
          placeholderText="End date and time"
          minDate={startDate || new Date()}
          showTimeSelect
          dateFormat="iiii do MMMM y @ hh:mm aa"
          timeIntervals={5}
          id="endDatePicker"
        />
        <input
          name="endDate"
          type="hidden"
          value={endDate ? endDate.toISOString() : ""}
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
