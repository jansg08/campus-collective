import Menu from "../svgs/Menu.svg?react";
import Logo from "../svgs/Logo.svg?react";
import User from "../svgs/User.svg?react";
import LogIn from "../svgs/LogIn.svg?react";
import SquareButton from "./SquareButton";
import { Link, NavLink, useLocation } from "react-router";
import { Form } from "react-router";
import { useEffect, useRef, useState } from "react";
import useOutsideClick from "~/utils/useOutSideClick";
import WideButton from "./WideButton";
import { useWindowWidth } from "~/hooks/useWindowWidth";
import { AnimatePresence, motion } from "motion/react";

interface HeaderProps {
  authenticated: boolean;
  isStaff: boolean;
  avatarUrl?: string;
}

const Header = ({ authenticated, isStaff, avatarUrl }: HeaderProps) => {
  const [showMenu, setShowMenu] = useState(false);
  const [showUserDropdown, setShowUserDropdown] = useState(false);
  const windowWidth = useWindowWidth(toggleMenu);
  const { pathname } = useLocation();
  const breakpoint = 768;

  function toggleMenu(windowWidth: number) {
    if (windowWidth > breakpoint) {
      setShowMenu(false);
    }
  }

  const userDropdownRef = useRef<HTMLDivElement>(null!);
  useOutsideClick({
    ref: userDropdownRef,
    handler: () => setShowUserDropdown(false),
  });

  useEffect(() => {
    setShowMenu(false);
  }, [pathname]);

  return (
    <header className="w-full py-2.5 bg-background-light shadow-below flex justify-center fixed z-40">
      <div className="w-full sm:w-[min(calc(4*100%/5+8rem),80rem)] flex flex-col px-5">
        <div className="w-full h-15 flex items-center">
          <div className="w-full flex justify-start">
            <SquareButton
              colour="primary"
              onClick={() => setShowMenu(!showMenu)}
            >
              <Menu stroke="#f7f4e9" />
            </SquareButton>
          </div>
          <div className="w-full flex justify-center">
            <Link to="/">
              <Logo />
            </Link>
          </div>
          <div className="w-full flex justify-end">
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
                    if (
                      e.target.id !== "dropdown" &&
                      !dropdown?.contains(e.target)
                    )
                      setShowUserDropdown(!showUserDropdown);
                  }
                }}
              >
                {!avatarUrl && <User stroke="#f7f4e9" height={28} width={28} />}
                {showUserDropdown && (
                  <div
                    id="dropdown"
                    ref={userDropdownRef}
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
              <>
                <SquareButton
                  colour="primary"
                  isLink={true}
                  path="/log-in"
                  isHidden="sm:hidden"
                >
                  <LogIn stroke="#f7f4e9" height={28} width={28} />
                </SquareButton>

                <WideButton
                  colour="primary"
                  isLink={true}
                  path="/log-in"
                  buttonWidth="w-24"
                  isHidden="hidden sm:flex"
                >
                  Log In
                </WideButton>
              </>
            )}
          </div>
        </div>
        <AnimatePresence initial={false}>
          {showMenu && (
            <motion.ul
              className="w-fit text-xl flex flex-col gap-3 mb-1 overflow-hidden"
              initial={{ height: 0 }}
              animate={{ height: "auto" }}
              exit={{ height: 0 }}
              transition={{ duration: 0.25, ease: "easeInOut" }}
            >
              <li className="flex flex-col gap-1.5 mt-4">
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
            </motion.ul>
          )}
        </AnimatePresence>
      </div>
    </header>
  );
};

export default Header;
