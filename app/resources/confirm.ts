import { type EmailOtpType } from "@supabase/supabase-js";
import { redirect, type LoaderFunctionArgs } from "react-router";
import { getSupabaseClient } from "~/auth/server";

export async function loader({ request }: LoaderFunctionArgs) {
  const requestUrl = new URL(request.url);
  const token_hash = requestUrl.searchParams.get("token_hash");
  const type = requestUrl.searchParams.get("type") as EmailOtpType | null;
  const next = requestUrl.searchParams.get("next") || "/";
  const headers = new Headers();
  if (token_hash && type) {
    const supabase = getSupabaseClient(request);
    const { error } = await supabase.auth.verifyOtp({
      type,
      token_hash,
    });
    if (!error) {
      return redirect(next, { headers });
    }
  }
  // !remember to change this to an actual error page
  return redirect("/", { headers });
}
