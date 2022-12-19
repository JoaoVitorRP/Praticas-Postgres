CREATE TABLE "products"(
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(50) NOT NULL,
    "price" INTEGER NOT NULL,
    "category_id" INTEGER NOT NULL REFERENCES "categories"("id"),
    "size_id" INTEGER NOT NULL REFERENCES "sizes"("id") 
);
