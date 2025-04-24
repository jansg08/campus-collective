import { Body, Font, Head, Html, Tailwind } from "@react-email/components";
import tailwindConfig from "./tailwind.config";

interface EmailTemplateProps {
  children: React.ReactNode;
}

export const EmailTemplate = ({ children }: EmailTemplateProps) => {
  return (
    <Html>
      <Head>
        <Font
          fontFamily="Source Serif 4"
          fallbackFontFamily={"Times New Roman"}
          webFont={{
            url: "https://fonts.gstatic.com/s/sourceserif4/v13/vEFI2_tTDB4M7-auWDN0ahZJW1gb8te1Xb7G.woff2",
            format: "woff2",
          }}
          fontWeight={360}
        />
        <style>
          {
            "button { border: none; } p { margin: 0 } body { color: #044c3b; background-color: #f7f4e9 }"
          }
        </style>
      </Head>
      <Tailwind config={tailwindConfig}>
        <Body>{children}</Body>
      </Tailwind>
    </Html>
  );
};

export default EmailTemplate;
