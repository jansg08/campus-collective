interface FullPaddedContainerProps {
  children: React.ReactNode;
  flexGap?: `gap-${number}`;
  padding?: "normal" | "thick";
  fullPage?: boolean;
}

const FullPaddedContainer = ({
  children,
  flexGap = "gap-5",
  padding = "normal",
  fullPage = false,
}: FullPaddedContainerProps) => {
  return (
    <div
      className={`w-full ${padding === "normal" ? "p-5" : "p-10"} ${
        fullPage && "h-[calc(100vh_-_5rem)]"
      } relative flex flex-col items-center justify-center box-border ${flexGap}`}
    >
      {children}
    </div>
  );
};

export default FullPaddedContainer;
