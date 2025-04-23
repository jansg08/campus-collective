import { pgTable, serial, varchar } from "drizzle-orm/pg-core";

export const universitiesTable = pgTable("universities", {
  id: serial("id").primaryKey(), // Internal PK for joins/foreign keys
  slug: varchar("slug").notNull().unique(), // Human-readable URL-safe slug
  name: varchar("name").notNull(), // Display name
  logoUrl: varchar("logo_url").notNull(), // Logo image
  crestUrl: varchar("crest_url").notNull(), // Crest image
});
