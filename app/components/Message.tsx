import ErrorTriangle from "~/svgs/ErrorTriangle.svg?react";
import InfoCircle from "~/svgs/InfoCircle.svg?react";

interface MessageProps {
  children: React.ReactNode;
  icon?: React.ReactNode;
  primaryBackgroundColour: `bg-${string}`;
  secondaryBackgroundColour: `bg-${string}`;
  textColour: `text-${string}`;
}

interface ErrorMessageProps {
  children: React.ReactNode;
}

interface InfoMessageProps {
  children: React.ReactNode;
}

const Message = ({
  children,
  icon,
  primaryBackgroundColour,
  secondaryBackgroundColour,
  textColour,
}: MessageProps) => {
  return (
    <div
      className={`${primaryBackgroundColour} w-full rounded-lg p-0.5 flex items-center gap-0.5`}
    >
      <div className="px-2">{icon}</div>
      <div
        className={`${secondaryBackgroundColour} ${textColour} rounded-md p-2 w-full text-sm leading-normal`}
      >
        {children}
      </div>
    </div>
  );
};

export const ErrorMessage = ({ children }: ErrorMessageProps) => {
  return (
    <Message
      icon={<ErrorTriangle stroke="#f7f4e9" />}
      primaryBackgroundColour="bg-primary"
      secondaryBackgroundColour="bg-primary-light"
      textColour="text-text"
    >
      {children}
    </Message>
  );
};

export const InfoMessage = ({ children }: InfoMessageProps) => {
  return (
    <Message
      icon={<InfoCircle stroke="#f7f4e9" />}
      primaryBackgroundColour="bg-accent"
      secondaryBackgroundColour="bg-secondary-light"
      textColour="text-text"
    >
      {children}
    </Message>
  );
};

export default Message;
