import { redirect, useNavigate } from "react-router";
import { useLocation } from "react-router";
import Modal from "~/components/Modal";

interface ConfirmBookingProps {}

const ConfirmBooking = ({}: ConfirmBookingProps) => {
  const { pathname } = useLocation();
  const navigate = useNavigate();

  return (
    <Modal closeModal={() => navigate(pathname.replace("/confirm", ""))}>
      <h3>Confirm Booking</h3>
    </Modal>
  );
};

export default ConfirmBooking;
