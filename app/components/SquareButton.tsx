import { Link } from "react-router";

interface SquareButtonProps
  extends React.ButtonHTMLAttributes<HTMLButtonElement> {
  children: React.ReactNode;
  colour: "primary" | "secondary";
  size?: "normal" | "smaller" | "small";
  position?: "static" | "relative" | "absolute";
  top?: `top-${string}`;
  left?: `left-${string}`;
  bottom?: `bottom-${string}`;
  right?: `right-${string}`;
}

interface LinkProps extends SquareButtonProps {
  isLink: true;
  path: string;
}

interface NonLinkProps extends SquareButtonProps {
  isLink?: false;
  path?: never;
}

const SquareButton = ({
  children,
  colour,
  isLink = false,
  path,
  size = "normal",
  position = "static",
  top,
  left,
  bottom,
  right,
  onClick,
}: LinkProps | NonLinkProps) => {
  const classes = `bg-${colour} ${
    size === "normal" ? "p-1.5 rounded-lg" : "rounded-sm"
  } ${
    size === "smaller" && "p-1"
  } ${position} ${top} ${left} ${bottom} ${right} shadow-lg transition-all cursor-pointer ${
    colour === "primary"
      ? "text-background hover:brightness-110"
      : "hover:brightness-105"
  }`;
  return isLink ? (
    <Link to={path as string} className={classes}>
      {children}
    </Link>
  ) : (
    <button className={classes} onClick={onClick}>
      {children}
    </button>
  );
};

export default SquareButton;
