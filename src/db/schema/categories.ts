import { pgTable, serial, varchar } from "drizzle-orm/pg-core";

export const categoriesTable = pgTable("categories", {
  id: serial("id").primaryKey(),
  name: varchar("name").notNull(),
  coverPhotoUrl: varchar("cover_photo_url").notNull(),
});
