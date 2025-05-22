import { Link } from "react-router";

interface WideButtonProps
  extends React.ButtonHTMLAttributes<HTMLButtonElement> {
  children: React.ReactNode;
  colour?: "primary" | "secondary";
  isThin?: boolean;
  buttonWidth?: `w-${string}`;
  isHidden?: string;
}

interface LinkProps extends WideButtonProps {
  isLink: true;
  path: string;
}

interface NonLinkProps extends WideButtonProps {
  isLink?: false;
  path?: string;
}

const WideButton = ({
  children,
  colour = "primary",
  isThin = false,
  buttonWidth = "w-full",
  isHidden = "",
  type,
  isLink = false,
  path,
  onClick,
}: LinkProps | NonLinkProps) => {
  const classes = `${buttonWidth} ${isHidden} leading-none transition-all cursor-pointer flex items-center justify-center ${
    isThin
      ? "py-2 rounded-sm shadow-md text-sm"
      : "py-3 rounded-lg shadow-lg font-bold"
  } bg-${colour} ${
    colour === "primary"
      ? "text-background hover:brightness-110"
      : "hover:brightness-105"
  }`;
  return isLink ? (
    <Link to={path as string} className={classes}>
      {children}
    </Link>
  ) : (
    <button type={type} className={classes} onClick={onClick}>
      {children}
    </button>
  );
};

export default WideButton;
