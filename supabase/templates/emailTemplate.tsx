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
          fallbackFontFamily={"Georgia"}
          webFont={{
            url: "https://fonts.gstatic.com/s/sourceserif4/v13/vEFI2_tTDB4M7-auWDN0ahZJW1gb8te1Xb7G.woff2",
            format: "woff2",
          }}
          fontWeight={360}
        />
        <style>
          {
            "button { border: none; } p { margin: 0 } body { color: #044c3b; background-color: #f7f4e9 } h1,h2,h3,h4,h5,h6 { margin: 0px }"
          }
        </style>
      </Head>
      <Tailwind config={tailwindConfig}>
        <Body className="m-0 w-screen box-border">
          <main className="absolute top-0 left-0 w-full h-full p-5 box-border">
            <table className="w-full h-full">
              <tr>
                <td></td>
              </tr>
              <tr>
                <td>
                  <div className="max-w-80 mx-auto bg-secondary p-8 rounded-2xl shadow-xl text-center">
                    {children}
                  </div>
                </td>
              </tr>
              <tr>
                <td></td>
              </tr>
            </table>
          </main>
        </Body>
      </Tailwind>
    </Html>
  );
};

export default EmailTemplate;
