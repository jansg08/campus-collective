import type { FC } from "react";

interface FullPaddedContainerProps {
  children: React.ReactNode;
  flexGap?: `gap-${number}`;
}

const FullPaddedContainer: FC<FullPaddedContainerProps> = ({
  children,
  flexGap = 5,
}) => {
  return (
    <div className={`w-full p-5 mt-20 absolute flex flex-col ${flexGap}`}>
      {children}
    </div>
  );
};

export default FullPaddedContainer;
