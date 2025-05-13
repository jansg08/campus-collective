import {
  isRouteErrorResponse,
  Links,
  Meta,
  Outlet,
  Scripts,
  ScrollRestoration,
} from "react-router";

import type { Route } from "./+types/root";
import "./app.css";
import Header from "./components/Header";
import { db } from "src/db";
import { profilesTable } from "src/db/schema/profiles";
import { eq } from "drizzle-orm";
import { getSupabaseClientWithSession } from "./auth/supabase.server";

export const links: Route.LinksFunction = () => [
  { rel: "preconnect", href: "https://fonts.googleapis.com" },
  {
    rel: "preconnect",
    href: "https://fonts.gstatic.com",
    crossOrigin: "anonymous",
  },
  {
    rel: "stylesheet",
    href: "https://fonts.googleapis.com/css2?family=Source+Serif+4:ital,opsz,wght@0,8..60,200..900;1,8..60,200..900&display=swap",
  },
];

export function Layout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en">
      <head>
        <meta charSet="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <Meta />
        <Links />
      </head>
      <body>
        {children}
        <ScrollRestoration />
        <Scripts />
      </body>
    </html>
  );
}

export const loader = async ({ request }: Route.LoaderArgs) => {
  const { supabase, headers } = await getSupabaseClientWithSession(request);
  const userResponse = await supabase.auth.getUser();

  if (!userResponse.error && userResponse.data.user) {
    try {
      const [result] = await db
        .select({
          avatarUrl: profilesTable.avatarUrl,
        })
        .from(profilesTable)
        .where(eq(profilesTable.id, userResponse.data.user.id));

      return new Response(
        JSON.stringify({
          user: {
            ...userResponse.data.user,
            avatarUrl: result.avatarUrl || "",
          },
        }),
        {
          headers,
        }
      );
    } catch (err) {
      console.log(err);
    }
  }

  return new Response(JSON.stringify({}), { headers });
};

export default function App({ loaderData }: Route.ComponentProps) {
  const { user = null } = JSON.parse(loaderData);
  return (
    <>
      <Header
        authenticated={user}
        avatarUrl={user?.avatarUrl}
        isStaff={user?.user_metadata?.is_staff}
      />
      <main className="pt-20">
        <Outlet />
      </main>
    </>
  );
}

export function ErrorBoundary({ error }: Route.ErrorBoundaryProps) {
  let message = "Oops!";
  let details = "An unexpected error occurred.";
  let stack: string | undefined;

  if (isRouteErrorResponse(error)) {
    message = error.status === 404 ? "404" : "Error";
    details =
      error.status === 404
        ? "The requested page could not be found."
        : error.statusText || details;
  } else if (import.meta.env.DEV && error && error instanceof Error) {
    details = error.message;
    stack = error.stack;
  }

  return (
    <main className="pt-16 p-4 container mx-auto">
      <h1>{message}</h1>
      <p>{details}</p>
      {stack && (
        <pre className="w-full p-4 overflow-x-auto">
          <code>{stack}</code>
        </pre>
      )}
    </main>
  );
}
