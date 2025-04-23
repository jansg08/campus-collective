import {
  pgTable,
  uuid,
  integer,
  varchar,
  timestamp,
  primaryKey,
} from "drizzle-orm/pg-core";
import { profilesTable } from "./profiles";
import { eventsTable } from "./events";

export const bookingsTable = pgTable(
  "bookings",
  {
    userId: uuid("user_id")
      .notNull()
      .references(() => profilesTable.id),
    eventId: integer("event_id")
      .notNull()
      .references(() => eventsTable.id),
    paymentRef: varchar("payment_ref"),
    dateBooked: timestamp("date_booked", { withTimezone: true })
      .notNull()
      .defaultNow(),
    icsUrl: varchar("ics_url"),
  },
  (t) => [primaryKey({ columns: [t.userId, t.eventId] })]
);
