import {
  type RouteConfig,
  index,
  prefix,
  route,
} from "@react-router/dev/routes";

export default [
  index("routes/Home.tsx"),
  route("log-in", "routes/LogIn.tsx"),
  route("log-out", "routes/LogOut.tsx"),
  route("sign-up", "routes/SignUp.tsx", [
    index("routes/SignUpForm.tsx"),
    route("confirm", "routes/ConfirmEmail.tsx"),
  ]),
  route(":universitySlug/events", "routes/Events.tsx"),
  ...prefix("auth", [route("confirm", "resources/confirm.ts")]),
] satisfies RouteConfig;
