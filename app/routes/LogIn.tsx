import { useRef, useState } from "react";
import { data, Form, Link, redirect } from "react-router";
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
  let errorMsg: React.ReactNode | null;
  if (actionData?.serverError) {
    const { code, message, data } = actionData.serverError;
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
    }
  }
  return (
    <PaddedContainer padding="thick" fullPage>
      <section className="w-full -translate-y-1/4">
        <Form
          onSubmit={handleFormSubmit<LogInFormErrors>(setClientErrors)}
          onInvalid={handleInvalid}
          className="flex flex-col gap-8 items-center"
          noValidate
          method="post"
          action="/log-in"
        >
          <h2 className="font-bold">Log In</h2>
          {errorMsg}
          <div className="flex flex-col gap-5 w-full">
            <InputWithIcon
              icon={<Email stroke="#044c3b" />}
              name="email"
              type="email"
              placeholder="Email address"
              required
              error={clientErrors.email}
            />
            <InputWithIcon
              icon={<Password stroke="#044c3b" />}
              name="password"
              type="password"
              placeholder="Password"
              required
              error={clientErrors.password}
            />
          </div>
          <WideButton type="submit">Log In</WideButton>
          <p className="text-sm">
            Don't have an account?{" "}
            <Link className="underline" to="/sign-up">
              Sign up here
            </Link>
          </p>
        </Form>
      </section>
    </PaddedContainer>
  );
};

export default LogIn;
