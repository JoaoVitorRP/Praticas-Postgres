CREATE DATABASE "bank_db";

CREATE TABLE "states" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT UNIQUE NOT NULL
);

CREATE TABLE "cities" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "stateId" INTEGER NOT NULL REFERENCES "states"("id")
);

CREATE TABLE "customers" (
    "id" SERIAL PRIMARY KEY,
    "fullName" VARCHAR(50) NOT NULL,
    "cpf" VARCHAR(11) UNIQUE NOT NULL,
    "email" VARCHAR(50) UNIQUE NOT NULL,
    "password" VARCHAR(50) NOT NULL
);

CREATE TYPE phone_type AS ENUM('landline', 'mobile');

CREATE TABLE "customerPhones" (
    "id" SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
    "number" VARCHAR(20) UNIQUE NOT NULL,
    "type" phone_type
);

CREATE TABLE "customerAddresses" (
    "id" SERIAL PRIMARY KEY,
    "customerId" INTEGER UNIQUE NOT NULL REFERENCES "customers"("id"),
    "street" VARCHAR(50) NOT NULL,
    "number" VARCHAR(10) NOT NULL,
    "complement" VARCHAR(50) NOT NULL,
    "postalCode" VARCHAR(9) NOT NULL,
    "cityId" INTEGER NOT NULL REFERENCES "cities"("id")
);

CREATE TABLE "bankAccount" (
    "id" SERIAL PRIMARY KEY,
    "customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
    "accountNumber" TEXT NOT NULL,
    "agency" TEXT NOT NULL,
    "openDate" TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
    "closeDate" TIMESTAMP WITHOUT TIME ZONE DEFAULT NULL
);

CREATE TYPE transaction_type AS ENUM('deposit', 'withdraw');

CREATE TABLE "transactions" (
    "id" SERIAL PRIMARY KEY,
    "bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
    "amount" INTEGER NOT NULL,
    "type" transaction_type,
    "time" TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
    "description" VARCHAR(50) NOT NULL,
    "cancelled" BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE "creditCards" (
    "id" SERIAL PRIMARY KEY,
    "bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
    "name" VARCHAR(50) NOT NULL,
    "number" VARCHAR(20) NOT NULL,
    "securityCode" VARCHAR(3) NOT NULL,
    "expirationMonth" VARCHAR(10) NOT NULL,
    "expirationYear" VARCHAR(4) NOT NULL,
    "password" VARCHAR(4) NOT NULL,
    "limit" INTEGER NOT NULL
);
