import { Outlet, redirect } from "react-router";
import PaddedContainer from "~/components/PaddedContainer";

import type { Route } from "./+types/SignUp";
import { getSupabaseClient } from "~/auth/supabase.server";

interface MetadataProps {
  is_staff: boolean;
  university?: number;
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
    return { error };
  }

  return redirect(`/sign-up/confirm?email=${email}`, { headers });
};

const SignUp = ({ actionData }: Route.ComponentProps) => {
  console.log(actionData);
  return (
    <PaddedContainer padding="thick" fullPage>
      <section className="w-full -translate-y-1/24">
        <Outlet />
      </section>
    </PaddedContainer>
  );
};

export default SignUp;
