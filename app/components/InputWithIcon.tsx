import { useRef, useState } from "react";
import DatePicker from "react-datepicker";
import { type DatePickerProps } from "react-datepicker";
import "react-datepicker/dist/react-datepicker.css";

interface IconAndErrorProps {
  iconSize?: "normal" | "large";
  icon: React.ReactNode;
  error?: string;
  hoverMsg?: string | React.ReactNode;
  isSelect?: boolean;
}

interface ElementWithIconProps extends IconAndErrorProps {
  children: React.ReactNode;
  id?: string;
}

interface FormFieldWithIconProps {
  iconAndError: IconAndErrorProps;
}

interface InputWithIconProps
  extends FormFieldWithIconProps,
    React.InputHTMLAttributes<HTMLInputElement> {
  isMoney?: boolean;
}

interface TextareaWithIconProps
  extends FormFieldWithIconProps,
    React.TextareaHTMLAttributes<HTMLTextAreaElement> {
  cannotResize?: boolean;
}

type DatePickerWithIconProps = FormFieldWithIconProps &
  DatePickerProps & {
    id?: string;
  };

const ElementWithIcon = ({
  icon,
  iconSize = "normal",
  error,
  hoverMsg,
  id,
  children,
  isSelect = false,
}: ElementWithIconProps) => {
  const [isHovered, setIsHovered] = useState(false);
  const spacingClasses = [
    ["px-2 h-10", "pr-1 pl-4"], // any nested element except a select 0: with icon 1: without icon
    ["px-1 h-10", "pr-1 pl-3"], // nested select element 0: with icon 1: without icon
  ];
  return (
    <div
      className={`w-full flex flex-col items-start ${
        error ? "gap-1" : ""
      } relative`}
    >
      {hoverMsg && isHovered && (
        <div className="absolute z-50 bg-[rgba(var(--color-rgba-text),0.7)] backdrop-blur-xs top-0 left-0 -translate-y-[calc(100%+0.25rem)] rounded-sm text-white py-1.5 px-2">
          {hoverMsg}
        </div>
      )}
      <div
        onMouseEnter={() => setIsHovered(true)}
        onMouseLeave={() => setIsHovered(false)}
        className={`bg-background-light relative rounded-lg w-full shadow-md py-1 ${
          spacingClasses[isSelect ? 1 : 0][icon ? 1 : 0]
        } flex justify-end gap-1.5 items-center input-border transition-all has-[select:disabled]:bg-background-dim has-[input:disabled]:bg-background-dim has-[textarea:disabled]:bg-background-dim has-[select:disabled]:text-text-dim has-[input:disabled]:text-text-dim has-[textarea:disabled]:text-text-dim`}
      >
        {children}
        {icon && (
          <label htmlFor={id} className="mb-auto">
            <div
              className={`rounded-sm ${
                iconSize === "normal" ? "p-1.5" : "p-0.5"
              } bg-secondary`}
            >
              {icon}
            </div>
          </label>
        )}
      </div>
      <p className="text-primary text-xs">{error}</p>
    </div>
  );
};

export const InputWithIcon = ({
  iconAndError,
  id,
  isMoney,
  ...inputProps
}: InputWithIconProps) => (
  <ElementWithIcon {...iconAndError} id={id}>
    <>
      {isMoney && "£"}
      <input className="w-full outline-0" {...inputProps} id={id} />
    </>
  </ElementWithIcon>
);

export const SelectWithIcon = ({
  iconAndError,
  id,
  children,
  ...selectProps
}: React.SelectHTMLAttributes<HTMLSelectElement> & FormFieldWithIconProps) => (
  <ElementWithIcon {...iconAndError} id={id} isSelect>
    <select
      className="w-full outline-0 invalid:text-text-dim"
      {...selectProps}
      id={id}
    >
      {children}
    </select>
  </ElementWithIcon>
);

export const TextareaWithIcon = ({
  iconAndError,
  id,
  cannotResize = false,
  onInput,
  ...textareaProps
}: TextareaWithIconProps) => {
  const ref = useRef<HTMLTextAreaElement>(null);
  const handleHeight = (e: React.ChangeEvent<HTMLTextAreaElement>) => {
    const el = ref.current;
    if (el) {
      el.style.height = "";
      el.style.height = el.scrollHeight + "px";
    }

    if (onInput) onInput(e);
  };
  return (
    <ElementWithIcon {...iconAndError} id={id}>
      <textarea
        className={`w-full outline-0 leading-snug my-1.5 ${
          cannotResize ? "resize-none" : ""
        }`}
        {...textareaProps}
        id={id}
        ref={ref}
        onInput={handleHeight}
      />
    </ElementWithIcon>
  );
};

export const DatePickerWithIcon = ({
  iconAndError,
  id,
  ...datePickerProps
}: DatePickerWithIconProps) => (
  <ElementWithIcon {...iconAndError} id={id}>
    <DatePicker className="w-full outline-none" {...datePickerProps} id={id} />
  </ElementWithIcon>
);

export default ElementWithIcon;
