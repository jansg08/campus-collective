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
  required,
}: InputWithIconProps) => {
  return (
    <div className="bg-background-light relative rounded-lg w-full h-10 shadow-md py-1 pr-1 pl-4 flex justify-end gap-1.5 items-center input-border transition-all">
      <input
        className="w-full outline-0"
        name={name}
        placeholder={placeholder}
        type={type}
        required={required}
      />
      <div className="rounded-sm p-1.5 bg-secondary">{icon}</div>
    </div>
  );
};

export default InputWithIcon;
