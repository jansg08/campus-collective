import ErrorTriangle from "~/svgs/ErrorTriangle.svg?react";
import InfoCircle from "~/svgs/InfoCircle.svg?react";

interface MessageProps {
  children: React.ReactNode;
  icon?: React.ReactNode;
  primaryBackgroundColour: `bg-${string}`;
  secondaryBackgroundColour: `bg-${string}`;
  textColour: `text-${string}`;
  layoutClasses?: string;
}

type StyledMessageProps = Pick<MessageProps, "children" | "layoutClasses">;

const Message = ({
  children,
  icon,
  primaryBackgroundColour,
  secondaryBackgroundColour,
  textColour,
  layoutClasses,
}: MessageProps) => {
  return (
    <div
      className={`${primaryBackgroundColour} w-full rounded-lg p-0.5 flex items-center gap-0.5 ${layoutClasses}`}
    >
      <div className="px-2">{icon}</div>
      <div
        className={`${secondaryBackgroundColour} ${textColour} rounded-md py-2 px-3 w-full text-sm leading-normal`}
      >
        {children}
      </div>
    </div>
  );
};

export const ErrorMessage = ({
  children,
  layoutClasses,
}: StyledMessageProps) => {
  return (
    <Message
      icon={<ErrorTriangle stroke="#f7f4e9" />}
      primaryBackgroundColour="bg-primary"
      secondaryBackgroundColour="bg-primary-light"
      textColour="text-text"
      layoutClasses={layoutClasses}
    >
      {children}
    </Message>
  );
};

export const InfoMessage = ({
  children,
  layoutClasses,
}: StyledMessageProps) => {
  return (
    <Message
      icon={<InfoCircle stroke="#f7f4e9" />}
      primaryBackgroundColour="bg-accent"
      secondaryBackgroundColour="bg-secondary-light"
      textColour="text-text"
      layoutClasses={layoutClasses}
    >
      {children}
    </Message>
  );
};

export default Message;
