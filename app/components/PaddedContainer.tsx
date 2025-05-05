interface PaddedContainerProps {
  children: React.ReactNode;
  flexGap?: `gap-${number}`;
  padding?: "normal" | "thick";
  fullPage?: boolean;
}

const PaddedContainer = ({
  children,
  flexGap = "gap-5",
  padding = "normal",
  fullPage = false,
}: PaddedContainerProps) => {
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

export default PaddedContainer;
