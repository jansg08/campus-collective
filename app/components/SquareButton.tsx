import { Link } from "react-router";

interface SquareButtonProps
  extends React.ButtonHTMLAttributes<HTMLButtonElement> {
  children: React.ReactNode;
  colour: "primary" | "secondary" | "custom";
  bgUrl?: string;
  size?: "normal" | "smaller" | "small";
  position?: "static" | "relative" | "absolute";
  zIndex?: `z-${string}`;
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
  bgUrl,
  isLink = false,
  path,
  size = "normal",
  position = "static",
  zIndex,
  top,
  left,
  bottom,
  right,
  onClick,
}: LinkProps | NonLinkProps) => {
  const sizeClasses = {
    withIcon: {
      normal: "p-1.5 rounded-lg",
      smaller: "p-1 rounded-sm",
      small: "rounded-sm",
    },
    withBackground: {
      normal: "size-10 rounded-lg",
      smaller: "size-7 rounded-sm",
      small: "size-6 rounded-sm",
    },
  };
  const colourClasses = {
    primary: "bg-primary text-background hover:brightness-110",
    secondary: "bg-secondary hover:brightness-105",
    custom: "",
  };
  const classes = `${colour !== "custom" ? `bg-${colour}` : ""} ${
    sizeClasses[bgUrl ? "withBackground" : "withIcon"][size]
  } ${position} ${top} ${left} ${bottom} ${right} ${zIndex} shadow-lg transition-all cursor-pointer ${
    colourClasses[colour]
  }`;
  return isLink ? (
    <Link
      to={path as string}
      className={classes}
      style={bgUrl ? { backgroundImage: `url(${bgUrl})` } : undefined}
    >
      {children}
    </Link>
  ) : (
    <button
      className={classes}
      onClick={onClick}
      style={bgUrl ? { backgroundImage: `url(${bgUrl})` } : undefined}
    >
      {children}
    </button>
  );
};

export default SquareButton;
