import { useState } from "react";

interface GenericFormFieldWithLabelProps {
  children: React.ReactNode;
  id: string;
  label: string;
  error?: string;
  hoverMsg?: React.ReactNode;
}

interface FormFieldWithLabelProps {
  genericProps: Omit<GenericFormFieldWithLabelProps, "children">;
}

interface InputWithLabelProps
  extends FormFieldWithLabelProps,
    Omit<React.InputHTMLAttributes<HTMLInputElement>, "id"> {}

const GenericFormFieldWithLabel = ({
  label,
  error,
  hoverMsg,
  id,
  children,
}: GenericFormFieldWithLabelProps) => {
  const [isHovered, setIsHovered] = useState(false);
  return (
    <div
      className={`w-full relative flex flex-col items-start ${error ? "gap-1" : ""}`}
    >
      {hoverMsg && isHovered && (
        <div
          className="absolute z-50 bg-[rgba(var(--color-rgba-text),0.7)] backdrop-blur-xs top-0 left-0 -translate-y-[calc(100%+0.25rem)] rounded-sm text-white py-1.5 px-2"
          onMouseEnter={() => setIsHovered(true)}
          onMouseLeave={() => setIsHovered(false)}
        >
          {hoverMsg}
        </div>
      )}
      <div className="bg-secondary relative rounded-lg w-full p-0.5 shadow-md flex items-center input-border transition-all has-[select:disabled]:bg-background-dim has-[input:disabled]:bg-background-dim has-[textarea:disabled]:bg-background-dim has-[select:disabled]:text-text-dim has-[input:disabled]:text-text-dim has-[textarea:disabled]:text-text-dim">
        <label className="py-2 px-4" htmlFor={id}>
          {label}
        </label>
        <div className="bg-background-light w-full py-2 px-2 rounded-md">
          {children}
        </div>
      </div>
      <p className="text-primary text-xs">{error}</p>
    </div>
  );
};

export const InputWithLabel = ({
  genericProps,
  ...inputProps
}: InputWithLabelProps) => (
  <GenericFormFieldWithLabel {...genericProps} id={genericProps.id}>
    <input className="w-full outline-0" {...inputProps} id={genericProps.id} />
  </GenericFormFieldWithLabel>
);

export default GenericFormFieldWithLabel;
