import type { FormEvent } from "react";

interface formatErrorParams {
  input: HTMLInputElement;
  formData: FormData;
}

export const formatError = ({ input, formData }: formatErrorParams) => {
  switch (input.name) {
    case "email":
      if (input.validity.valueMissing) {
        return "Email is required";
      } else if (input.validity.typeMismatch) {
        return "Email is invalid";
      }
      break;
    case "password":
      if (input.validity.valueMissing) {
        return "Password is required";
      }
      break;
    case "confirmPassword":
      if (input.validity.valueMissing) {
        return "Password confirmation is required";
      } else if (input.value !== formData.get("password")) {
        return "Passwords do not match";
      }
      break;
    default:
      if (input.validity.valueMissing) {
        return `${input.name[0].toUpperCase + input.name.slice(1)} is required`;
      } else if (input.validity.typeMismatch) {
        return `${input.name[0].toUpperCase + input.name.slice(1)} is invalid`;
      }
  }
  return "";
};

export const handleFormSubmit =
  <FormErrors extends Record<string, string>>(
    setClientErrors: React.Dispatch<React.SetStateAction<FormErrors>>
  ) =>
  (event: FormEvent<HTMLFormElement>) => {
    const form = event.currentTarget;
    const formData = new FormData(form);

    for (const input of form.elements) {
      if (input instanceof HTMLInputElement) {
        input.setCustomValidity(formatError({ input, formData }));
        setClientErrors((errors) => ({
          ...errors,
          [input.name]: input.validationMessage,
        }));
      }
      if (!form.reportValidity()) {
        event.preventDefault();
      }
    }
  };

export const handleInvalid = (event: FormEvent<HTMLFormElement>) => {
  event.preventDefault();
};
