-- ====================================================================================
-- CUSTOMERS TABLE QUERIES
-- ====================================================================================

-- Get all customers
SELECT * FROM Customers;

-- Get customers with conditions
SELECT * FROM Customers WHERE C_ID = 1;

-- Get customers with ordering
SELECT * FROM Customers ORDER BY C_Name;

-- Insert new customer
INSERT INTO Customers (C_Phone, C_Name, C_Address, C_Email, C_Type, C_Reg_Date)
VALUES ('0123456789', 'John Doe', '123 Main St', 'john@example.com', 'Regular', '2024-12-14');

-- Update customer
UPDATE Customers 
SET C_Phone = '0123456789', 
    C_Name = 'John Doe Updated', 
    C_Address = '456 New St', 
    C_Email = 'john.updated@example.com', 
    C_Type = 'VIP', 
    C_Reg_Date = '2024-12-14'
WHERE C_ID = 1;

-- Delete customer
DELETE FROM Customers WHERE C_ID = 11;

-- ====================================================================================
-- INVOICES TABLE QUERIES
-- ====================================================================================

-- Get all invoices
SELECT * FROM Invoices;

-- Get invoices with conditions
SELECT * FROM Invoices WHERE I_Status = 'Paid';

-- Get invoices with ordering
SELECT * FROM Invoices ORDER BY I_Date DESC;

-- Insert new invoice
INSERT INTO Invoices (I_Amount, I_Customer, I_Currency, I_Status, I_Method, I_Date, I_Recorded_By, CF_ID, C_ID, Co_ID)
VALUES (1000.00, 'John Doe', 'EGP', 'Paid', 'Cash', '2024-12-14', 'Admin1', 1, 1, 1);

-- Update invoice
UPDATE Invoices 
SET I_Amount = 1500.00, 
    I_Customer = 'John Doe', 
    I_Currency = 'USD', 
    I_Status = 'Pending', 
    I_Method = 'Credit Card', 
    I_Date = '2024-12-14', 
    I_Recorded_By = 'Admin2', 
    CF_ID = 2, 
    C_ID = 2, 
    Co_ID = 2
WHERE I_ID = 1;

-- Delete invoice
DELETE FROM Invoices WHERE I_ID = 12;

-- Get paid invoices only
SELECT * FROM Invoices WHERE I_Status = 'Paid';

-- Get invoices by customer
SELECT * FROM Invoices WHERE C_ID = 4;

-- ====================================================================================
-- SUPPLIERS TABLE QUERIES
-- ====================================================================================

-- Get all suppliers
SELECT * FROM Suppliers;

-- Get suppliers with conditions
SELECT * FROM Suppliers WHERE Sup_Name LIKE '%Company%';

-- Get suppliers with ordering
SELECT * FROM Suppliers ORDER BY Sup_Name;

-- Insert new supplier
INSERT INTO Suppliers (Sup_Name, Sup_phone, Sup_CED, Sup_CSD, Sup_Email, Sup_Bank_Acc, Sup_Address)
VALUES ('ABC Suppliers', '0123456789', '2025-12-31', '2020-01-01', 'abc@suppliers.com', '1234567890', '789 Business St');

-- Update supplier
UPDATE Suppliers 
SET Sup_Name = 'ABC Suppliers Updated', 
    Sup_phone = '0198765432', 
    Sup_CED = '2026-12-31', 
    Sup_CSD = '2020-01-01', 
    Sup_Email = 'abc.updated@suppliers.com', 
    Sup_Bank_Acc = '0987654321', 
    Sup_Address = '321 New Business St'
WHERE Sup_ID = 1;

-- Delete supplier
DELETE FROM Suppliers WHERE Sup_ID = 13;

-- Get active suppliers (contract not expired)
SELECT * FROM Suppliers WHERE Sup_CED > CURDATE();

-- Get suppliers by email domain
SELECT * FROM Suppliers WHERE Sup_Email LIKE '%@kima.com';

-- ====================================================================================
-- TRANSPORTATIONS TABLE QUERIES
-- ====================================================================================

-- Get all transportations
SELECT * FROM Transportations;

-- Get transportations with conditions
SELECT * FROM Transportations WHERE Tr_status = 'In Transit';

-- Get transportations with ordering
SELECT * FROM Transportations ORDER BY Tr_departure_date DESC;

-- Insert new transportation
INSERT INTO Transportations (Tr_status, Tr_arrival_date, Tr_departure_date, Tr_shipping_Address, Co_ID, I_ID)
VALUES ('Pending', '2024-12-20', '2024-12-15', '123 Delivery St, Cairo', 1, 1);

-- Update transportation
UPDATE Transportations 
SET Tr_status = 'Delivered', 
    Tr_arrival_date = '2024-12-21', 
    Tr_departure_date = '2024-12-16', 
    Tr_shipping_Address = '456 New Delivery St, Cairo', 
    Co_ID = 2, 
    I_ID = 2
WHERE Tr_ID = 1;

-- Delete transportation
DELETE FROM Transportations WHERE Tr_ID = 5;

-- Get pending transportations
SELECT * FROM Transportations WHERE Tr_status = 'Pending';

-- Get transportations by invoice
SELECT * FROM Transportations WHERE I_ID = 10;

-- Get overdue transportations
SELECT * FROM Transportations 
WHERE Tr_arrival_date < CURDATE() AND Tr_status != 'Delivered';

-- ====================================================================================
-- PRODUCTS TABLE QUERIES
-- ====================================================================================

-- Get all products
SELECT * FROM Products;

-- Get products with conditions
SELECT * FROM Products WHERE P_Can_buy = 1;

-- Get products with ordering
SELECT * FROM Products ORDER BY P_Name;

-- Insert new product
INSERT INTO Products (P_Name, P_Description, P_Expiry_Duration, P_Unit_Price, P_Cost_Price, P_Amount, P_Can_buy, St_ID)
VALUES ('Product A', 'High quality product', 365, 100.00, 75.00, 1000, 1, 1);

-- Update product
UPDATE Products 
SET P_Name = 'Product A Updated', 
    P_Description = 'Premium quality product', 
    P_Expiry_Duration = 730, 
    P_Unit_Price = 120.00, 
    P_Cost_Price = 80.00, 
    P_Amount = 1500, 
    P_Can_buy = 1, 
    St_ID = 2
WHERE P_ID = 1;

-- Delete product
DELETE FROM Products WHERE P_ID = 10;

-- Get available products
SELECT * FROM Products WHERE P_Can_buy = 1 AND P_Amount > 0;

-- Get products by price range
SELECT * FROM Products WHERE P_Unit_Price BETWEEN 50 AND 150;

-- Get low stock products
SELECT * FROM Products WHERE P_Amount < 100;

-- Get products by storage location
SELECT * FROM Products WHERE St_ID = 1;

-- ====================================================================================
-- DEPENDENTS TABLE QUERIES
-- ====================================================================================

-- Get all dependents
SELECT * FROM Dependants;

-- Get dependents with conditions
SELECT * FROM Dependants WHERE E_ID = 1;

-- Get dependents with ordering
SELECT * FROM Dependants ORDER BY D_Name;

-- Insert new dependent
INSERT INTO Dependants (D_SSN, D_Name, D_Gender, D_Relation_Type, D_BD, D_Marital_status, D_Email, D_Phone, E_ID)
VALUES ('12345678901234', 'Jane Doe', 'Female', 'Spouse', '1990-05-15', 'Married', 'jane@example.com', '0123456789', 1);

-- Update dependent
UPDATE Dependants 
SET D_SSN = '12345678901234', 
    D_Name = 'Jane Doe Updated', 
    D_Gender = 'Female', 
    D_Relation_Type = 'Spouse', 
    D_BD = '1990-05-15', 
    D_Marital_status = 'Married', 
    D_Email = 'jane.updated@example.com', 
    D_Phone = '0198765432', 
    E_ID = 1
WHERE D_SSN = '12345678901234';

-- Delete dependent
DELETE FROM Dependants WHERE D_Name = 'ali';

-- Get dependents by employee
SELECT * FROM Dependants WHERE E_ID = 5;

-- Get dependents by relation type
SELECT * FROM Dependants WHERE D_Relation_Type = 'Child';

-- Get married dependents
SELECT * FROM Dependants WHERE D_Marital_status = 'Married';

-- ====================================================================================
-- EMPLOYEES TABLE QUERIES
-- ====================================================================================

-- Get all employees
SELECT * FROM Employees;

-- Get employees with conditions
SELECT * FROM Employees WHERE E_Job_Position = 'Manager';

-- Get employees with ordering
SELECT * FROM Employees ORDER BY Fname, Mname, Lname;

-- Insert new employee
INSERT INTO Employees (Fname, Mname, Lname, E_SSN, E_Email, E_Job_Position, E_Job_Degree, E_Marital_Status, E_Military_Status, E_BD, E_Gender, E_Shift, E_Governate, E_City, E_Street, E_Scientific_Degree, Dep_ID)
VALUES ('Ahmed', 'Mohamed', 'Ali', '12345678901234', 'ahmed@kima.com', 'Engineer', 'Senior', 'Single', 'Completed', '1995-03-20', 'Male', 'Morning', 'Aswan', 'Aswan City', 'Nile Street', 'Bachelor', 1);

-- Update employee
UPDATE Employees 
SET Fname = 'Ahmed', 
    Mname = 'Mohamed', 
    Lname = 'Ali', 
    E_SSN = '12345678901234', 
    E_Email = 'ahmed.updated@kima.com', 
    E_Job_Position = 'Senior Engineer', 
    E_Job_Degree = 'Lead', 
    E_Marital_Status = 'Married', 
    E_Military_Status = 'Completed', 
    E_BD = '1995-03-20', 
    E_Gender = 'Male', 
    E_Shift = 'Evening', 
    E_Governate = 'Aswan', 
    E_City = 'Aswan City', 
    E_Street = 'Corniche Street', 
    E_Scientific_Degree = 'Master', 
    Dep_ID = 2
WHERE E_ID = 1;

-- Delete employee
DELETE FROM Employees WHERE E_ID = 10;

-- Get employees by department
SELECT * FROM Employees WHERE Dep_ID = 1;

-- Get employees by job position
SELECT * FROM Employees WHERE E_Job_Position = 'Manager';

-- Get employees by job degree
SELECT * FROM Employees WHERE E_Job_Degree = 'Senior';

-- Get employees by shift
SELECT * FROM Employees WHERE E_Shift = 'Morning';

-- Get employees by city
SELECT * FROM Employees WHERE E_City = 'Aswan City';

-- Get single employees
SELECT * FROM Employees WHERE E_Marital_Status = 'Single';

-- Get employees with military service completed
SELECT * FROM Employees WHERE E_Military_Status = 'Completed';

-- Custom query: Get department ID by name
SELECT Dep_ID FROM Departments WHERE Dep_Name = 'Quality Control';

-- Get employees with their full names
SELECT E_ID, CONCAT(Fname, ' ', Mname, ' ', Lname) AS Full_Name, E_Job_Position, E_Job_Degree
FROM Employees;

-- Get employee count by department
SELECT Dep_ID, COUNT(*) AS Employee_Count
FROM Employees
GROUP BY Dep_ID;

-- Get employees hired in current year
SELECT * FROM Employees 
WHERE YEAR(E_BD) = YEAR(CURDATE());

-- ====================================================================================
-- COMMON JOIN QUERIES (Examples)
-- ====================================================================================

-- Get invoices with customer details
SELECT I.*, C.C_Name, C.C_Email, C.C_Phone
FROM Invoices I
INNER JOIN Customers C ON I.C_ID = C.C_ID;

-- Get transportations with invoice and customer details
SELECT T.*, I.I_Amount, C.C_Name
FROM Transportations T
INNER JOIN Invoices I ON T.I_ID = I.I_ID
INNER JOIN Customers C ON I.C_ID = C.C_ID;

-- Get employees with their dependents
SELECT E.E_ID, CONCAT(E.Fname, ' ', E.Mname, ' ', E.Lname) AS Employee_Name, 
       D.D_Name AS Dependent_Name, D.D_Relation_Type
FROM Employees E
LEFT JOIN Dependants D ON E.E_ID = D.E_ID;

-- Get products with storage location details
SELECT P.*, S.St_Name, S.St_Location
FROM Products P
INNER JOIN Storage S ON P.St_ID = S.St_ID;

-- Get employees by department name
SELECT E.*, D.Dep_Name
FROM Employees E
INNER JOIN Departments D ON E.Dep_ID = D.Dep_ID
WHERE D.Dep_Name = 'Quality Control';

-- ====================================================================================
-- AGGREGATE AND STATISTICAL QUERIES
-- ====================================================================================

-- Count total customers
SELECT COUNT(*) AS Total_Customers FROM Customers;

-- Count total invoices by status
SELECT I_Status, COUNT(*) AS Count
FROM Invoices
GROUP BY I_Status;

-- Sum of invoice amounts by currency
SELECT I_Currency, SUM(I_Amount) AS Total_Amount
FROM Invoices
GROUP BY I_Currency;

-- Average product price
SELECT AVG(P_Unit_Price) AS Average_Price FROM Products;

-- Count employees by department
SELECT Dep_ID, COUNT(*) AS Employee_Count
FROM Employees
GROUP BY Dep_ID;

-- Count products by availability
SELECT P_Can_buy, COUNT(*) AS Product_Count
FROM Products
GROUP BY P_Can_buy;

-- Get highest paid invoice
SELECT MAX(I_Amount) AS Highest_Amount FROM Invoices;

-- Get lowest product price
SELECT MIN(P_Unit_Price) AS Lowest_Price FROM Products;

-- ====================================================================================
-- END OF SQL QUERIES
-- ====================================================================================