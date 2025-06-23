import { useState } from "react";
import { Link, useFetcher, useOutletContext } from "react-router";
import { db } from "src/db";
import { universitiesTable } from "src/db/schema/universities";
import { InputWithIcon, SelectWithIcon } from "~/components/InputWithIcon";
import WideButton from "~/components/WideButton";

import Email from "~/svgs/EmailBig.svg?react";
import Mortarboard from "~/svgs/MortarboardBig.svg?react";
import Password from "~/svgs/PasswordBig.svg?react";
import ConfirmPassword from "~/svgs/ConfirmPasswordBig.svg?react";
import { handleFormSubmit, handleInvalid } from "~/utils/formValidation";
import type { Route } from "./+types/SignUpForm";
import { ErrorMessage, InfoMessage } from "~/components/Message";
import type { SignUpFormContext } from "./SignUp";
import { Mirage } from "ldrs/react";
import "ldrs/react/Mirage.css";

interface SignUpFormErrors {
  email: string;
  university: string;
  password: string;
  confirmPassword: string;
  [key: string]: string;
}

export const loader = async () => {
  try {
    const universities = await db
      .select({
        id: universitiesTable.id,
        name: universitiesTable.name,
      })
      .from(universitiesTable)
      .orderBy(universitiesTable.slug);

    return { universities };
  } catch (err) {
    return { err };
  }
};

const SignUpForm = ({ loaderData }: Route.ComponentProps) => {
  const { universities } = loaderData;
  const [clientErrors, setClientErrors] = useState<SignUpFormErrors>({
    email: "",
    university: "",
    password: "",
    confirmPassword: "",
  });
  const fetcher = useFetcher<SignUpFormContext>();
  return (
    <>
      <title>Sign Up | Campus Collective</title>
      <meta property="og:title" content="Sign Up | Campus Collective" />
      <meta
        name="description"
        content="Sign up for a Campus Collective account now"
      />
      <meta
        property="og:description"
        content="Sign up for a Campus Collective account now"
      />
      <fetcher.Form
        onSubmit={handleFormSubmit<SignUpFormErrors>(setClientErrors)}
        onInvalid={handleInvalid}
        className="flex flex-col gap-8 items-center"
        noValidate
        method="post"
        action="/sign-up"
      >
        <h2 className="font-medium">Sign Up</h2>
        {fetcher.data?.serverError &&
          fetcher.state === "idle" &&
          (fetcher.data?.serverError?.code === "email_exists" ||
          fetcher.data?.serverError?.code === "user_already_exists" ? (
            <ErrorMessage>
              {fetcher.data?.serverError?.message} You can log in with it{" "}
              <Link to="/log-in" className="underline">
                here
              </Link>
              .
            </ErrorMessage>
          ) : (
            <ErrorMessage>{fetcher.data.serverError.message}</ErrorMessage>
          ))}
        <div className="flex flex-col gap-5 w-full">
          <InputWithIcon
            icon={<Email stroke="#044c3b" />}
            name="email"
            type="email"
            placeholder="Email address"
            required
            error={clientErrors.email}
            disabled={fetcher.state !== "idle"}
          />
          <SelectWithIcon
            icon={<Mortarboard stroke="#044c3b" />}
            name="university"
            required
            error={clientErrors.university}
            disabled={fetcher.state !== "idle"}
          >
            <option value="" selected disabled>
              Select University
            </option>
            <option value="" disabled>
              -----
            </option>
            <option value="-1">Not listed</option>
            <option value="" disabled>
              -----
            </option>
            {universities?.map((uni) => (
              <option key={uni.id} value={uni.id}>
                {uni.name}
              </option>
            ))}
          </SelectWithIcon>
          <InputWithIcon
            icon={<Password stroke="#044c3b" />}
            name="password"
            type="password"
            placeholder="Password"
            required
            error={clientErrors.password}
            disabled={fetcher.state !== "idle"}
          />
          <InputWithIcon
            icon={<ConfirmPassword stroke="#044c3b" />}
            name="confirmPassword"
            type="password"
            placeholder="Confirm password"
            required
            error={clientErrors.confirmPassword}
            disabled={fetcher.state !== "idle"}
          />
        </div>
        <WideButton type="submit">
          {fetcher.state === "idle" ? (
            "Sign Up"
          ) : (
            <Mirage size="70" color="#f7f4e9" />
          )}
        </WideButton>
        <p className="text-sm">
          Already have an account?{" "}
          <Link
            className="border-b-1 hover:border-b-2 hover:font-medium transition-all"
            to="/log-in"
          >
            Log in here
          </Link>
        </p>
      </fetcher.Form>
    </>
  );
};

export default SignUpForm;
