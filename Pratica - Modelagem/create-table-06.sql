CREATE TABLE "photos"(
    "id" SERIAL PRIMARY KEY,
    "product_id" INTEGER NOT NULL REFERENCES "products"("id"),
    "photo" TEXT NOT NULL,
    "is_main" BOOLEAN NOT NULL DEFAULT FALSE
);
