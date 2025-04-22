import type { FC } from "react";
import { Link } from "react-router";
import FullPaddedContainer from "~/components/FullPaddedContainer";
import WideButton from "~/components/WideButton";
import MortarBoard from "~/svgs/MortarboardMassive.svg?react";
import { getUniversities } from "~/data/";
import type { Route } from "./+types/Home";

export function loader() {
  const universities = getUniversities();
  return { universities };
}

const Home: FC<Route.ComponentProps> = ({ loaderData }) => {
  const { universities } = loaderData;
  return (
    <FullPaddedContainer flexGap={"gap-9"}>
      <div className="relative flex flex-col items-start gap-4">
        <h1 className="text-5xl w-60 leading-tight">
          Welcome to Campus Collective.
        </h1>
        <MortarBoard className="absolute right-0 top-3 -z-10" />
        <h3 className="text-text-dim w-72">
          The event platform that's <i>for students, by students.</i>
        </h3>
        <p className="text-xl">
          Celebrate and support the best entertainment your campus has to offer
          by getting started below.
        </p>
      </div>
      <div className="flex flex-col gap-4">
        <Link to="/log-in">
          <WideButton>Log In</WideButton>
        </Link>
        <Link to="/sign-up">
          <WideButton colour="secondary">Sign Up</WideButton>
        </Link>
      </div>
      <p className="text-xl">
        <b>Just want to browse?</b> Find your university below to see what's on.
      </p>
      <div className="grid grid-cols-(--home-logo-cols) gap-2">
        {universities.map(({ slug, logo_url }) => (
          <Link
            to={`/${slug}`}
            className="px-8 py-6 hover:bg-[#E9E6DC] flex items-center justify-center rounded-lg transition-all"
          >
            <img className="w-full" src={logo_url} />
          </Link>
        ))}
      </div>
    </FullPaddedContainer>
  );
};

export default Home;
