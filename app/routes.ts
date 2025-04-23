import { type RouteConfig, index, route } from "@react-router/dev/routes";

export default [
  index("routes/Home.tsx"),
  route("/:university_slug/events", "routes/Events.tsx"),
] satisfies RouteConfig;
