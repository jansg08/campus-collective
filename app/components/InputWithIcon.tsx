import { useRef, useState, type FormEvent, type SyntheticEvent } from "react";
import DatePicker from "react-datepicker";
import "react-datepicker/dist/react-datepicker.css";

interface IconAndErrorProps {
  iconSize?: "normal" | "large";
  icon: React.ReactNode;
  error?: string;
  hoverMsg?: string | React.ReactNode;
}

interface ElementWithIconProps extends IconAndErrorProps {
  children: React.ReactNode;
  id?: string;
}

interface InputWithIconProps
  extends IconAndErrorProps,
    React.InputHTMLAttributes<HTMLInputElement> {
  isMoney?: boolean;
}

interface TextareaWithIconProps
  extends IconAndErrorProps,
    React.TextareaHTMLAttributes<HTMLTextAreaElement> {
  cannotResize?: boolean;
}

interface DatePickerWithIconProps extends IconAndErrorProps {
  selected: Date | null;
  onChange?: (...args: any[]) => void;
  placeholderText?: string;
  timeInputLabel?: string;
  timeCaption?: string;
  hideYearDropdown?: boolean;
  showTimeInput?: boolean;
  showTimeSelect?: boolean;
  dateFormat: string;
  minDate?: Date;
  timeIntervals?: number;
  required?: boolean;
  isClearable?: boolean;
  id?: string;
  name?: string;
}

const ElementWithIcon = ({
  icon,
  iconSize = "normal",
  error,
  hoverMsg,
  id,
  children,
}: ElementWithIconProps) => {
  const [isHovered, setIsHovered] = useState(false);
  return (
    <div className="w-full flex flex-col items-start gap-1 relative">
      {hoverMsg && isHovered && (
        <div className="absolute z-50 bg-[rgba(var(--color-rgba-text),0.7)] backdrop-blur-xs top-0 left-0 -translate-y-[calc(100%+0.25rem)] rounded-sm text-white py-1.5 px-2">
          {hoverMsg}
        </div>
      )}
      <div
        onMouseEnter={() => setIsHovered(true)}
        onMouseLeave={() => setIsHovered(false)}
        className="bg-background-light relative rounded-lg w-full shadow-md py-1 pr-1 pl-4 flex justify-end gap-1.5 items-center input-border transition-all has-[select:disabled]:bg-background-dim has-[input:disabled]:bg-background-dim has-[textarea:disabled]:bg-background-dim has-[select:disabled]:text-text-dim has-[input:disabled]:text-text-dim has-[textarea:disabled]:text-text-dim"
      >
        {children}
        <label htmlFor={id} className="mb-auto">
          <div
            className={`rounded-sm ${
              iconSize === "normal" ? "p-1.5" : "p-0.5"
            } bg-secondary`}
          >
            {icon}
          </div>
        </label>
      </div>
      <p className="text-primary text-xs">{error}</p>
    </div>
  );
};

export const InputWithIcon = ({
  icon,
  iconSize = "normal",
  error,
  hoverMsg,
  isMoney = false,
  name,
  id,
  type,
  placeholder,
  required,
  disabled,
  onFocus,
  onBlur,
  onChange,
  onMouseOver,
}: InputWithIconProps) => (
  <ElementWithIcon
    icon={icon}
    iconSize={iconSize}
    error={error}
    id={id}
    hoverMsg={hoverMsg}
  >
    <>
      {isMoney && "£"}
      <input
        className="w-full outline-0"
        name={name}
        id={id}
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
  error,
  hoverMsg,
  children,
  name,
  id,
  required,
  disabled,
  onFocus,
  onBlur,
  onChange,
  onMouseOver,
}: React.SelectHTMLAttributes<HTMLSelectElement> & IconAndErrorProps) => (
  <ElementWithIcon
    icon={icon}
    iconSize={iconSize}
    error={error}
    id={id}
    hoverMsg={hoverMsg}
  >
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
  error,
  hoverMsg,
  name,
  id,
  placeholder,
  rows,
  cannotResize = false,
  required,
  disabled,
  onFocus,
  onBlur,
  onChange,
  onMouseOver,
  onInput,
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
    <ElementWithIcon
      icon={icon}
      iconSize={iconSize}
      error={error}
      id={id}
      hoverMsg={hoverMsg}
    >
      <textarea
        className={`w-full outline-0 leading-snug my-1.5 ${
          cannotResize ? "resize-none" : ""
        }`}
        name={name}
        id={id}
        placeholder={placeholder}
        rows={rows}
        disabled={disabled}
        required={required}
        ref={ref}
        onInput={handleHeight}
        onFocus={onFocus}
        onBlur={onBlur}
        onChange={onChange}
        onMouseOver={onMouseOver}
      />
    </ElementWithIcon>
  );
};

export const DatePickerWithIcon = ({
  icon,
  iconSize,
  error,
  hoverMsg,
  selected,
  required = false,
  onChange,
  dateFormat,
  minDate,
  placeholderText,
  timeInputLabel,
  timeCaption,
  hideYearDropdown = false,
  showTimeInput = false,
  showTimeSelect = false,
  timeIntervals,
  isClearable = false,
  id,
  name,
}: DatePickerWithIconProps) => (
  <ElementWithIcon
    icon={icon}
    iconSize={iconSize}
    error={error}
    id={id}
    hoverMsg={hoverMsg}
  >
    <DatePicker
      selected={selected}
      onChange={onChange}
      placeholderText={placeholderText}
      timeInputLabel={timeInputLabel}
      timeCaption={timeCaption}
      showYearDropdown={!hideYearDropdown}
      showTimeInput={showTimeInput}
      showTimeSelect={showTimeSelect}
      dateFormat={dateFormat}
      minDate={minDate}
      timeIntervals={timeIntervals}
      required={required}
      isClearable={isClearable}
      id={id}
      name={name}
      className="w-full outline-none"
    />
  </ElementWithIcon>
);

export default ElementWithIcon;
