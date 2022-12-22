CREATE DATABASE "travel_agency";

CREATE TABLE "airlines" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT UNIQUE NOT NULL,
    "acronym" TEXT UNIQUE NOT NULL
);

CREATE TABLE "airports" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT UNIQUE NOT NULL,
    "acronym" TEXT UNIQUE NOT NULL
);

CREATE TABLE "flights" (
    "id" SERIAL PRIMARY KEY,
    "acronym" TEXT UNIQUE NOT NULL,
    "airline_id" INTEGER NOT NULL REFERENCES "airlines"("id"),
    "departure_airport_id" INTEGER NOT NULL REFERENCES "airports"("id"),
    "departure_date" TIMESTAMP WITH TIME ZONE NOT NULL,
    "arrival_airport_id" INTEGER NOT NULL REFERENCES "airports"("id"),
    "arrival_date" TIMESTAMP WITH TIME ZONE NOT NULL
);