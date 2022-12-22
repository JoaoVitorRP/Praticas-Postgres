CREATE DATABASE "course_db";

CREATE TABLE "students" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "cpf" VARCHAR(14) UNIQUE NOT NULL,
    "email" TEXT UNIQUE NOT NULL
);

CREATE TABLE "classes" (
    "id" SERIAL PRIMARY KEY,
    "code" TEXT UNIQUE NOT NULL
);

CREATE TYPE grade_name AS ENUM('Abaixo das expectativas', 'Dentro das expectativas', 'Acima das expectativas');

CREATE TABLE "grade_names" (
    "id" SERIAL PRIMARY KEY,
    "name" grade_name UNIQUE NOT NULL
);

CREATE TABLE "modules" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT UNIQUE NOT NULL
);

CREATE TABLE "projects" (
    "id" SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "module_id" INTEGER NOT NULL REFERENCES "modules"("id"),
    "due_to" TIMESTAMP WITHOUT TIME ZONE NOT NULL
);

CREATE TABLE "enrollments" (
    "id" SERIAL PRIMARY KEY,
    "student_id" INTEGER NOT NULL REFERENCES "students"("id"),
    "class_id" INTEGER NOT NULL REFERENCES "classes"("id"),
    "join_date" DATE NOT NULL DEFAULT CURRENT_DATE,
    "end_date" DATE NOT NULL DEFAULT NULL
);

CREATE TABLE "grades" (
    "id" SERIAL PRIMARY KEY,
    "project_id" INTEGER NOT NULL REFERENCES "projects"("id"),
    "student_id" INTEGER NOT NULL REFERENCES "students"("id"),
    "grade_id" INTEGER NOT NULL REFERENCES "grades"("id")
);

CREATE TABLE "project_deliveries" (
    "id" SERIAL PRIMARY KEY,
    "project_id" INTEGER NOT NULL REFERENCES "projects"("id"),
    "student_id" INTEGER NOT NULL REFERENCES "students"("id"),
    "link" TEXT NOT NULL,
    "date" TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
);
