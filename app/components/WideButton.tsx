interface WideButtonProps {
  children: React.ReactNode;
  colour?: "primary" | "secondary";
  isThin?: boolean;
}

const WideButton = ({
  children,
  colour = "primary",
  isThin = false,
}: WideButtonProps) => {
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
