import { Form, useSearchParams } from "react-router";
import WideButton from "~/components/WideButton";
import type { Route } from "./+types/ConfirmEmail";
import { getSupabaseClient } from "~/auth/supabase.server";
import { useState } from "react";

export const action = async ({ request }: Route.ActionArgs) => {
  const formData = await request.formData();
  const email = String(formData.get("email"));
  const { supabase } = getSupabaseClient(request);

  const { error } = await supabase.auth.resend({
    type: "signup",
    email: email,
    options: {
      emailRedirectTo: `${process.env.BASE_URL}/log-in`,
    },
  });

  if (error) {
    return { error, email };
  }

  return { outcome: "success" };
};

const ConfirmEmail = ({ actionData }: Route.ComponentProps) => {
  let [searchParams] = useSearchParams();
  const [email] = useState(() => searchParams.get("email") ?? "");

  return (
    <Form
      method="post"
      action={`/sign-up/confirm?email=${email}`}
      className="flex flex-col gap-8 items-center"
    >
      <h2 className="font-bold">Confirm Email</h2>
      <div className="flex flex-col gap-5 w-full text-center">
        <p>Thank you for joining Campus Collective! </p>
        <p>
          To confirm your account please check your inbox for a confirmation
          email and follow the steps from there.
        </p>
        <p>
          The email is valid for 5 minutes. After that you will need to request
          another one using the button below.
        </p>
      </div>
      <input name="email" value={email} className="hidden" />
      <WideButton type="submit">Resend Confirmation</WideButton>
    </Form>
  );
};

export default ConfirmEmail;
