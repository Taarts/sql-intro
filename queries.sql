
CREATE TABLE "Employees" (

    "FullName" TEXT NOT NULL,
    "Salary" INT,
    "JobPosition" TEXT,
    "PhoneExtension" INT,
    "IsPartTime" BOOL
);
INSERT INTO "Employees"("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime") VALUES ('Angela Landsbury', 50000, 'Detective', 190, TRUE), ('Jennifer Lopez', 1000000, 'Dead singer impersonator', 191, TRUE), ('John Oliver', 10, 'Sarcasm', 192, TRUE), ('Marianne Faithful', 10, 'Hobo on a wall', 193, TRUE), ('Ruth Bader Ginsburg', 80000000, 'Being right', 194, TRUE), ('Mary Stuart', 1000000, 'Queen of Scotland', 195, TRUE), ('Mabel Rayworth', 20000, 'cook', 196, FALSE), ('Mark Hardy', 20000, 'Manager', 200, FALSE), ('Jeremy Renner', 0, 'Hawk eye', 201, True), ('Martin T Parting', 50000, 'cook', 202, FALSE), ('Lazy Larry', 180, 'Machinist', 197, TRUE); 

SELECT * FROM "Employees"

SELECT "FullName", "PhoneExtension" FROM "Employees" WHERE "IsPartTime" = TRUE

INSERT INTO "Employees" ( "FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime" )
VALUES ('Malcolm Gladwell', 450, 'software developer', 197, TRUE);

UPDATE "Employees" SET "Salary" = '500' WHERE "JobPosition" = 'cook';

INSERT INTO "Employees" ( "FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime" )
............................. VALUES ('Lazy larry', 180, 'Machinist', 197, FALSE);

DELETE FROM "Employees" WHERE "FullName" = 'Lazy Larry';

SELECT * FROM "Employees";

DELETE FROM "Employees" WHERE "FullName" = 'Lazy Larry';

SELECT * FROM "Employees";

ALTER TABLE "Employees" ADD COLUMN "ParkingSpot" INT;

_______________________________________________________________________________________
/*-- SQL joins --*/

CREATE TABLE "Departments" (
  "Id" SERIAL PRIMARY KEY,
  "DepartmentName" TEXT,
  "Building" TEXT
);

ALTER TABLE "Employees" ADD COLUMN "DepartmentId" INTEGER NULL REFERENCES "Departments" ("Id");

CREATE TABLE "Products" (
  "Id" SERIAL PRIMARY KEY,
  "Price"  NUMERIC (5,2),
  "Name" TEXT,
  "Description" TEXT,
  "QuantityInStock" INT
  );

CREATE TABLE "Orders" (
  "Id" SERIAL PRIMARY KEY,
  "OrderNumber" TEXT,
  "DatePlaced" TIMESTAMP,
  "Email" TEXT);

  CREATE TABLE "ProductOrders"(
  "Id" SERIAL PRIMARY KEY,
  "OrderQuantity" INT
  );

INSERT INTO "Departments" ("Departments", "Building")
VALUES ('Development', 'Main');

INSERT INTO "Departments" ("Departments", "Building")
VALUES ('Marketing', 'North');

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime", "DepartmentId")
VALUES ('Tim Smith', 40000, 'Programmer', 123, FALSE, 1);

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime", "DepartmentId")
VALUES ('Barbara Ramsey', '80000', 'Manager', 234, FALSE, 1);

INSERT INTO "Employees" ("FullName", "Salary", "JobPosition", "PhoneExtension", "IsPartTime", "DepartmentId")
VALUES ('Tom Jones', 32000, 'Admin', 456, TRUE, 2);

INSERT INTO "Orders" ("OrderNumber", "DatePlaced", "Email")
VALUES ('X529', '2020-01-01 16:55', 'person@example.com');

Create table "ProductOrders" (
"Id" SERIAL PRIMARY KEY,
"OrderId" INTEGER REFERENCES "Orders" ("Id"),
"ProductId" INTEGER REFERENCES "Products" ("Id"),
"OrderQuantity" INT
  );

/*- Add an order quantity of 'x' for the product named "y" to the order X529 -*/
INSERT INTO "ProductOrders" ("OrderId", "ProductId", "OrderQuantity")
VALUES (1, 1, 3);

INSERT INTO "ProductOrders" ("OrderId", "ProductId", "OrderQuantity")
VALUES (1, 2, 2);

/*-- Given a building, return all employees that work in that building. --*/
SELECT "FullName" 
FROM "Employees"
JOIN "Departments" ON "Employees"."DepartmentId" = "Departments"."Id"
WHERE "Departments"."Building" = 'Main';

-- result "Tim Smith" & "Barbara Ramsey"

/*-- Created Buildings "North Side" & "East Side" and assigned Employees to them 
UPDATE "Employees" SET "DepartmentId" = (3) WHERE "FullName" IN ('Ruth Bader Ginsburg', 'John Oliver', 'Mabel Rayworth', 'Mary Stuart');
UPDATE "Employees" SET "DepartmentId" = (4) WHERE "FullName" IN ('Jeremy Renner', 'Marianne Faithful', 'Jennifer Lopez', 'Martin T Parting'); This was undone-DROP TABLE "Depts" & "Employees": Rebuilt-*/

/*-- Show this query for buildings named North Side, East Side, and finally a building that you actually have in your data --*/
SELECT "FullName" 
FROM "Employees"
JOIN "Departments" ON "Employees"."DepartmentId" = "Departments"."Id"
WHERE "Departments"."Building" = 'North Side'; /*-- <-- this works for 'East Side' result = "Zero effected"--*/

/*-- Find all orders that contain the product id of 2. --*/
SELECT *
FROM "ProductOrders"
WHERE "ProductId" = '2';

/* -- Returns "OrderNumber" where "ProductId" = '2' --*/
SELECT  "Orders"."OrderNumber", "Products"."Name"
FROM "Products"
JOIN "ProductOrders" on "ProductOrders"."ProductId" = "Products"."Id"
JOIN "Orders" ON "Orders"."Id" = "ProductOrders"."OrderId"
WHERE "ProductId" = '2';

/*-- Find the quantity of the Flowbee product from order with order number X529. You may not write the value of an Id in your query, let SQL do the work (HINT: JOIN) --*/

SELECT  "Orders"."OrderNumber", "Products"."Name", "ProductOrders"."OrderQuantity"
FROM "Products"
JOIN "ProductOrders" on "ProductOrders"."ProductId" = "Products"."Id"
JOIN "Orders" ON "Orders"."Id" = "ProductOrders"."OrderId"
WHERE "ProductId" = '2'; /*-- <-- is wrong, but works! --*/

SELECT  "Orders"."OrderNumber", "Products"."Name", "ProductOrders"."OrderQuantity"
FROM "Products"
JOIN "ProductOrders" on "ProductOrders"."ProductId" = "Products"."Id"
JOIN "Orders" ON "Orders"."Id" = "ProductOrders"."OrderId"
WHERE "Name" = 'Flowbee'; /*-- as requested in the task --*/