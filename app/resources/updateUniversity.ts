import { eq } from "drizzle-orm";
import { data, redirect } from "react-router";
import { db } from "src/db";
import { profilesTable } from "src/db/schema/profiles";
import { universitiesTable } from "src/db/schema/universities";
import { getSupabaseClient } from "~/auth/supabase.server";
import type { Route } from "./+types/updateUniversity";

export async function action({ request }: Route.ActionArgs) {
  const { supabase, headers } = getSupabaseClient(request);
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) {
    throw redirect("/log-in", {
      headers,
    });
  }

  const formData = await request.formData();
  const universityId = Number(formData.get("universityId"));

  const updateQuery = db.transaction(async (tx) => {
    const [updatedProfile] = await tx
      .update(profilesTable)
      .set({ universityId })
      .where(eq(profilesTable.id, user?.id))
      .returning({
        universityId: profilesTable.universityId,
      });

    if (!updatedProfile?.universityId) {
      throw new Error("Profile update failed");
    }

    const [university] = await tx
      .select({ slug: universitiesTable.slug })
      .from(universitiesTable)
      .where(eq(universitiesTable.id, updatedProfile.universityId));

    return university.slug;
  });

  const supabaseRequest = supabase.auth.updateUser({
    data: { university: universityId },
  });

  try {
    const [slug, { error }] = await Promise.all([updateQuery, supabaseRequest]);

    if (error) {
      throw data({ error }, { headers });
    }

    return redirect(`/${slug}/events`, {
      headers,
    });
  } catch (err) {
    throw data({ err }, { headers });
  }
}
