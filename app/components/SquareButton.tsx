import { Link } from "react-router";

interface SquareButtonProps
  extends React.ButtonHTMLAttributes<HTMLButtonElement> {
  children: React.ReactNode;
  colour: "primary" | "secondary";
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
  onClick,
}: LinkProps | NonLinkProps) => {
  const classes = `bg-${colour} p-1.5 rounded-lg shadow-lg hover:brightness-110 transition-all cursor-pointer`;
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
