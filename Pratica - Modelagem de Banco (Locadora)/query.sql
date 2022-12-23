CREATE DATABASE "movies_rental_store";

CREATE TABLE "states" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT UNIQUE NOT NULL
);

CREATE TABLE "cities" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "state_id" INTEGER NOT NULL REFERENCES "states"("id")
);

CREATE TABLE "addresses" (
    "id" SERIAL PRIMARY KEY,
    "city_id" INTEGER NOT NULL REFERENCES "cities"("id"),
    "district" TEXT NOT NULL,
    "zip_code" VARCHAR(9) NOT NULL,
    "street" TEXT NOT NULL,
    "number" TEXT NOT NULL,
    "complement" TEXT NOT NULL
);

CREATE TABLE "customers" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "cpf" VARCHAR(14) UNIQUE NOT NULL,
    "main_phone" INTEGER NOT NULL,
    "address_id" INTEGER NOT NULL REFERENCES "addresses"("id")
);

CREATE TABLE "phones" (
    "id" SERIAL PRIMARY KEY,
    "number" TEXT UNIQUE NOT NULL
);

CREATE TABLE "clientsPhones" (
    "id" SERIAL PRIMARY KEY,
    "phone_id" INTEGER NOT NULL REFERENCES "phones"("id"),
    "client_id" INTEGER NOT NULL REFERENCES "customers"("id")
);

CREATE TABLE "ratings" (
    "id" SERIAL PRIMARY KEY,
    "value" INTEGER UNIQUE NOT NULL
);

CREATE TABLE "rentals" (
    "id" SERIAL PRIMARY KEY,
    "client_id" INTEGER NOT NULL REFERENCES "customers"("id"),
    "rental_date" DATE NOT NULL DEFAULT CURRENT_DATE,
    "return_date" DATE DEFAULT NULL,
    "service_rating_id" INTEGER REFERENCES "ratings"("id") DEFAULT NULL
);

CREATE TABLE "countries" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL
);

CREATE TABLE "actors" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "nationality_id" INTEGER NOT NULL REFERENCES "countries"("id"),
    "birthday" DATE NOT NULL
);

CREATE TABLE "categories" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT UNIQUE NOT NULL
);

CREATE TABLE "movies" (
    "id" SERIAL PRIMARY KEY,
    "title" TEXT NOT NULL,
    "category_id" INTEGER NOT NULL REFERENCES "categories"("id")
);

CREATE TABLE "moviesActors" (
    "id" SERIAL PRIMARY KEY,
    "movie_id" INTEGER NOT NULL REFERENCES "movies"("id"),
    "actor_id" INTEGER NOT NULL REFERENCES "actors"("id")
);

CREATE TABLE "disks" (
    "id" SERIAL PRIMARY KEY,
    "number" TEXT UNIQUE NOT NULL,
    "barcode" TEXT UNIQUE NOT NULL,
    "movie_id" INTEGER NOT NULL REFERENCES "movies"("id")
);

CREATE TABLE "rentalsDisks" (
    "id" SERIAL PRIMARY KEY,
    "rental_id" INTEGER NOT NULL REFERENCES "rentals"("id"),
    "disk_id" INTEGER NOT NULL REFERENCES "disks"("id"),
    "movie_rating_id" INTEGER REFERENCES "ratings"("id") DEFAULT NULL
);

ALTER TABLE "customers" ADD CONSTRAINT "customers_fk0" FOREIGN KEY ("main_phone") REFERENCES "phones"("id");
