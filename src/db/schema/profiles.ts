import {
  pgTable,
  uuid,
  varchar,
  boolean,
  integer,
  pgSchema,
} from "drizzle-orm/pg-core";
import { universitiesTable } from "./universities";

const authSchema = pgSchema("auth");

const users = authSchema.table("users", {
  id: uuid("id").primaryKey(),
});

export const profilesTable = pgTable("profiles", {
  id: uuid("id")
    .primaryKey()
    .references(() => users.id),
  avatarUrl: varchar("avatar_url"),
  universityId: integer("university_id").references(
    () => universitiesTable.id,
    { onDelete: "cascade" }
  ),
  isStaff: boolean("is_staff").notNull().default(false),
});
