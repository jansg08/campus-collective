import { useState } from "react";
import { Form, Link } from "react-router";
import { InputWithIcon } from "~/components/InputWithIcon";
import WideButton from "~/components/WideButton";

import Email from "~/svgs/EmailBig.svg?react";
import Mortarboard from "~/svgs/MortarboardBig.svg?react";
import Password from "~/svgs/PasswordBig.svg?react";
import { handleFormSubmit, handleInvalid } from "~/utils/formValidation";

interface SignUpFormErrors {
  email: string;
  password: string;
  confirmPassword: string;
  [key: string]: string;
}

const SignUpForm = () => {
  const [clientErrors, setClientErrors] = useState<SignUpFormErrors>({
    email: "",
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
        <InputWithIcon
          icon={<Password stroke="#044c3b" />}
          name="password"
          type="password"
          placeholder="Password"
          required
          error={clientErrors.password}
        />
        <InputWithIcon
          icon={<Password stroke="#4ba590" />}
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
