import { type EmailOtpType } from "@supabase/supabase-js";
import { redirect, type LoaderFunctionArgs } from "react-router";
import { getSupabaseClient } from "~/auth/supabase.server";

export async function loader({ request }: LoaderFunctionArgs) {
  const requestUrl = new URL(request.url);
  const token_hash = requestUrl.searchParams.get("token_hash");
  const type = requestUrl.searchParams.get("type") as EmailOtpType | null;
  const next = requestUrl.searchParams.get("next") || "/";
  const headers = new Headers();
  if (token_hash && type) {
    const { supabase } = getSupabaseClient(request);
    const { error } = await supabase.auth.verifyOtp({
      type,
      token_hash,
    });
    if (!error) {
      return redirect(next, { headers });
    }
  }

  // ! Should redirect to page to retry sending of confirmation email
  return redirect(`/log-in`, { headers });
}
