import { useState } from "react";
import { Form, Link } from "react-router";
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

  return (
    <Form
      onSubmit={handleFormSubmit<SignUpFormErrors>(setClientErrors)}
      onInvalid={handleInvalid}
      className="flex flex-col gap-8 items-center"
      noValidate
      method="post"
      action="/sign-up"
    >
      <h2 className="font-bold">Sign Up</h2>
      <div className="flex flex-col gap-5 w-full">
        <InputWithIcon
          icon={<Email stroke="#044c3b" />}
          name="email"
          type="email"
          placeholder="Email address"
          required
          error={clientErrors.email}
        />
        <SelectWithIcon
          icon={<Mortarboard stroke="#044c3b" />}
          name="university"
          required
          error={clientErrors.university}
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
        />
        <InputWithIcon
          icon={<ConfirmPassword stroke="#044c3b" />}
          name="confirmPassword"
          type="password"
          placeholder="Confirm password"
          required
          error={clientErrors.confirmPassword}
        />
      </div>
      <WideButton type="submit">Sign Up</WideButton>
      <p className="text-sm">
        Already have an account?{" "}
        <Link className="underline" to="/log-in">
          Log in here
        </Link>
      </p>
    </Form>
  );
};

export default SignUpForm;
