CREATE TABLE "purchases"(
    "id" SERIAL PRIMARY KEY,
    "user_id" INTEGER NOT NULL REFERENCES "users"("id"),
    "product_id" INTEGER NOT NULL REFERENCES "products"("id"),
    "status_id" INTEGER NOT NULL REFERENCES "statuses"("id"),
    "date" TIMESTAMP NOT NULL DEFAULT NOW(),
    "address" TEXT NOT NULL
);
