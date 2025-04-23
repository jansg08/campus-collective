import type { FC } from "react";
import { Form } from "react-router";
import EventCard from "~/components/EventCard";
import FullPaddedContainer from "~/components/FullPaddedContainer";
import SquareButton from "~/components/SquareButton";
import ChevronSmall from "~/svgs/ChevronSmall.svg?react";
import Filter from "~/svgs/Filter.svg?react";
import Search from "~/svgs/Search.svg?react";

const Events = () => {
  return (
    <FullPaddedContainer>
      <div className="">
        <p className="text-sm text-text-dim">Viewing events for</p>
        <div className="flex items-center gap-1">
          <img
            src="https://2d839da61aa3e49bb48e-619b260bfa343946dfd400ce4b125a79.ssl.cf3.rackcdn.com/Logo_100644.png"
            className="size-6 inline rounded-full"
          />
          <button className="flex items-center gap-1.5 text-2xl rounded-sm hover:bg-gray-200 px-1 transition-all">
            University of Exeter
            <ChevronSmall />
          </button>
        </div>
      </div>
      <div className="flex gap-3 w-full">
        <SquareButton type="secondary">
          <Filter />
        </SquareButton>
        <Form className="w-full">
          <div className="bg-background-light rounded-lg w-full h-10 shadow-md py-1 pr-1 pl-4 flex justify-end items-center">
            <input
              className="w-full outline-0"
              name="search"
              placeholder="Search events"
            />
            <div className="rounded-sm p-1.5 bg-secondary">
              <Search />
            </div>
          </div>
        </Form>
      </div>
      <EventCard />
    </FullPaddedContainer>
  );
};

export default Events;
