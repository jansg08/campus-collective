import {
  Body,
  Container,
  Font,
  Head,
  Html,
  Preview,
  Tailwind,
} from "@react-email/components";
import tailwindConfig from "./tailwind.config";
import { preview } from "vite";

interface EmailTemplateProps {
  children: React.ReactNode;
  preview?: string;
  maxWidth?: `max-w-${string}`;
}

export const EmailTemplate = ({
  children,
  preview,
  maxWidth,
}: EmailTemplateProps) => {
  return (
    <Html>
      <Head>
        <Font
          fontFamily="Source Serif 4"
          fallbackFontFamily={"Georgia"}
          webFont={{
            url: "https://fonts.gstatic.com/s/sourceserif4/v13/vEFI2_tTDB4M7-auWDN0ahZJW1gb8te1Xb7G.woff2",
            format: "woff2",
          }}
          fontWeight={360}
        />
        <style>
          {
            "button { border: none; } p { margin: 0; } h1,h2,h3,h4,h5,h6 { margin: 0px; }"
          }
        </style>
      </Head>
      <Tailwind config={tailwindConfig}>
        <Body className="m-5 py-15 text-text bg-background">
          {preview && <Preview>{preview}</Preview>}
          <main>
            <Container
              className={`${maxWidth} mx-auto bg-secondary p-8 rounded-2xl shadow-xl text-center`}
            >
              {children}
            </Container>
          </main>
        </Body>
      </Tailwind>
    </Html>
  );
};

export default EmailTemplate;
