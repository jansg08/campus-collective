import DatePicker from "react-datepicker";
import "react-datepicker/dist/react-datepicker.css";

interface IconProps {
  iconSize?: "normal" | "large";
  icon: React.ReactNode;
}

interface ElementWithIconProps extends IconProps {
  children: React.ReactNode;
}

interface InputWithIconProps
  extends IconProps,
    React.InputHTMLAttributes<HTMLInputElement> {
  isMoney?: boolean;
}

interface TextareaWithIconProps
  extends IconProps,
    React.TextareaHTMLAttributes<HTMLTextAreaElement> {
  cannotResize?: boolean;
  ref?: React.RefObject<HTMLTextAreaElement | null>;
}

interface DatePickerWithIconProps extends IconProps {
  selected: Date | null;
  onChange?: (...args: any[]) => void;
  placeholderText?: string;
  hideYearDropdown?: boolean;
  dateFormat: string;
  id?: string;
}

const ElementWithIcon = ({
  icon,
  iconSize = "normal",
  children,
}: ElementWithIconProps) => {
  return (
    <div className="bg-background-light relative rounded-lg w-full shadow-md py-1 pr-1 pl-4 flex justify-end gap-1.5 items-center input-border transition-all has-[select:disabled]:bg-dim has-[input:disabled]:bg-dim has-[textarea:disabled]:bg-dim has-[select:disabled]:text-text-dim has-[input:disabled]:text-text-dim has-[textarea:disabled]:text-text-dim">
      {children}
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

export const InputWithIcon = ({
  icon,
  iconSize = "normal",
  isMoney = false,
  name,
  type,
  placeholder,
  required,
  disabled,
  onFocus,
  onBlur,
  onChange,
  onMouseOver,
}: InputWithIconProps) => (
  <ElementWithIcon icon={icon} iconSize={iconSize}>
    <>
      {isMoney && "£"}
      <input
        className="w-full outline-0"
        name={name}
        placeholder={placeholder}
        type={type}
        disabled={disabled}
        required={required}
        onFocus={onFocus}
        onBlur={onBlur}
        onChange={onChange}
        onMouseOver={onMouseOver}
      />
    </>
  </ElementWithIcon>
);

export const SelectWithIcon = ({
  icon,
  iconSize = "normal",
  children,
  name,
  required,
  disabled,
  onFocus,
  onBlur,
  onChange,
  onMouseOver,
}: React.SelectHTMLAttributes<HTMLSelectElement> & IconProps) => (
  <ElementWithIcon icon={icon} iconSize={iconSize}>
    <select
      className="w-full outline-0"
      name={name}
      required={required}
      disabled={disabled}
      onFocus={onFocus}
      onBlur={onBlur}
      onChange={onChange}
      onMouseOver={onMouseOver}
    >
      {children}
    </select>
  </ElementWithIcon>
);

export const TextareaWithIcon = ({
  icon,
  iconSize,
  name,
  placeholder,
  rows,
  cannotResize = false,
  required,
  disabled,
  ref,
  onFocus,
  onBlur,
  onChange,
  onMouseOver,
  onInput,
}: TextareaWithIconProps) => (
  <ElementWithIcon icon={icon} iconSize={iconSize}>
    <textarea
      className={`w-full outline-0 leading-snug my-1.5 ${
        cannotResize ? "resize-none" : ""
      }`}
      name={name}
      placeholder={placeholder}
      rows={rows}
      disabled={disabled}
      required={required}
      ref={ref}
      onFocus={onFocus}
      onBlur={onBlur}
      onChange={onChange}
      onMouseOver={onMouseOver}
      onInput={onInput}
    />
  </ElementWithIcon>
);

export const DatePickerWithIcon = ({
  icon,
  iconSize,
  selected,
  onChange,
  dateFormat,
  placeholderText,
  hideYearDropdown = false,
  id,
}: DatePickerWithIconProps) => (
  <ElementWithIcon icon={icon} iconSize={iconSize}>
    <div className="w-full">
      <DatePicker
        selected={selected}
        onChange={onChange}
        placeholderText={placeholderText}
        showYearDropdown={!hideYearDropdown}
        dateFormat={dateFormat}
        id={id}
        className="w-full outline-none"
      />
    </div>
  </ElementWithIcon>
);

export default ElementWithIcon;
