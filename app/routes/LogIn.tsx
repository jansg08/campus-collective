import { useState } from "react";
import { Form, Link, redirect } from "react-router";
import FullPaddedContainer from "~/components/FullPaddedContainer";
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
import { getSupabaseClient } from "~/auth/server";
import { eq } from "drizzle-orm";
import { profilesTable } from "src/db/schema/profiles";
import { db } from "src/db";
import { universitiesTable } from "src/db/schema/universities";

interface LogInProps {}

export const action = async ({ request }: Route.ActionArgs) => {
  const formData = await request.formData();
  const email = String(formData.get("email"));
  const password = String(formData.get("password"));
  const supabase = getSupabaseClient(request);

  const {
    data: { user, session },
    error,
  } = await supabase.auth.signInWithPassword({
    email: email,
    password: password,
  });

  if (error) {
    return { error };
  }

  if (user) {
    const result = await db
      .select({ slug: universitiesTable.slug })
      .from(profilesTable)
      .leftJoin(
        universitiesTable,
        eq(profilesTable.universityId, universitiesTable.id)
      )
      .where(eq(profilesTable.id, user.id));

    if (result[0]?.slug) {
      const { data, error } = await supabase.auth.admin.updateUserById(
        user.id,
        { user_metadata: { universitySlug: result[0].slug } }
      );

      return redirect(`/${result[0].slug}/events`);
    }
    return redirect("/");
  }
};

const LogIn = ({}: LogInProps) => {
  const [clientErrors, setClientErrors] = useState<formErrors>({});

  return (
    <FullPaddedContainer padding="thick" fullPage>
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
    </FullPaddedContainer>
  );
};

export default LogIn;
