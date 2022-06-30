
CREATE TABLE "Employees" (

    "FullName" TEXT NOT NULL,
    "Salary" INT,
    "JobPosition" TEXT,
    "PhoneExtension" INT,
    "IsPartTime" BOOL,
);
INSERT INTO "Employees"("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime") VALUES ('Angela Landsbury', 50000, 'Detective', 190, TRUE), ('Jennifer Lopez', 1000000, 'Dead singer impersonator', 191, TRUE), ('John Oliver', 10, 'Sarcasm', 192, TRUE), ('Marianne Faithful', 10, 'Hobo on a wall', 193, TRUE), ('Ruth Bader Ginsburg', 80000000, 'Being right', 194, TRUE), ('Mary Stuart', 1000000, 'Queen of Scotland', 195, TRUE), ('Mabel Rayworth', 20000, 'cook', 196, FALSE), ('Mark Hardy', 20000, 'Manager', 200, FALSE), ('Jeremy Renner', 0, 'Hawk eye', 201, True), ('Martin T Parting', 50000, 'cook', 202, FALSE); 

SELECT * FROM "Employees"

SELECT "FullName", "PhoneExtension" FROM "Employees" WHERE "IsPartTime" = TRUE

INSERT INTO "Employees" ( "FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime" )
.............................        VALUES ('Malcolm Gladwell', 450, 'software developer', 197, TRUE);

UPDATE "Employees" SET "Salary" = '500' WHERE "JobPosition" = 'cook';

INSERT INTO "Employees" ( "FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime" )
............................. VALUES ('Lazy larry', 180, 'Machinist', 197, FALSE);

DELETE FROM "Employees" WHERE "FullName" = 'Lazy Larry';

SELECT * FROM "Employees";

DELETE FROM "Employees" WHERE "FullName" = 'Lazy Larry';

SELECT * FROM "Employees";