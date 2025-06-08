import { Button, Heading, Img, Section, Text } from "@react-email/components";
import EmailTemplate from "../emailTemplate";
import { config } from "dotenv";
const __dirname = import.meta.dirname;
config({ path: `${process.cwd()}/.env.local` });

const Confirmation = () => {
  return (
    <EmailTemplate maxWidth="max-w-96" preview="Confirm your email">
      <Section>
        <Img
          src={`https://assets-campuscollective-jack.hansjee.com/storage/v1/object/public/assets/cc-logos/Logo.png`}
          width="100%"
          className="mb-10"
        />
        <Heading as="h2">
          You're one step away from joining Campus Collective.
        </Heading>
        <Text className="text-base my-5">
          Click the button below to confirm your account so you can start
          exploring everything your uni has to offer!
        </Text>
        <Button
          href="{{ .SiteURL }}/auth/confirm?token_hash={{ .TokenHash }}&type=email&next={{ .RedirectTo }}"
          target="_blank"
          className="w-full block leading-none font-bold transition-all py-3 rounded-lg bg-primary text-background no-underline text-center shadow-lg"
        >
          Confirm Email
        </Button>
        <Text className="text-text-dim text-sm mb-0 mt-5">
          If you did not recently sign up for a Campus Collective account,
          please ignore this email.
        </Text>
      </Section>
    </EmailTemplate>
  );
};

export default Confirmation;
