import { Link } from "react-router";

interface SquareButtonProps {
  children: React.ReactNode;
  type: "primary" | "secondary";
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
  type,
  isLink = false,
  path,
}: LinkProps | NonLinkProps) => {
  const classes = `bg-${type} p-1.5 rounded-lg shadow-lg hover:brightness-110 transition-all`;
  return isLink ? (
    <Link to={path as string} className={classes}>
      {children}
    </Link>
  ) : (
    <button className={classes}>{children}</button>
  );
};

export default SquareButton;
