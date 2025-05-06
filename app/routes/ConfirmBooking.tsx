import { Outlet, redirect, useNavigate, useOutletContext } from "react-router";
import { useLocation } from "react-router";
import Modal from "~/components/Modal";
import type { Route } from "./+types/ConfirmBooking";
import { getSupabaseClient } from "~/auth/supabase.server";

export interface EventOutletContext {
  event: {
    title: string;
    description: string | null;
    venue: {
      name: string;
      coords: {
        x: number;
        y: number;
      } | null;
    } | null;
    startTime: Date;
    endTime: Date;
    price: number;
  };
}

export const loader = async ({ request }: Route.LoaderArgs) => {
  const { supabase, headers } = getSupabaseClient(request);
  const {
    data: { user },
    error,
  } = await supabase.auth.getUser();

  if (!user) {
    throw redirect("/log-in", { headers });
  }
};

const ConfirmBooking = ({}: Route.ComponentProps) => {
  const { event } = useOutletContext<EventOutletContext>();
  const { pathname } = useLocation();
  const navigate = useNavigate();

  return (
    <Modal closeModal={() => navigate(pathname.replace(/\/confirm.*/, ""))}>
      <Outlet context={{ event }} />
    </Modal>
  );
};

export default ConfirmBooking;
