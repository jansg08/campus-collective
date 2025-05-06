import { useState } from "react";
import { Form, Link, redirect } from "react-router";
import PaddedContainer from "~/components/PaddedContainer";
import InputWithIcon from "~/components/InputWithIcon";
import WideButton from "~/components/WideButton";

import Email from "~/svgs/EmailBig.svg?react";
import Password from "~/svgs/PasswordBig.svg?react";
import {
  type formErrors,
  handleFormSubmit,
  handleInvalid,
} from "~/utils/formValidation";
import type { Route } from "./+types/LogIn";
import { getSupabaseClient } from "~/auth/supabase.server";
import { eq } from "drizzle-orm";
import { db } from "src/db";
import { universitiesTable } from "src/db/schema/universities";

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
      if (user.user_metadata?.universitySlug) {
        const [result] = await db
          .select({
            universitySlug: universitiesTable.slug,
          })
          .from(universitiesTable)
          .where(eq(universitiesTable.id, user.user_metadata?.university));
        redirect(`/${result.universitySlug}/events`, { headers });
      }
      return redirect("/", { headers });
    } catch (err) {
      return { err };
    }
  }
};

const LogIn = ({ actionData }: Route.ComponentProps) => {
  const [clientErrors, setClientErrors] = useState<formErrors>({});
  return (
    <PaddedContainer padding="thick" fullPage>
      <section className="w-full -translate-y-1/4">
        <Form
          onSubmit={handleFormSubmit(setClientErrors)}
          onInvalid={handleInvalid}
          className="flex flex-col gap-8 items-center"
          noValidate
          method="post"
          action="/log-in"
        >
          <h2 className="font-bold">Log In</h2>
          <div className="flex flex-col gap-5 w-full">
            <div>
              <InputWithIcon
                icon={<Email stroke="#044c3b" />}
                name="email"
                type="email"
                placeholder="Email address"
                required
              />
              <p>{clientErrors.email}</p>
            </div>
            <div>
              <InputWithIcon
                icon={<Password stroke="#044c3b" />}
                name="password"
                type="password"
                placeholder="Password"
                required
              />
              <p className="text-primary text-xs mt-1">
                {clientErrors.password}
              </p>
            </div>
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
