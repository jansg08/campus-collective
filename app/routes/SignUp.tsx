import { Outlet, redirect } from "react-router";
import FullPaddedContainer from "~/components/FullPaddedContainer";

import type { Route } from "./+types/SignUp";
import { getSupabaseClient } from "~/auth/server";

interface SignUpProps {}

export const action = async ({ request }: Route.ActionArgs) => {
  const formData = await request.formData();
  const email = String(formData.get("email"));
  const password = String(formData.get("password"));
  const { supabase, headers } = getSupabaseClient(request);

  // !implement data validation here

  const { error } = await supabase.auth.signUp({
    email: email,
    password: password,
    options: {
      emailRedirectTo: "http://localhost:5173/log-in",
    },
  });

  if (error) {
    return { error };
  }

  return redirect(`/sign-up/confirm?email=${email}`, { headers });
};

const SignUp = ({ actionData }: Route.ComponentProps) => {
  return (
    <FullPaddedContainer padding="thick" fullPage>
      <section className="w-full -translate-y-1/4">
        <Outlet />
      </section>
    </FullPaddedContainer>
  );
};

export default SignUp;
