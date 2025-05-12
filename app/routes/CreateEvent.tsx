import {
  SelectWithIcon,
  InputWithIcon,
  TextareaWithIcon,
  DatePickerWithIcon,
} from "~/components/InputWithIcon";
import PaddedContainer from "~/components/PaddedContainer";
import MortarBoard from "~/svgs/MortarboardBig.svg?react";
import MapPin from "~/svgs/MapPinBig.svg?react";
import User from "~/svgs/User.svg?react";
import Camera from "~/svgs/CameraBig.svg?react";
import Title from "~/svgs/TitleBig.svg?react";
import Description from "~/svgs/DescriptionBig.svg?react";
import Categories from "~/svgs/Categories.svg?react";
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
import { eq, sql } from "drizzle-orm";
import WideButton from "~/components/WideButton";
import { handleFormSubmit, handleInvalid } from "~/utils/formValidation";
import { categoriesTable } from "src/db/schema/categories";
import { eventsTable } from "src/db/schema/events";

interface CreateEventFormErrors {
  title: string;
  description: string;
  startDate: string;
  endDate: string;
  ticketPrice: string;
  [key: string]: string;
}

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

  const uniAndVenuesQuery = db
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

  const usersQuery = db.execute(
    sql`SELECT id, email FROM auth.users ORDER BY email ASC`
  );

  const categoriesQuery = db
    .select({ name: categoriesTable.name, id: categoriesTable.id })
    .from(categoriesTable);

  const [uniAndVenuesResult, usersResult, categoriesResult] = await Promise.all(
    [uniAndVenuesQuery, usersQuery, categoriesQuery]
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
    users: usersResult,
    categories: categoriesResult,
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
    description: String(formData.get("description")),
    startTime: new Date(formData.get("startDate") as string),
    endTime: new Date(formData.get("endDate") as string),
    venueId: Number(formData.get("venue")),
    ticketPrice: Number(formData.get("ticketPrice")),
    host: String(formData.get("host")),
    creator: user.id,
    // ! create input to capture values
    isListed: true,
    isPublic: true,
    categoryId: Number(formData.get("category")),
  };

  try {
    await db.insert(eventsTable).values(insertValues);
  } catch (err) {
    return data({ err }, { headers });
  }
};

const CreateEvent = ({ loaderData }: Route.ComponentProps) => {
  const { universities, venues, users, categories } = loaderData;
  const [photoName, setPhotoName] = useState("");
  const [isUniversitySelected, setIsUniversitySelected] = useState(
    universities.length === 1
  );
  const [startDate, setStartDate] = useState<Date | null>(null);
  const [endDate, setEndDate] = useState<Date | null>(null);
  const [clientErrors, setClientErrors] = useState<CreateEventFormErrors>({
    venue: "",
    host: "",
    title: "",
    description: "",
    category: "",
    startDate: "",
    endDate: "",
    ticketPrice: "",
  });
  return (
    <PaddedContainer>
      <Form
        method="post"
        className="flex flex-col gap-5 items-center"
        onSubmit={handleFormSubmit<CreateEventFormErrors>(setClientErrors)}
        onInvalid={handleInvalid}
        noValidate
      >
        <h2 className="font-bold">Create an Event</h2>
        <SelectWithIcon
          key="universitySelect"
          icon={<MortarBoard stroke="#044c3b" />}
          iconSize="large"
          name="university"
          id="universitySelect"
          onChange={(e) =>
            setIsUniversitySelected(e.target.value !== "-1" ? true : false)
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
          name="venue"
          disabled={!isUniversitySelected}
          error={clientErrors.venue}
          hoverMsg={
            isUniversitySelected
              ? ""
              : "Please select the university to get available venues"
          }
        >
          <option disabled selected={venues.length !== 1} value={-1}>
            Select Venue
          </option>
          {venues.map((venue) => (
            <option value={venue.id} key={venue.id}>
              {venue.name}
            </option>
          ))}
        </SelectWithIcon>
        <SelectWithIcon
          key="hostSelect"
          icon={<User stroke="#044c3b" width={20} height={20} />}
          name="host"
          error={clientErrors.host}
        >
          <option disabled selected value={-1}>
            Select Host
          </option>
          {users.map((user) => (
            <option value={user.id} key={user.id}>
              {user.email}
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
          setPhotoName(e.target.value.match(/(?<=C:\\fakepath\\).+/gi)?.join() || "")
          }
          /> */}
        <InputWithIcon
          icon={<Title stroke="#044c3b" />}
          name="title"
          id="titleInput"
          placeholder="Title"
          required
          error={clientErrors.title}
        />
        <TextareaWithIcon
          icon={<Description stroke="#044c3b" />}
          name="description"
          id="descriptionTextarea"
          placeholder="Description"
          cannotResize
          rows={3}
          error={clientErrors.description}
        />
        <SelectWithIcon
          key="categorySelect"
          icon={<Categories stroke="#044c3b" />}
          name="category"
          error={clientErrors.category}
        >
          <option disabled selected value={-1}>
            Select Category
          </option>
          {categories.map((category) => (
            <option value={category.id} key={category.id}>
              {category.name}
            </option>
          ))}
        </SelectWithIcon>
        <DatePickerWithIcon
          icon={<DateFrom stroke="#044c3b" />}
          selected={startDate}
          onChange={(date: Date) => setStartDate(date)}
          placeholderText="Start date and time"
          minDate={new Date()}
          showTimeSelect
          dateFormat="iiii do MMMM y @ hh:mm aa"
          timeIntervals={5}
          required
          isClearable
          id="startDatePicker"
          name="start_date"
          error={clientErrors.start_date}
        />
        <input
          name="startDate"
          type="hidden"
          required
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
          required
          isClearable
          name="end_date"
          id="endDatePicker"
          error={clientErrors.end_date}
        />
        <input
          name="endDate"
          type="hidden"
          required
          value={endDate ? endDate.toISOString() : ""}
        />
        <InputWithIcon
          icon={<CreditCard stroke="#044c3b" />}
          name="ticketPrice"
          id="ticketPriceInput"
          type="number"
          placeholder="Ticket Price"
          isMoney
          required
          error={clientErrors.ticketPrice}
        />
        <WideButton colour="primary" type="submit">
          Create Event
        </WideButton>
      </Form>
    </PaddedContainer>
  );
};

export default CreateEvent;
