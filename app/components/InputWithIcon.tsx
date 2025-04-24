import type { HTMLElementType } from "react";

interface InputWithIconProps
  extends React.InputHTMLAttributes<HTMLInputElement> {
  icon: React.ReactNode;
}

const InputWithIcon = ({
  icon,
  name,
  type,
  placeholder,
}: InputWithIconProps) => {
  return (
    <div className="bg-background-light rounded-lg w-full h-10 shadow-md py-1 pr-1 pl-4 flex justify-end items-center">
      <input
        className="w-full outline-0"
        name={name}
        placeholder={placeholder}
        type={type}
      />
      <div className="rounded-sm p-1.5 bg-secondary">{icon}</div>
    </div>
  );
};

export default InputWithIcon;
