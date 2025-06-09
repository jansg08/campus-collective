<p align="center">
  <img alt="Logo for Campus Collective" src="./app/svgs/Logo.svg" width="512">
</p>

### You can view the hosted version [here](https://campus-collective.jack.hansjee.com).

# Summary

Campus Collective is a student-first events platform designed to showcase all the entertainment a university has to offer, allowing fellow students to experience home-grown talent.

Every user starts at the landing page. From there, they have the option to either make an account first or start browsing events immediately. The authentication layer sits as far back in the application as possible to prevent user's from being put off by having to hand over their data. If they opt to browse first they can find a list of partner universities at the bottom.

Once they've selected a uni, they're greeted with all the events for that university complete with a toggleable filter/sort menu as well as a search bar to refine results. They also have the option to switch between universities seamlessly by clicking on the university name at the top of the page and selecting a different one from the dropdown that appears.

All events display with brief but sufficient information along with an image to catch the user's eye. This image can be uploaded by the host of the event but will default to a standard image for whatever category the event falls under.

Upon selecting a event but clicking its card, the user is presented with more comprehensive information including a description of the event and a map box contextualising its location. For a more feature-rich map environment, the user can click on the venue name which will take them to its google maps entry.

This is the furthest a user can go unauthenticated, so in order to confirm their booking they must either log into an exisiting account or create a new one. If this is the case, the confirm booking button will be replaced with a link to log in. For a new user, just an email address and password is required to create an account. Form data is validated client-side first to inform the user of any issue promptly. To protect against spam accounts, new signups require email confirmation. Once this step is completed, the user can authenticate themselves on the platform.

Now authenticated, the user is able to complete the signup process for and event by selecting the 'Book Now' button on its listing and then, provided it's a free event, click 'Confirm Booking'. This will then bring them straight to the same event listing but now inside there account. It now includes the option to add the event to their calendar via client-side generation of a .ics file representing the event. They can use this save the event to a calendar client of their choosing.

Authenticated users can always view any events they've signed up for by using the navigation links in the header as well as update any details such as their university on their profile page.

# Running Locally

This project relies on two applications to function, each has it's own setup:

## React Router v7

Requests are made to a React Router v7 (RRv7) project in framework mode (formerly Remix). The development and build processes are handled by vite. The setup is as follows:

1. In a terminal window clone down the repository with `git clone https://github.com/jansg08/campus-collective.git`
2. Install the dependencies with `npm i`
3. Start the dev server with `npm run dev`. This can sometimes take a some time while the tsconfig initialises. If you haven't got the Supabase instance running, the dev server will likely show an error - continue to the next section to resolve this.

## Supabase

The database leverages PostgreSQL hosted with a Supabase instance. When developing locally, this runs inside a Docker container with Docker Desktop. Drizzle ORM provides the bridge between TypeScript and Postgres for database queries with authentication being handled by resource endpoints in the RRv7 app and Supabase's auth API. The setup is as follows:

1. [Follow these instructions for installing/updating the Supabase CLI.](https://supabase.com/docs/guides/local-development/cli/getting-started?queryGroups=platform&platform=windows#installing-the-supabase-cli) **Important - Only complete the CLI installation/updating process from this article**
2. [Download and install Docker Desktop for your system](https://docs.docker.com/desktop/).
3. In a terminal window, navigate to the cloned repository's directory from the section above. Then run `supabase start`. This will pull down the Supabase Docker images, run all the database migrations already in the project, and then populate the data with the seed.sql file.
4. Create a file in the root of the repository called '.env.local'. Copy the following environment variables into it:

   _Note - if you want to access the dev server and supabase instance over the local network, where `localhost` is present, replace it with your computer's private IP_

   - `DATABASE_URL=postgresql://postgres.pooler-dev:postgres@localhost:54329/postgres`
   - `SUPABASE_URL=http://localhost:54321`
   - `SUPABASE_ANON_KEY=VALUE` - the `VALUE` for this environment variable can be found by running the command `supabase status` in the terminal and copying the 'anon key'.
   - `BASE_URL=http://localhost:5173`
   - `S3_STORAGE_URL=http://localhost:54321` - the S3 bucket is accessed via the default Supabase API it's the same as the `SUPABASE_URL`. It's separated for the event that the production app needs to store assets with a different service.

5. If not already running, start the RRv7 dev server with `npm run dev` to ensure Supabase has successfully interfaced with the project. You should be able to log in to the app with the email `user1@example.com` and password `password123`.
6. To stop the docker container, run `supabase stop`. If you're developing offline, instead stop the docker engine since `supabase start` makes some network requests and won't work without an internet connection. Restarting the docker engines should restore the container automatically. To re-seed the database, run `supabase db reset`.
