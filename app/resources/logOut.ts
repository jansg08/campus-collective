import { getSupabaseClient } from "~/auth/supabase.server";
import { redirect } from "react-router";
import type { Route } from "./+types/logOut";

export const action = async ({ request }: Route.ActionArgs) => {
  const { supabase, headers } = getSupabaseClient(request);

  await supabase.auth.signOut();

  return redirect("/log-in", { headers });
};
