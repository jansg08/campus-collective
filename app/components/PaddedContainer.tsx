interface PaddedContainerProps {
  children: React.ReactNode;
  flexGap?: `gap-${number}`;
  padding?: "normal" | "thick" | "none";
  margin?: string;
  fullPage?: boolean;
  background?: `bg-${string}` | "";
  shadow?: `shadow-${string}` | "";
  extraClasses?: string;
}

const PaddedContainer = ({
  children,
  flexGap = "gap-5",
  padding = "normal",
  margin = "",
  fullPage = false,
  background = "",
  shadow = "",
  extraClasses = "",
}: PaddedContainerProps) => {
  return (
    <div
      className={`w-screen ${background} flex justify-center ${shadow} ${margin}`}
    >
      <div
        className={`${
          padding === "normal"
            ? "w-full sm:w-[min(calc(4*100%/5+8rem),80rem)]"
            : "w-[min(100%,30rem)]"
        } ${padding === "none" || (padding === "normal" ? "p-5" : "p-10")} ${
          fullPage ? "h-[calc(100vh_-_5rem)]" : ""
        } relative flex flex-col items-center justify-center box-border ${flexGap} ${extraClasses}}`}
      >
        {children}
      </div>
    </div>
  );
};

export default PaddedContainer;
