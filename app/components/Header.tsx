import Menu from "../svgs/Menu.svg?react";
import Logo from "../svgs/Logo.svg?react";
import User from "../svgs/User.svg?react";
import LogIn from "../svgs/LogIn.svg?react";
import SquareButton from "./SquareButton";
import { Link, NavLink } from "react-router";
import { Form } from "react-router";
import { useRef, useState } from "react";
import useOutsideClick from "~/utils/useOutSideClick";

interface HeaderProps {
  authenticated: boolean;
  isStaff: boolean;
  avatarUrl?: string;
}

const Header = ({ authenticated, isStaff, avatarUrl }: HeaderProps) => {
  const [showMenu, setShowMenu] = useState(false);
  const [showUserDropdown, setShowUserDropdown] = useState(false);
  const dropdownRef = useRef<HTMLDivElement>(null!);
  useOutsideClick({
    ref: dropdownRef,
    handler: () => setShowUserDropdown(false),
  });
  return (
    <header className="w-full py-2.5 px-5 bg-background-light shadow-below flex flex-col gap-4 justify-center fixed z-40">
      <div className="h-15 flex items-center justify-between">
        <SquareButton colour="primary" onClick={() => setShowMenu(!showMenu)}>
          <Menu stroke="#f7f4e9" />
        </SquareButton>
        <Link to="/">
          <Logo />
        </Link>
        {authenticated ? (
          <SquareButton
            colour={avatarUrl ? "custom" : "primary"}
            bgUrl={avatarUrl}
            position="relative"
            onClick={(e) => {
              const dropdown = document.getElementById("dropdown");
              if (
                e.target instanceof HTMLElement ||
                e.target instanceof SVGElement
              ) {
                if (e.target.id !== "dropdown" && !dropdown?.contains(e.target))
                  setShowUserDropdown(!showUserDropdown);
              }
            }}
          >
            {!avatarUrl && <User stroke="#f7f4e9" height={28} width={28} />}
            {showUserDropdown && (
              <div
                id="dropdown"
                ref={dropdownRef}
                className="absolute top-[calc(100%+0.75rem)] right-0 z-50 w-fit flex flex-col items-start py-1.5 rounded-sm bg-[rgba(var(--color-rgba-text),0.8)]"
              >
                <div className="absolute right-5 -top-1 translate-x-1/2 dropdown-triangle h-1 w-2 bg-[rgba(var(--color-rgba-text),0.8)]" />
                <Link
                  to=""
                  className="w-full text-left py-0.5 px-3 leading-tight transition-all hover:bg-text"
                >
                  Profile
                </Link>
                <Form action="/log-out" method="post">
                  <input
                    className="whitespace-nowrap transition-all hover:bg-text py-0.5 px-3 leading-tight"
                    type="submit"
                    value="Log out"
                  />
                </Form>
              </div>
            )}
          </SquareButton>
        ) : (
          <SquareButton colour="primary" isLink={true} path="/log-in">
            <LogIn stroke="#f7f4e9" height={28} width={28} />
          </SquareButton>
        )}
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
