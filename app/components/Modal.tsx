import { useRef } from "react";
import SquareButton from "./SquareButton";
import X from "~/svgs/X.svg?react";
import useOutsideClick from "~/utils/useOutSideClick";

interface ModalProps {
  children: React.ReactNode;
  closeModal: (...args: any[]) => void;
}

const Modal = ({ children, closeModal }: ModalProps) => {
  const dropdownRef = useRef<HTMLDivElement>(null!);
  useOutsideClick({
    ref: dropdownRef,
    handler: closeModal,
  });
  return (
    <div
      className="fixed z-30 top-full sm:top-1/2 -translate-y-full sm:-translate-y-1/2 w-full sm:w-[40rem] p-5 rounded-t-lg sm:rounded-lg bg-secondary-light shadow-above flex flex-col gap-4"
      ref={dropdownRef}
    >
      <SquareButton
        colour="primary"
        position="absolute"
        size="small"
        top="top-5"
        right="right-5"
        onClick={closeModal}
      >
        <X stroke="#f7f4e9" />
      </SquareButton>
      {children}
    </div>
  );
};

export default Modal;
