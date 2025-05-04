import { useRef } from "react";
import SquareButton from "./SquareButton";
import X from "~/svgs/X.svg?react";
import useOutsideClick from "~/utils/useOutSideClick";

interface ModalProps {
  children: React.ReactNode;
  visibilitySetter: (arg0: boolean) => void;
}

const Modal = ({ children, visibilitySetter }: ModalProps) => {
  const dropdownRef = useRef<HTMLDivElement>(null!);
  useOutsideClick({
    ref: dropdownRef,
    handler: () => visibilitySetter(false),
  });
  return (
    <div
      className="fixed z-30 top-full -translate-y-full w-full p-5 rounded-t-lg bg-secondary-light shadow-above flex flex-col gap-4"
      ref={dropdownRef}
    >
      <SquareButton
        colour="primary"
        position="absolute"
        size="small"
        top="top-5"
        right="right-5"
        onClick={() => visibilitySetter(false)}
      >
        <X stroke="#f7f4e9" />
      </SquareButton>
      {children}
    </div>
  );
};

export default Modal;
