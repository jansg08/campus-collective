import {
  pgTable,
  serial,
  varchar,
  integer,
  geometry,
} from "drizzle-orm/pg-core";
import { universitiesTable } from "./universities";

export const venuesTable = pgTable("venues", {
  id: serial("id").primaryKey(),
  universityId: integer("university_id")
    .notNull()
    .references(() => universitiesTable.id, { onDelete: "cascade" }),
  location: geometry("location", { type: "point", mode: "xy", srid: 4326 }),
  name: varchar("name").notNull(),
  maxCapacity: integer("max_capacity"),
});
