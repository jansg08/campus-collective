import type { FormEvent } from "react";

interface formatErrorParams {
  input: HTMLInputElement | HTMLSelectElement;
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
    case "start_date":
      if (input.validity.valueMissing) {
        return "Start date is required";
      }
      break;
    case "end_date":
      if (input.validity.valueMissing) {
        return "End date is required";
      }
      break;
    case "ticketPrice":
      if (input.validity.valueMissing) {
        return "Ticket price is required";
      }
      break;
    default:
      if (input.validity.valueMissing || input.value == "-1") {
        return `${
          input.name[0].toUpperCase() + input.name.slice(1)
        } is required`;
      } else if (input.validity.typeMismatch) {
        return `${
          input.name[0].toUpperCase() + input.name.slice(1)
        } is invalid`;
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
      if (
        input instanceof HTMLInputElement ||
        input instanceof HTMLSelectElement
      ) {
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
