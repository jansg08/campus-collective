import { pgTable, uuid, integer, primaryKey } from "drizzle-orm/pg-core";
import { profilesTable } from "./profiles";
import { venuesTable } from "./venues";

export const venueAuthoritiesTable = pgTable(
  "venue_authorities",
  {
    userId: uuid("user_id")
      .notNull()
      .references(() => profilesTable.id),
    venueId: integer("venue_id")
      .notNull()
      .references(() => venuesTable.id),
  },
  (t) => [primaryKey({ columns: [t.userId, t.venueId] })]
);
