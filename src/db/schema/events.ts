import {
  pgTable,
  serial,
  varchar,
  text,
  timestamp,
  uuid,
  boolean,
  integer,
} from "drizzle-orm/pg-core";
import { venuesTable } from "./venues";
import { profilesTable } from "./profiles";
import { categoriesTable } from "./categories";

export const eventsTable = pgTable("events", {
  id: serial("id").primaryKey(),
  title: varchar("title").notNull(),
  description: text("description"),
  startTime: timestamp("start_time", { withTimezone: true }).notNull(),
  endTime: timestamp("end_time", { withTimezone: true }).notNull(),
  venueId: integer("venue_id")
    .notNull()
    .references(() => venuesTable.id),
  ticketPrice: integer("ticket_price").notNull(), // ticket price stored in pence
  coverPhotoUrl: varchar("cover_photo_url"),
  host: uuid("host")
    .notNull()
    .references(() => profilesTable.id),
  creator: uuid("creator")
    .notNull()
    .references(() => profilesTable.id),
  isListed: boolean("is_listed").notNull(),
  isPublic: boolean("is_public").notNull(),
  categoryId: integer("category_id")
    .notNull()
    .references(() => categoriesTable.id),
});
