import { createBrowserClient } from "@supabase/ssr";
import type { Session } from "@supabase/supabase-js";
import { useEffect, useState } from "react";
import { useRevalidator } from "react-router";

interface SupabaseEnv {
  SUPABASE_URL: string;
  SUPABASE_ANON_KEY: string;
}

interface UseSupabase {
  env: SupabaseEnv;
  serverSession: Session | null;
}

export const useSupabase = ({ env, serverSession }: UseSupabase) => {
  const [supabase] = useState(() =>
    createBrowserClient(env.SUPABASE_URL!, env.SUPABASE_ANON_KEY!)
  );
  const serverAccessToken = serverSession?.access_token;
  const revalidator = useRevalidator();

  useEffect(() => {
    const {
      data: { subscription },
    } = supabase.auth.onAuthStateChange((event, session) => {
      if (session?.access_token !== serverAccessToken) {
        revalidator.revalidate();
      }
    });

    return () => {
      subscription.unsubscribe();
    };
  }, [supabase.auth, serverAccessToken, revalidator]);

  return { supabase };
};
