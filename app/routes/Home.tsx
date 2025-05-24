import { data, Form, Link, useFetcher } from "react-router";
import PaddedContainer from "~/components/PaddedContainer";
import WideButton from "~/components/WideButton";
import MortarBoard from "~/svgs/MortarboardMassive.svg?react";
import type { Route } from "./+types/Home";
import { db } from "src/db";
import { universitiesTable } from "src/db/schema/universities";
import { getSupabaseClient } from "~/auth/supabase.server";
import { SelectWithIcon } from "~/components/InputWithIcon";
import { Squircle } from "ldrs/react";
import "ldrs/react/Squircle.css";

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
      id: universitiesTable.id,
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
    logoUrl: `${process.env.S3_STORAGE_URL}/storage/v1/object/public${uni.logoUrl}`,
  }));

  return data({ universities, user }, { headers });
}

const NewUser = () => {
  return (
    <div className="flex flex-col w-full blur-right">
      <div className="w-full relative flex flex-col items-start gap-4">
        <h1 className="w-60 leading-tight">Welcome to Campus Collective.</h1>
        <MortarBoard className="absolute right-0 top-1/5 -z-10 w-31/45 -translate-y-1/3" />
        <h3 className="text-text-dim w-72">
          The event platform that's <i>for students, by students.</i>
        </h3>
        <p className="text-xl max-w-90">
          Celebrate and support the best entertainment your campus has to offer
          by getting started below.
        </p>
      </div>
      <div className="flex flex-col xs:flex-row gap-4 w-[min(40rem,100%)] py-9">
        <Link to="/log-in" className="w-full">
          <WideButton>Log In</WideButton>
        </Link>
        <Link to="/sign-up" className="w-full">
          <WideButton colour="secondary">Sign Up</WideButton>
        </Link>
      </div>
      <p className="w-full text-xl">
        <b>Just want to browse?</b> Find your university below to see what's on.
      </p>
    </div>
  );
};

const WelcomeBack = ({
  universities,
  user,
}: {
  universities: Route.ComponentProps["loaderData"]["universities"];
  user: Route.ComponentProps["loaderData"]["user"];
}) => {
  let fetcher = useFetcher();
  console.log(fetcher.data);
  return (
    <>
      <div className="flex flex-col gap-4 w-full text-lg">
        <h1 className="leading-tight w-full">Welcome back!</h1>
        <p className="text-lg">
          Get started with exploring the best your uni has to offer by finding
          it below.
        </p>
        {!user?.user_metadata?.university && (
          <>
            <p className="text-lg">
              <b>Do you go to one of the universities below?</b> Save it here so
              you can be taken straight to its events page every time you log
              in. You can always change it on your profile page.
            </p>
            <fetcher.Form
              method="post"
              action="/profile/update-university"
              className="flex gap-3 text-base"
            >
              <div className="w-max h-10 text-lg">
                <SelectWithIcon iconSize="large" name="universityId">
                  <option value={-1} selected disabled>
                    Select University
                  </option>
                  {universities.map((uni) => (
                    <option key={uni.id} value={uni.id} className="px-2">
                      {uni.name}
                    </option>
                  ))}
                </SelectWithIcon>
              </div>
              <WideButton
                type="submit"
                colour="secondary"
                className="w-fit"
                disabled={fetcher.state !== "idle"}
                buttonWidth="w-20"
              >
                {fetcher.state === "idle" ? (
                  "Save"
                ) : (
                  <Squircle color="#4BA590" size={16} stroke={2.5} />
                )}
              </WideButton>
            </fetcher.Form>
          </>
        )}
      </div>
    </>
  );
};

const Home = ({ loaderData }: Route.ComponentProps) => {
  const { universities, user } = loaderData;
  return (
    <PaddedContainer flexGap="gap-9">
      {user ? (
        <WelcomeBack universities={universities} user={user} />
      ) : (
        <NewUser />
      )}
      <div className="w-full grid grid-cols-(--home-logo-cols) gap-2">
        {universities?.map(({ slug, logoUrl }) => (
          <Link
            to={`/${slug}/events`}
            className="px-8 py-6 hover:bg-background-dim flex items-center justify-center rounded-lg transition-all"
            key={slug}
          >
            <img className="w-full" src={logoUrl} />
          </Link>
        ))}
      </div>
    </PaddedContainer>
  );
};

export default Home;
