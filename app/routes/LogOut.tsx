import { getSupabaseClient } from "~/auth/supabase.server";
import type { Route } from "./+types/LogOut";
import { redirect } from "react-router";

export const action = async ({ request }: Route.ActionArgs) => {
  const { supabase, headers } = getSupabaseClient(request);

  await supabase.auth.signOut();

  return redirect("/log-in", { headers });
};
