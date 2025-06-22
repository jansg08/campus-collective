import { useRef } from "react";
import SquareButton from "./SquareButton";
import X from "~/svgs/X.svg?react";
import useOutsideClick from "~/utils/useOutSideClick";
import { motion } from "motion/react";
import { useWindowWidth } from "~/hooks/useWindowWidth";

interface ModalProps {
  children: React.ReactNode;
  closeModal: (...args: any[]) => void;
}

const Modal = ({ children, closeModal }: ModalProps) => {
  const dropdownRef = useRef<HTMLDivElement>(null!);
  const windowWidth = useWindowWidth();
  useOutsideClick({
    ref: dropdownRef,
    handler: closeModal,
  });
  return (
    <motion.div
      className="h-screen w-screen max-w-full fixed top-0 left-0 z-600 bg-[rgba(0,0,0,0.5)]"
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }}
      exit={{ opacity: 0 }}
      transition={{ duration: 0.2, ease: "easeInOut" }}
    >
      <motion.div
        className="w-full left-1/2 bottom-[env(safe-area-inset-bottom)] xs:bottom-1/2 xs:translate-y-1/2 -translate-x-1/2 box-border absolute xs:w-[26rem] p-5 rounded-t-lg xs:rounded-lg bg-secondary-light flex flex-col gap-4 transition-all"
        ref={dropdownRef}
        initial={windowWidth < 512 && { y: "200%" }}
        animate={windowWidth < 512 && { y: 0 }}
        exit={windowWidth < 512 ? { y: "200%" } : undefined}
        transition={{ duration: 0.2, ease: "easeInOut" }}
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
      </motion.div>
    </motion.div>
  );
};

export default Modal;
