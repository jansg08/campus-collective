import { Img } from "@react-email/components";
import EmailTemplate from "../emailTemplate";
import { config } from "dotenv";
const __dirname = import.meta.dirname;
config({ path: `${process.cwd()}/.env.local` });

const Confirmation = () => {
  return (
    <EmailTemplate>
      <table style={{ borderSpacing: "0px 20px" }}>
        <tr>
          <td>
            <Img
              src={`${process.env.S3_STORAGE_URL}/storage/v1/object/public/assets/cc-logos/Logo.png`}
              width="100%"
            />
          </td>
        </tr>
        <tr>
          <td>
            <h2 className="font-bold">
              You're one step away from joining Campus Collective.
            </h2>
          </td>
        </tr>
        <tr>
          <td>
            <p>
              Click the button below to confirm your account so you can start
              exploring everything your uni has to offer!
            </p>
          </td>
        </tr>
        <tr>
          <td>
            <a
              className="w-full block leading-none font-bold transition-all py-3 rounded-lg bg-primary text-background no-underline text-center shadow-lg"
              href="{{ .SiteURL }}/auth/confirm?token_hash={{ .TokenHash }}&type=email&next={{ .RedirectTo }}"
              target="_blank"
            >
              <span className="w-min text-nowrap">Confirm Email</span>
            </a>
          </td>
        </tr>
        <tr>
          <td>
            <p className="text-text-dim text-sm">
              If you did not recently sign up for a Campus Collective account,
              please ignore this email.
            </p>
          </td>
        </tr>
      </table>
    </EmailTemplate>
  );
};

export default Confirmation;
