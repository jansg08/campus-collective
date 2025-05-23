interface PaddedContainerProps {
  children: React.ReactNode;
  flexGap?: `gap-${number}`;
  padding?: "normal" | "thick" | "none";
  margin?: string;
  fullPage?: boolean;
  background?: `bg-${string}` | "";
  shadow?: `shadow-${string}` | "";
}

const PaddedContainer = ({
  children,
  flexGap = "gap-5",
  padding = "normal",
  margin = "",
  fullPage = false,
  background = "",
  shadow = "",
}: PaddedContainerProps) => {
  return (
    <div
      className={`${
        padding === "normal" ? "w-[min(100%,80rem)]" : "w-[min(100%,30rem)]"
      } ${padding === "none" || (padding === "normal" ? "p-5" : "p-10")} ${
        fullPage ? "h-[calc(100vh_-_5rem)]" : ""
      } ${margin} ${background} ${shadow} relative flex flex-col items-center justify-center box-border ${flexGap}`}
    >
      {children}
    </div>
  );
};

export default PaddedContainer;
