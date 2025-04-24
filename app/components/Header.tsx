import Menu from "../svgs/Menu.svg?react";
import Logo from "../svgs/Logo.svg?react";
import User from "../svgs/User.svg?react";
import LogIn from "../svgs/LogIn.svg?react";
import SquareButton from "./SquareButton";

const Header = () => {
  return (
    <header className="w-full h-20 px-5 bg-background-light shadow-below flex items-center justify-between fixed z-10">
      <SquareButton type="primary">
        <Menu stroke="#f7f4e9" />
      </SquareButton>
      <Logo />
      <SquareButton type="primary" isLink={true} path="/sign-up">
        <LogIn stroke="#f7f4e9" />
      </SquareButton>
    </header>
  );
};

export default Header;
