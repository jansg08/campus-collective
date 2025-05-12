import Menu from "../svgs/Menu.svg?react";
import Logo from "../svgs/Logo.svg?react";
import User from "../svgs/User.svg?react";
import LogIn from "../svgs/LogIn.svg?react";
import SquareButton from "./SquareButton";
import { Link, NavLink } from "react-router";
import { Form } from "react-router";
import { useState } from "react";

interface HeaderProps {
  authenticated: boolean;
  isStaff: boolean;
  avatar_url?: string;
}

const Header = ({ authenticated, isStaff, avatar_url }: HeaderProps) => {
  const [showMenu, setShowMenu] = useState(false);
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
    <header className="w-full py-2.5 px-5 bg-background-light shadow-below flex flex-col gap-4 justify-center fixed z-40">
      <div className="h-15 flex items-center justify-between">
        <SquareButton colour="primary" onClick={() => setShowMenu(!showMenu)}>
          <Menu stroke="#f7f4e9" />
        </SquareButton>
        <Link to="/">
          <Logo />
        </Link>
        {authButtons[option]}
      </div>
      {showMenu && (
        <ul className="text-xl flex flex-col gap-3 mb-1 w-fit">
          <li className="flex flex-col gap-1.5">
            My Events
            <ul className="pl-3 text-lg flex flex-col gap-1.5 relative w-min">
              <li className="hover-underline">
                <NavLink to="">Attending</NavLink>
              </li>
              <li className="hover-underline">
                <NavLink to="">Organised</NavLink>
              </li>
            </ul>
          </li>
          {isStaff && (
            <li className="flex flex-col gap-1.5 hover-underline">
              <NavLink to="/create-event">Create Event</NavLink>
            </li>
          )}
        </ul>
      )}
    </header>
  );
};

export default Header;
