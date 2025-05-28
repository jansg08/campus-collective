export interface ServerErrorProps {
  code: string;
  message?: string;
  data?: {
    [key: string]: string;
  };
}
