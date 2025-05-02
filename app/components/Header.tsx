import Menu from "../svgs/Menu.svg?react";
import Logo from "../svgs/Logo.svg?react";
import User from "../svgs/User.svg?react";
import LogIn from "../svgs/LogIn.svg?react";
import SquareButton from "./SquareButton";
import { Link } from "react-router";
import { Form } from "react-router";

interface HeaderProps {
  authenticated: boolean;
  avatar_url?: string;
}

const Header = ({ authenticated, avatar_url }: HeaderProps) => {
  const authButtons = {
    logIn: (
      <SquareButton colour="primary" isLink={true} path="/log-in">
        <LogIn stroke="#f7f4e9" />
      </SquareButton>
    ),
    noAvatar: (
      <Form action="/log-out" method="post">
        <SquareButton colour="primary" isLink={false} type="submit">
          <User stroke="#f7f4e9" />
        </SquareButton>
      </Form>
    ),
    avatar: (
      <Link to="/account">
        <img src={avatar_url} />
      </Link>
    ),
  };
  let option: "logIn" | "noAvatar" | "avatar";

  if (!authenticated) {
    option = "logIn";
  } else if (avatar_url) {
    option = "avatar";
  } else {
    option = "noAvatar";
  }

  return (
    <header className="w-full h-20 px-5 bg-background-light shadow-below flex items-center justify-between fixed z-10">
      <SquareButton colour="primary">
        <Menu stroke="#f7f4e9" />
      </SquareButton>
      <Link to="/">
        <Logo />
      </Link>
      {authButtons[option]}
    </header>
  );
};

export default Header;
