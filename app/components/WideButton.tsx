import type { FC } from "react";

interface WideButtonProps {
  children: React.ReactNode;
  colour?: "primary" | "secondary";
  isThin?: boolean;
}

const WideButton: FC<WideButtonProps> = ({
  children,
  colour = "primary",
  isThin = false,
}) => {
  return (
    <button
      className={`w-full leading-none font-bold transition-all ${
        isThin ? "py-2 rounded-sm" : "py-3 rounded-lg"
      } bg-${colour} ${
        colour === "primary"
          ? "text-background hover:brightness-110"
          : "hover:brightness-105"
      }`}
    >
      {children}
    </button>
  );
};

export default WideButton;
