interface FullPaddedContainerProps {
  children: React.ReactNode;
  flexGap?: `gap-${number}`;
}

const FullPaddedContainer = ({
  children,
  flexGap = "gap-5",
}: FullPaddedContainerProps) => {
  return (
    <div className={`w-full p-5 mt-20 absolute flex flex-col ${flexGap}`}>
      {children}
    </div>
  );
};

export default FullPaddedContainer;
