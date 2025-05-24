import { useState } from "react";
import { Form, Link, redirect } from "react-router";
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

  const {
    data: { user },
    error,
  } = await supabase.auth.signInWithPassword({
    email: email,
    password: password,
  });

  if (error) {
    return { error };
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
      return { err };
    }
  }
};

const LogIn = ({ actionData }: Route.ComponentProps) => {
  const [clientErrors, setClientErrors] = useState<LogInFormErrors>({
    email: "",
    password: "",
  });
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
