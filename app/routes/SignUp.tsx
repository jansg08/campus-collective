import { Outlet, redirect } from "react-router";
import PaddedContainer from "~/components/PaddedContainer";

import type { Route } from "./+types/SignUp";
import { getSupabaseClient } from "~/auth/supabase.server";

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
      data: {
        is_staff: false,
      },
      emailRedirectTo: `${process.env.BASE_URL}/log-in`,
    },
  });

  if (error) {
    return { error };
  }

  return redirect(`/sign-up/confirm?email=${email}`, { headers });
};

const SignUp = ({ actionData }: Route.ComponentProps) => {
  return (
    <PaddedContainer padding="thick" fullPage>
      <section className="w-full -translate-y-1/24">
        <Outlet />
      </section>
    </PaddedContainer>
  );
};

export default SignUp;
