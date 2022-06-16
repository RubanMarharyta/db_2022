CREATE TABLE "bicycle" (
  "id" SERIAL PRIMARY KEY,
  "full_name" varchar,
  "created_at" timestamp,
  "size" int,
  "brand_id" int,
  "color_id" int,
  "price" int
);

CREATE TABLE "brand" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "color" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "red" int,
  "green" int,
  "blue" int,
  "transparency" int
);

CREATE TABLE "client" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "surname" varchar,
  "email" varchar,
  "phone" varchar
);

CREATE TABLE "bookings" (
  "id" SERIAL PRIMARY KEY,
  "status" varchar,
  "client_id" int,
  "bicycle_id" int,
  "quantity" int DEFAULT 1
);

ALTER TABLE "bookings" ADD FOREIGN KEY ("client_id") REFERENCES "client" ("id");

ALTER TABLE "bookings" ADD FOREIGN KEY ("bicycle_id") REFERENCES "bicycle" ("id");

ALTER TABLE "bicycle" ADD FOREIGN KEY ("brand_id") REFERENCES "brand" ("id");

ALTER TABLE "bicycle" ADD FOREIGN KEY ("color_id") REFERENCES "color" ("id");
