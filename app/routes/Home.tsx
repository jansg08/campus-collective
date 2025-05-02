import { data, Link } from "react-router";
import FullPaddedContainer from "~/components/FullPaddedContainer";
import WideButton from "~/components/WideButton";
import MortarBoard from "~/svgs/MortarboardMassive.svg?react";
import { getUniversities } from "~/data/";
import type { Route } from "./+types/Home";
import { db } from "src/db";
import { universitiesTable } from "src/db/schema/universities";
import { getSupabaseClient } from "~/auth/supabase.server";
import { asc, desc } from "drizzle-orm";

export function meta() {
  return [
    {
      title: "Campus Collective: Your Student Event Platform",
    },
    {
      name: "description",
      content:
        "A place for students to showcase their talent or support others. Explore all the events your uni has to offer.",
    },
  ];
}

export async function loader({ request }: Route.LoaderArgs) {
  const { supabase, headers } = getSupabaseClient(request);
  const userPromise = supabase.auth.getUser();
  const resultPromise = db
    .select({
      logoUrl: universitiesTable.logoUrl,
      name: universitiesTable.name,
      slug: universitiesTable.slug,
    })
    .from(universitiesTable)
    .orderBy(universitiesTable.slug);

  const [
    {
      data: { user },
    },
    result,
  ] = await Promise.all([userPromise, resultPromise]);

  //! domain needs to be changed to an env variable

  const universities = result.map((uni) => ({
    ...uni,
    logoUrl: `http://127.0.0.1:54321/storage/v1/object/public${uni.logoUrl}`,
  }));

  return data({ universities, user }, { headers });
}

const NewUser = () => {
  return (
    <>
      <div className="relative flex flex-col items-start gap-4">
        <h1 className="w-60 leading-tight">Welcome to Campus Collective.</h1>
        <MortarBoard className="absolute right-0 top-3 -z-10" />
        <h3 className="text-text-dim w-72">
          The event platform that's <i>for students, by students.</i>
        </h3>
        <p className="text-xl">
          Celebrate and support the best entertainment your campus has to offer
          by getting started below.
        </p>
      </div>
      <div className="flex flex-col gap-4 w-full">
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
    </>
  );
};

const WelcomeBack = () => {
  return (
    <>
      <h1 className="leading-tight w-full">Welcome back!</h1>
      <p>
        Get started with exploring the best your uni has to offer by finding it
        below.
      </p>
    </>
  );
};

const Home = ({ loaderData }: Route.ComponentProps) => {
  const { universities, user } = loaderData;
  return (
    <FullPaddedContainer flexGap="gap-9">
      {user ? <WelcomeBack /> : <NewUser />}
      <div className="w-full grid grid-cols-(--home-logo-cols) gap-2">
        {universities?.map(({ slug, logoUrl }) => (
          <Link
            to={`/${slug}/events`}
            className="px-8 py-6 hover:bg-[#E9E6DC] flex items-center justify-center rounded-lg transition-all"
            key={slug}
          >
            <img className="w-full" src={logoUrl} />
          </Link>
        ))}
      </div>
    </FullPaddedContainer>
  );
};

export default Home;
