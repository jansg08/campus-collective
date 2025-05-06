import { Img } from "@react-email/components";
import EmailTemplate from "../emailTemplate";
import { config } from "dotenv";
const __dirname = import.meta.dirname;
config({ path: `${process.cwd()}/.env.local` });

const Confirmation = () => {
  return (
    <EmailTemplate>
      <main className="flex items-center justify-center w-screen h-screen">
        <div className="flex flex-col gap-28 w-80 bg-secondary p-8 rounded-2xl shadow-xl">
          <Img
            src={`${process.env.S3_STORAGE_URL}/storage/v1/object/public/assets/cc-logos/Logo.png`}
            width="100%"
          />
          <div className="flex flex-col gap-5">
            <p>Please click the button below to confirm your email address.</p>
            <a
              href="{{ .SiteURL }}/auth/confirm?token_hash={{ .TokenHash }}&type=email&next={{ .RedirectTo }}"
              className="w-full leading-none font-bold transition-all py-3 rounded-lg bg-primary text-background no-underline flex items-center justify-center shadow-lg"
              target="_blank"
            >
              <span className="w-min text-nowrap">Confirm Email</span>
            </a>
            <p className="text-text-dim text-sm">
              If you did not recently sign up for a Campus Collective account,
              please ignore this email.
            </p>
          </div>
        </div>
      </main>
    </EmailTemplate>
  );
};

export default Confirmation;
