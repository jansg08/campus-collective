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
    <div className="h-screen w-screen max-w-full fixed top-0 left-0 z-600 flex items-end xs:items-center justify-center bg-[rgba(0,0,0,0.5)]">
      <div
        className="w-full box-border relative xs:w-[26rem] p-5 rounded-t-lg xs:rounded-lg bg-secondary-light flex flex-col gap-4"
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
    </div>
  );
};

export default Modal;
