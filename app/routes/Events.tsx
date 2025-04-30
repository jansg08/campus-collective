import type { FC } from "react";
import { Form } from "react-router";
import EventCard from "~/components/EventCard";
import FullPaddedContainer from "~/components/FullPaddedContainer";
import InputWithIcon from "~/components/InputWithIcon";
import SquareButton from "~/components/SquareButton";
import ChevronSmall from "~/svgs/ChevronSmall.svg?react";
import Filter from "~/svgs/Filter.svg?react";
import Search from "~/svgs/Search.svg?react";

const Events = () => {
  return (
    <FullPaddedContainer>
      <div className="w-full">
        <p className="text-sm text-text-dim">Viewing events for</p>
        <div className="flex items-center gap-1">
          <img
            src="https://2d839da61aa3e49bb48e-619b260bfa343946dfd400ce4b125a79.ssl.cf3.rackcdn.com/Logo_100644.png"
            className="size-6 inline rounded-full"
          />
          <button className="flex items-center gap-1.5 text-2xl rounded-sm hover:bg-gray-200 px-1 transition-all">
            University of Exeter
            <ChevronSmall stroke="#044c3b" />
          </button>
        </div>
      </div>
      <div className="flex gap-3 w-full">
        <SquareButton type="secondary">
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
      <EventCard />
    </FullPaddedContainer>
  );
};

export default Events;
