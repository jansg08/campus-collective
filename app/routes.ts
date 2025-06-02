import {
  type RouteConfig,
  index,
  prefix,
  route,
} from "@react-router/dev/routes";

export default [
  index("routes/Home.tsx"),
  route("log-in", "routes/LogIn.tsx"),
  route("log-out", "resources/logOut.ts"),
  route("sign-up", "routes/SignUp.tsx", [
    index("routes/SignUpForm.tsx"),
    route("confirm", "routes/ConfirmEmail.tsx"),
  ]),
  route(":universitySlug/events", "routes/Events.tsx"),
  route(":universitySlug/events/:eventId", "routes/EventListing.tsx", [
    route("confirm", "routes/ConfirmBooking.tsx", [
      index("routes/ConfirmBookingForm.tsx"),
      route("success", "routes/BookingSuccess.tsx"),
    ]),
  ]),
  route("create-event", "routes/CreateEvent.tsx"),
  ...prefix("profile", [
    route("update-university", "resources/updateUniversity.ts"),
  ]),
  ...prefix("auth", [route("confirm", "resources/confirm.ts")]),
] satisfies RouteConfig;
