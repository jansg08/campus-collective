import { type HTMLElementType } from "react";

interface BaseElementWithIconProps
  extends React.InputHTMLAttributes<HTMLInputElement> {
  iconSize?: "normal" | "large";
  icon: React.ReactNode;
}

interface InputWithIconProps extends BaseElementWithIconProps {
  isSelect?: false | undefined;
  children?: never;
  isTextArea?: boolean;
  isMoney?: boolean;
}

interface SelectWithIconProps extends BaseElementWithIconProps {
  isSelect: true;
  children: React.ReactNode;
  isTextArea?: false;
  isMoney?: false;
}

const InputWithIcon = ({
  icon,
  name,
  type,
  placeholder,
  required,
  isSelect = false,
  isTextArea = false,
  isMoney = false,
  children,
  iconSize = "normal",
  onFocus,
  onBlur,
}: InputWithIconProps | SelectWithIconProps) => {
  return (
    <div className="bg-background-light relative rounded-lg w-full shadow-md py-1 pr-1 pl-4 flex justify-end gap-1.5 items-center input-border transition-all">
      {isSelect ? (
        <select className="w-full outline-0" name={name} required={required}>
          {children}
        </select>
      ) : isTextArea ? (
        <textarea
          className="w-full outline-0 leading-normal py-1.5"
          name={name}
          placeholder={placeholder}
          required={required}
        />
      ) : (
        <>
          {isMoney && "£"}
          <input
            className="w-full outline-0"
            name={name}
            placeholder={placeholder}
            type={type}
            required={required}
            onFocus={onFocus}
            onBlur={onBlur}
          />
        </>
      )}
      <div className="mb-auto">
        <div
          className={`rounded-sm ${
            iconSize === "normal" ? "p-1.5" : "p-0.5"
          } bg-secondary`}
        >
          {icon}
        </div>
      </div>
    </div>
  );
};

export default InputWithIcon;
