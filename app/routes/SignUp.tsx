import { data, Outlet, redirect } from "react-router";
import PaddedContainer from "~/components/PaddedContainer";

import type { Route } from "./+types/SignUp";
import { getSupabaseClient } from "~/auth/supabase.server";
import type { ServerErrorProps } from "~/utils/types";

interface MetadataProps {
  is_staff: boolean;
  university?: number;
}

export interface SignUpFormContext {
  serverError?: ServerErrorProps;
}

export const action = async ({ request }: Route.ActionArgs) => {
  const formData = await request.formData();
  const email = String(formData.get("email"));
  const password = String(formData.get("password"));
  const university = Number(formData.get("university"));
  const { supabase, headers } = getSupabaseClient(request);
  const metadata: MetadataProps = {
    is_staff: false,
  };
  const serverError: ServerErrorProps = {
    code: "",
    message: "",
  };

  // !implement data validation here

  if (university !== -1) {
    metadata.university = university;
  }

  const { error } = await supabase.auth.signUp({
    email: email,
    password: password,
    options: {
      data: metadata,
      emailRedirectTo: `${process.env.BASE_URL}/log-in`,
    },
  });

  if (error) {
    if (error?.code) {
      serverError.code = error.code;
      switch (error.code) {
        case "email_exists":
          serverError.message =
            "The email you provided is already linked to an account on our platform.";
          break;
        case "user_already_exists":
          serverError.message =
            "The email you provided is already linked to an account on our platform.";
          break;
        case "signup_disabled":
          serverError.message =
            "Sign ups are temporarily disabled. Please try again later.";
          break;
        case "request_timeout":
          serverError.message =
            "We were unable to reach our authentication service. Please try again later.";
          break;
        case "unexpected_failure":
          serverError.message =
            "An unexpected error occurred while logging you in. Please try again later.";
          break;
        default:
          serverError.message = error.message;
          break;
      }
    }
    return data({ serverError }, { headers });
  }

  return redirect(`/sign-up/confirm?email=${email}`, { headers });
};

const SignUp = ({ actionData }: Route.ComponentProps) => {
  return (
    <PaddedContainer padding="thick" fullPage>
      <section className="w-full -translate-y-1/24">
        <Outlet
          context={actionData && { serverError: actionData?.serverError }}
        />
      </section>
    </PaddedContainer>
  );
};

export default SignUp;
