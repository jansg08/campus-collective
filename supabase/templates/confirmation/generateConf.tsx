import { render } from "@react-email/render";
import Confirmation from "./confirmation";
import { writeFile } from "fs/promises";

const __dirname = import.meta.dirname;

const html = await render(<Confirmation />, {
  pretty: true,
});

writeFile(`${__dirname}/index.html`, html)
  .then(() => console.log("Success"))
  .catch((err) => console.log(err));
