import {
  type RouteConfig,
  index,
  prefix,
  route,
} from "@react-router/dev/routes";

export default [
  index("routes/Home.tsx"),
  route("log-in", "routes/LogIn.tsx"),
  route("sign-up", "routes/SignUp.tsx", [
    index("routes/SignUpForm.tsx"),
    route("confirm", "routes/ConfirmEmail.tsx"),
  ]),
  route(":university_slug/events", "routes/Events.tsx"),
  ...prefix("auth", [route("confirm", "resources/confirm.ts")]),
] satisfies RouteConfig;
