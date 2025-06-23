import { useRef, useState } from "react";
import { data, Link, redirect, useFetcher } from "react-router";
import PaddedContainer from "~/components/PaddedContainer";
import { InputWithIcon } from "~/components/InputWithIcon";
import WideButton from "~/components/WideButton";

import Email from "~/svgs/EmailBig.svg?react";
import Password from "~/svgs/PasswordBig.svg?react";
import { handleFormSubmit, handleInvalid } from "~/utils/formValidation";
import type { Route } from "./+types/LogIn";
import { getSupabaseClient } from "~/auth/supabase.server";
import { eq } from "drizzle-orm";
import { db } from "src/db";
import { universitiesTable } from "src/db/schema/universities";
import { ErrorMessage } from "~/components/Message";
import type { ServerErrorProps } from "~/utils/types";
import { Mirage } from "ldrs/react";
import "ldrs/react/Mirage.css";

interface LogInFormErrors {
  email: string;
  password: string;
  [key: string]: string;
}

export const action = async ({ request }: Route.ActionArgs) => {
  const formData = await request.formData();
  const email = String(formData.get("email"));
  const password = String(formData.get("password"));
  const { supabase, headers } = getSupabaseClient(request);
  const serverError: ServerErrorProps = {
    code: "",
    message: "",
  };

  const {
    data: { user },
    error,
  } = await supabase.auth.signInWithPassword({
    email: email,
    password: password,
  });

  if (error) {
    if (error?.code) {
      serverError.code = error.code;
      switch (error.code) {
        case "invalid_credentials":
          serverError.message =
            "The credentials you provided don't match any in our system. Please check them and try again.";
          break;
        case "email_not_confirmed":
          serverError.message =
            "You're email address has not yet been confirmed. Please follow the instruction in the confirmation email or request a new one.";
          serverError.data = { email };
          break;
        case "request_timeout":
          serverError.message =
            "We were unable to reach our authentication service. Please try again later.";
          break;
        case "unexpected_failure":
          serverError.message =
            "An unexpected error occurred while logging you in. Please try again later.";
          break;
        case "user_banned":
          serverError.message =
            "Your account has been banned. If you believe this was a mistake, please reach out to our support team.";
          break;
        default:
          serverError.message = error.message;
          break;
      }
    }
    return data({ serverError }, { headers });
  }

  if (user) {
    try {
      if (user.user_metadata?.university) {
        const [result] = await db
          .select({
            slug: universitiesTable.slug,
          })
          .from(universitiesTable)
          .where(eq(universitiesTable.id, user.user_metadata?.university));
        return redirect(`/${result.slug}/events`, { headers });
      }
      return redirect("/", { headers });
    } catch (err) {
      return redirect("/", { headers });
    }
  }
};

const LogIn = ({ actionData }: Route.ComponentProps) => {
  const [clientErrors, setClientErrors] = useState<LogInFormErrors>({
    email: "",
    password: "",
  });
  let fetcher = useFetcher<{ serverError?: ServerErrorProps }>();
  let errorMsg: React.ReactNode | null;
  if (fetcher.data?.serverError) {
    const { code, message, data } = fetcher.data.serverError;
    if (code === "email_not_confirmed" && data?.email) {
      errorMsg = (
        <ErrorMessage>
          You're email address has not yet been confirmed. Please use the button
          in the email sent to you or request another one{" "}
          <Link
            to={`/sign-up/confirm?email=${data?.email}`}
            className="underline"
          >
            here
          </Link>
          .
        </ErrorMessage>
      );
    } else {
      errorMsg = <ErrorMessage>{message}</ErrorMessage>;
    }
  }
  return (
    <>
      <title>Log In | Campus Collective</title>
      <meta property="og:title" content="Log In | Campus Collective" />
      <meta
        name="description"
        content="Log in to your Campus Collective account here"
      />
      <meta
        property="og:description"
        content="Log in to your Campus Collective account here"
      />
      <PaddedContainer padding="thick" fullPage>
        <section className="w-full">
          <fetcher.Form
            onSubmit={handleFormSubmit<LogInFormErrors>(setClientErrors)}
            onInvalid={handleInvalid}
            className="flex flex-col gap-8 items-center"
            noValidate
            method="post"
            action="/log-in"
          >
            <h2 className="font-medium">Log In</h2>
            {fetcher.state === "idle" && errorMsg}
            <div className="flex flex-col gap-5 w-full">
              <InputWithIcon
                iconAndError={{
                  icon: <Email stroke="#044c3b" />,
                  error: clientErrors.email,
                }}
                name="email"
                id="emailInput"
                type="email"
                placeholder="Email address"
                required
                disabled={fetcher.state !== "idle"}
              />
              <InputWithIcon
                iconAndError={{
                  icon: <Password stroke="#044c3b" />,
                  error: clientErrors.password,
                }}
                name="password"
                id="passwordInput"
                type="password"
                placeholder="Password"
                required
                disabled={fetcher.state !== "idle"}
              />
            </div>
            <WideButton type="submit">
              {fetcher.state === "idle" ? (
                "Log In"
              ) : (
                <Mirage size="70" color="#f7f4e9" />
              )}
            </WideButton>
            <p className="text-sm">
              Don't have an account?{" "}
              <Link
                className="border-b-1 hover:border-b-2 hover:font-medium transition-all"
                to="/sign-up"
              >
                Sign up here
              </Link>
            </p>
          </fetcher.Form>
        </section>
      </PaddedContainer>
    </>
  );
};

export default LogIn;
