USE KIMA_DB
GO

------- Insert into Salaries --------
INSERT INTO Salaries (S_Job_Position, S_Job_Degree, S_Amount) VALUES
('Engineer', 'Junior', 5000.00),
('Engineer', 'Senior', 8000.00),
('Manager', 'Junior', 7000.00),
('Manager', 'Senior', 12000.00),
('Technician', 'Junior', 3500.00),
('Technician', 'Senior', 5500.00),
('Operator', 'Junior', 3000.00),
('Operator', 'Senior', 4500.00),
('Supervisor', 'Junior', 6000.00),
('Supervisor', 'Senior', 9000.00)

------- Insert into Machines --------
INSERT INTO Machines (M_Name, M_Type, M_Status, M_Serial_Num, M_Model_Num, M_LMD) VALUES
('Machine A1', 'Production', 'Active', 'SN001', 'MOD-2020', '2024-01-15'),
('Machine B2', 'Assembly', 'Active', 'SN002', 'MOD-2021', '2024-02-20'),
('Machine C3', 'Packaging', 'Maintenance', 'SN003', 'MOD-2019', '2024-03-10'),
('Machine D4', 'Quality Control', 'Active', 'SN004', 'MOD-2022', '2024-04-05'),
('Machine E5', 'Production', 'Inactive', 'SN005', 'MOD-2018', '2024-05-12'),
('Machine F6', 'Assembly', 'Active', 'SN006', 'MOD-2023', '2024-06-18'),
('Machine G7', 'Packaging', 'Active', 'SN007', 'MOD-2020', '2024-07-22'),
('Machine H8', 'Production', 'Maintenance', 'SN008', 'MOD-2021', '2024-08-14'),
('Machine I9', 'Quality Control', 'Active', 'SN009', 'MOD-2022', '2024-09-08'),
('Machine J10', 'Assembly', 'Active', 'SN010', 'MOD-2023', '2024-10-30')

------- Insert into Suppliers --------
INSERT INTO Suppliers (Sup_Name, Sup_phone, Sup_CED, Sup_CSD, Sup_Email, Sup_Bank_Acc, Sup_Address) VALUES
('ABC Supplies Co.', '0123456789', '2025-12-31', '2020-01-15', 'contact@abcsupplies.com', '1234567890123', '123 Supply St, Cairo'),
('XYZ Materials Ltd.', '0123456790', '2026-06-30', '2019-05-20', 'info@xyzmaterials.com', '2234567890124', '456 Material Ave, Giza'),
('Global Chemicals Inc.', '0123456791', '2025-09-15', '2021-03-10', 'sales@globalchem.com', '3234567890125', '789 Chemical Rd, Alexandria'),
('Prime Components', '0123456792', '2027-01-20', '2018-11-05', 'contact@primecomp.com', '4234567890126', '321 Component Blvd, Mansoura'),
('Tech Parts Hub', '0123456793', '2026-03-25', '2020-07-12', 'support@techparts.com', '5234567890127', '654 Tech Lane, Aswan'),
('Industrial Solutions', '0123456794', '2025-11-10', '2019-09-18', 'info@indsolutions.com', '6234567890128', '987 Industry St, Luxor'),
('Quality Raw Materials', '0123456795', '2026-08-05', '2021-02-22', 'sales@qualityraw.com', '7234567890129', '147 Raw Materials Rd, Tanta'),
('Eco Supplies', '0123456796', '2027-04-18', '2020-06-14', 'contact@ecosupplies.com', '8234567890130', '258 Eco Ave, Ismailia'),
('Premium Goods Ltd.', '0123456797', '2025-12-01', '2018-08-08', 'info@premiumgoods.com', '9234567890131', '369 Premium Blvd, Suez'),
('Fast Logistics Co.', '0123456798', '2026-10-22', '2019-12-30', 'logistics@fastlog.com', '1034567890132', '741 Logistics Way, Port Said')

------- Insert into Stocks --------
INSERT INTO Stocks (St_Name, St_capacity) VALUES
('Warehouse A', 10000.00),
('Warehouse B', 15000.00),
('Warehouse C', 8000.00),
('Warehouse D', 12000.00),
('Storage Unit 1', 5000.00),
('Storage Unit 2', 7500.00),
('Cold Storage', 4000.00),
('Main Depot', 20000.00),
('Secondary Depot', 9000.00),
('Emergency Stock', 3000.00)

------- Insert into Customers --------
INSERT INTO Customers (C_Phone, C_Name, C_Address, C_Email, C_Type, C_Reg_Date) VALUES
('0101234567', 'Ahmed Hassan', 'Cairo, Egypt', 'ahmed.hassan@email.com', 'Retail', '2023-01-15'),
('0101234568', 'Fatma Ali', 'Giza, Egypt', 'fatma.ali@email.com', 'Wholesale', '2023-02-20'),
('0101234569', 'Mohamed Ibrahim', 'Alexandria, Egypt', 'mohamed.ibrahim@email.com', 'Retail', '2023-03-10'),
('0101234570', 'Sara Mahmoud', 'Mansoura, Egypt', 'sara.mahmoud@email.com', 'Corporate', '2023-04-05'),
('0101234571', 'Omar Khaled', 'Aswan, Egypt', 'omar.khaled@email.com', 'Retail', '2023-05-12'),
('0101234572', 'Nour Ahmed', 'Luxor, Egypt', 'nour.ahmed@email.com', 'Wholesale', '2023-06-18'),
('0101234573', 'Hana Youssef', 'Tanta, Egypt', 'hana.youssef@email.com', 'Retail', '2023-07-22'),
('0101234574', 'Karim Saeed', 'Ismailia, Egypt', 'karim.saeed@email.com', 'Corporate', '2023-08-14'),
('0101234575', 'Laila Mostafa', 'Suez, Egypt', 'laila.mostafa@email.com', 'Retail', '2023-09-08'),
('0101234576', 'Youssef Nabil', 'Port Said, Egypt', 'youssef.nabil@email.com', 'Wholesale', '2023-10-30')

------- Insert into Employees (without Dep_ID initially) --------
INSERT INTO Employees (Fname, Mname, Lname, E_SSN, E_Email, E_Job_Position, E_Job_Degree, E_Marital_Status, E_Military_Status, E_BD, E_Gender, E_Shift, E_Governate, E_City, E_Street, E_Scientific_Degree) VALUES
('Ali', 'Mohamed', 'Hassan', '12345678901234', 'ali.hassan@kima.com', 'Engineer', 'Senior', 'Married', 'Completed', '1985-05-15', 'Male', 'Morning', 'Cairo', 'Nasr City', 'St 10', 'Bachelor'),
('Mona', 'Ahmed', 'Ibrahim', '12345678901235', 'mona.ibrahim@kima.com', 'Manager', 'Senior', 'Single', 'Exempted', '1990-08-22', 'Female', 'Morning', 'Giza', 'Dokki', 'St 20', 'Master'),
('Khaled', 'Saeed', 'Mahmoud', '12345678901236', 'khaled.mahmoud@kima.com', 'Technician', 'Junior', 'Married', 'Completed', '1992-03-10', 'Male', 'Evening', 'Alexandria', 'Smouha', 'St 30', 'Diploma'),
('Salma', 'Youssef', 'Ali', '12345678901237', 'salma.ali@kima.com', 'Engineer', 'Junior', 'Single', 'Exempted', '1995-11-05', 'Female', 'Morning', 'Mansoura', 'Downtown', 'St 40', 'Bachelor'),
('Hassan', 'Nabil', 'Khaled', '12345678901238', 'hassan.khaled@kima.com', 'Operator', 'Senior', 'Married', 'Completed', '1988-07-12', 'Male', 'Night', 'Aswan', 'Center', 'St 50', 'Diploma'),
('Nada', 'Mostafa', 'Saeed', '12345678901239', 'nada.saeed@kima.com', 'Supervisor', 'Junior', 'Single', 'Exempted', '1993-09-18', 'Female', 'Morning', 'Luxor', 'East Bank', 'St 60', 'Bachelor'),
('Tamer', 'Ali', 'Hassan', '12345678901240', 'tamer.hassan@kima.com', 'Technician', 'Senior', 'Married', 'Completed', '1987-02-22', 'Male', 'Evening', 'Tanta', 'Center', 'St 70', 'Diploma'),
('Rana', 'Ibrahim', 'Mohamed', '12345678901241', 'rana.mohamed@kima.com', 'Manager', 'Junior', 'Single', 'Exempted', '1994-06-14', 'Female', 'Morning', 'Ismailia', 'Downtown', 'St 80', 'Master'),
('Adel', 'Khaled', 'Youssef', '12345678901242', 'adel.youssef@kima.com', 'Operator', 'Junior', 'Married', 'Completed', '1991-12-08', 'Male', 'Night', 'Suez', 'Port Area', 'St 90', 'Diploma'),
('Dina', 'Saeed', 'Nabil', '12345678901243', 'dina.nabil@kima.com', 'Supervisor', 'Senior', 'Single', 'Exempted', '1989-10-30', 'Female', 'Morning', 'Port Said', 'Harbor', 'St 100', 'Bachelor')

------- Insert into Departments --------
INSERT INTO Departments (Dep_Name, Dep_Phone_Center, Dep_Creation_date, Manager_ID) VALUES
('Production', '0221234567', '2015-01-15', 1),
('Quality Control', '0221234568', '2016-02-20', 2),
('Maintenance', '0221234569', '2015-03-10', 3),
('Logistics', '0221234570', '2017-04-05', 4),
('Research & Development', '0221234571', '2018-05-12', 5),
('Human Resources', '0221234572', '2015-06-18', 6),
('Finance', '0221234573', '2016-07-22', 7),
('IT', '0221234574', '2019-08-14', 8),
('Safety', '0221234575', '2017-09-08', 9),
('Operations', '0221234576', '2018-10-30', 10)

------- Update Employees with Dep_ID --------
UPDATE Employees SET Dep_ID = 1 WHERE E_ID = 1
UPDATE Employees SET Dep_ID = 2 WHERE E_ID = 2
UPDATE Employees SET Dep_ID = 3 WHERE E_ID = 3
UPDATE Employees SET Dep_ID = 4 WHERE E_ID = 4
UPDATE Employees SET Dep_ID = 5 WHERE E_ID = 5
UPDATE Employees SET Dep_ID = 6 WHERE E_ID = 6
UPDATE Employees SET Dep_ID = 7 WHERE E_ID = 7
UPDATE Employees SET Dep_ID = 8 WHERE E_ID = 8
UPDATE Employees SET Dep_ID = 9 WHERE E_ID = 9
UPDATE Employees SET Dep_ID = 10 WHERE E_ID = 10

------- Insert into Maintenances --------
INSERT INTO Maintenances (Ma_Type, Ma_Start_Time, Ma_End_Time, Ma_Next_Schedule_Date, M_ID, E_ID) VALUES
('Preventive', '2024-01-10 08:00:00', '2024-01-10 12:00:00', '2024-04-10', 1, 3),
('Corrective', '2024-02-15 09:00:00', '2024-02-15 17:00:00', '2024-08-15', 2, 5),
('Preventive', '2024-03-20 08:00:00', '2024-03-20 11:00:00', '2024-06-20', 3, 7),
('Predictive', '2024-04-25 10:00:00', '2024-04-25 14:00:00', '2024-10-25', 4, 3),
('Corrective', '2024-05-30 08:00:00', '2024-05-30 16:00:00', '2024-11-30', 5, 5),
('Preventive', '2024-06-05 09:00:00', '2024-06-05 13:00:00', '2024-09-05', 6, 7),
('Predictive', '2024-07-10 08:00:00', '2024-07-10 12:00:00', '2025-01-10', 7, 3),
('Preventive', '2024-08-15 10:00:00', '2024-08-15 15:00:00', '2024-11-15', 8, 5),
('Corrective', '2024-09-20 09:00:00', '2024-09-20 18:00:00', '2025-03-20', 9, 7),
('Preventive', '2024-10-25 08:00:00', '2024-10-25 11:00:00', '2025-01-25', 10, 3)

------- Insert into Trainees --------
INSERT INTO Trainees (T_Name, T_Email, T_SSN, T_End_Date, T_Education_Level, T_Gender, T_Start_Date, T_Course_ID, T_Address, T_BD, T_Phone, Dep_ID) VALUES
('Amr Tarek', 'amr.tarek@email.com', '99988877766655', '2024-06-30', 'Bachelor', 'Male', '2024-01-01', 101, 'Cairo, Egypt', '2000-01-15', '0111234567', 1),
('Heba Farouk', 'heba.farouk@email.com', '99988877766656', '2024-07-31', 'Bachelor', 'Female', '2024-02-01', 102, 'Giza, Egypt', '2001-02-20', '0111234568', 2),
('Mahmoud Ashraf', 'mahmoud.ashraf@email.com', '99988877766657', '2024-08-31', 'Diploma', 'Male', '2024-03-01', 103, 'Alexandria, Egypt', '1999-03-10', '0111234569', 3),
('Yasmin Sherif', 'yasmin.sherif@email.com', '99988877766658', '2024-09-30', 'Bachelor', 'Female', '2024-04-01', 104, 'Mansoura, Egypt', '2002-04-05', '0111234570', 4),
('Islam Reda', 'islam.reda@email.com', '99988877766659', '2024-10-31', 'Diploma', 'Male', '2024-05-01', 105, 'Aswan, Egypt', '2000-05-12', '0111234571', 5),
('Mariam Waleed', 'mariam.waleed@email.com', '99988877766660', '2024-11-30', 'Bachelor', 'Female', '2024-06-01', 106, 'Luxor, Egypt', '2001-06-18', '0111234572', 6),
('Karim Hossam', 'karim.hossam@email.com', '99988877766661', '2024-12-31', 'Bachelor', 'Male', '2024-07-01', 107, 'Tanta, Egypt', '1999-07-22', '0111234573', 7),
('Nourhan Alaa', 'nourhan.alaa@email.com', '99988877766662', '2025-01-31', 'Diploma', 'Female', '2024-08-01', 108, 'Ismailia, Egypt', '2002-08-14', '0111234574', 8),
('Ziad Hatem', 'ziad.hatem@email.com', '99988877766663', '2025-02-28', 'Bachelor', 'Male', '2024-09-01', 109, 'Suez, Egypt', '2000-09-08', '0111234575', 9),
('Shaimaa Omar', 'shaimaa.omar@email.com', '99988877766664', '2025-03-31', 'Bachelor', 'Female', '2024-10-01', 110, 'Port Said, Egypt', '2001-10-30', '0111234576', 10)

------- Insert into Train_on --------
INSERT INTO Train_on (T_ID, M_ID) VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9)

------- Insert into Costs --------
INSERT INTO Costs (Co_Date, Co_Category, Co_Amount, Co_Payment_Method, Dep_ID, Sup_ID) VALUES
('2024-01-15', 'Raw Materials', 15000.00, 'Bank Transfer', 1, 1),
('2024-02-20', 'Equipment', 25000.00, 'Check', 2, 2),
('2024-03-10', 'Chemicals', 8000.00, 'Cash', 3, 3),
('2024-04-05', 'Components', 12000.00, 'Bank Transfer', 4, 4),
('2024-05-12', 'Spare Parts', 5000.00, 'Check', 5, 5),
('2024-06-18', 'Materials', 18000.00, 'Bank Transfer', 1, 6),
('2024-07-22', 'Supplies', 9000.00, 'Cash', 2, 7),
('2024-08-14', 'Raw Materials', 22000.00, 'Bank Transfer', 3, 8),
('2024-09-08', 'Equipment', 16000.00, 'Check', 4, 9),
('2024-10-30', 'Components', 11000.00, 'Bank Transfer', 5, 10)

------- Insert into Products --------
INSERT INTO Products (P_Name, P_Description, P_Expiry_Duration, p_Unit_Price, P_Cost_Price, P_Amount, P_Can_buy, St_ID) VALUES
('Product A', 'High quality chemical product A', 2, 150.00, 100.00, 500, 1, 1),
('Product B', 'Industrial grade product B', 3, 200.00, 130.00, 300, 1, 2),
('Product C', 'Premium quality product C', 1, 120.00, 80.00, 700, 1, 3),
('Product D', 'Standard product D', 2, 180.00, 120.00, 400, 1, 4),
('Product E', 'Advanced formula product E', 4, 250.00, 170.00, 250, 1, 5),
('Product F', 'Basic product F', 2, 90.00, 60.00, 800, 1, 6),
('Product G', 'Specialized product G', 3, 220.00, 150.00, 350, 1, 7),
('Product H', 'Enhanced product H', 2, 160.00, 110.00, 600, 1, 8),
('Product I', 'Professional grade product I', 5, 300.00, 200.00, 200, 1, 9),
('Product J', 'Economy product J', 1, 100.00, 70.00, 900, 1, 10)

------- Insert into Need_to_buy --------
INSERT INTO Need_to_buy (Co_ID, P_ID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10)

------- Insert into Consumes_From --------
INSERT INTO Consumes_From (Ma_ID, P_ID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10)

------- Insert into Purchased_By --------
INSERT INTO Purchased_By (P_ID, C_ID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10)

------- Insert into Customer_feedbacks --------
INSERT INTO Customer_feedbacks (CF_Responed_Dates, CF_Rating, CF_Notes, C_ID) VALUES
('2024-01-20', 'Excellent', 'Very satisfied with the product quality', 1),
('2024-02-25', 'Good', 'Product met expectations', 2),
('2024-03-15', 'Excellent', 'Fast delivery and great quality', 3),
('2024-04-10', 'Average', 'Product is okay, could be better', 4),
('2024-05-17', 'Good', 'Happy with the purchase', 5),
('2024-06-23', 'Excellent', 'Outstanding service and product', 6),
('2024-07-27', 'Good', 'Satisfied with overall experience', 7),
('2024-08-19', 'Excellent', 'Will definitely order again', 8),
('2024-09-13', 'Good', 'Good value for money', 9),
('2024-11-04', 'Excellent', 'Highly recommend this product', 10)

------- Insert into Invoices --------
INSERT INTO Invoices (I_Amount, I_Customer, I_Currency, I_Status, I_Method, I_Date, I_Recorded_By, CF_ID, C_ID, Co_ID) VALUES
(7500, 'Ahmed Hassan', 'EGP', 'Paid', 'Bank Transfer', '2024-01-18', 'Admin1', 1, 1, 1),
(6000, 'Fatma Ali', 'EGP', 'Paid', 'Cash', '2024-02-23', 'Admin2', 2, 2, 2),
(8400, 'Mohamed Ibrahim', 'EGP', 'Pending', 'Check', '2024-03-13', 'Admin1', 3, 3, 3),
(7200, 'Sara Mahmoud', 'EGP', 'Paid', 'Bank Transfer', '2024-04-08', 'Admin3', 4, 4, 4),
(6250, 'Omar Khaled', 'USD', 'Paid', 'Credit Card', '2024-05-15', 'Admin2', 5, 5, 5),
(5400, 'Nour Ahmed', 'EGP', 'Pending', 'Bank Transfer', '2024-06-21', 'Admin1', 6, 6, 6),
(7700, 'Hana Youssef', 'EGP', 'Paid', 'Cash', '2024-07-25', 'Admin3', 7, 7, 7),
(9600, 'Karim Saeed', 'EGP', 'Paid', 'Bank Transfer', '2024-08-17', 'Admin2', 8, 8, 8),
(9000, 'Laila Mostafa', 'USD', 'Pending', 'Credit Card', '2024-09-11', 'Admin1', 9, 9, 9),
(10000, 'Youssef Nabil', 'EGP', 'Paid', 'Check', '2024-11-02', 'Admin3', 10, 10, 10)

------- Insert into Transportations --------
INSERT INTO Transportations (Tr_status, Tr_arrival_date, Tr_departure_date, Tr_shipping_Address, Co_ID, I_ID) VALUES
('Delivered', '2024-01-20', '2024-01-18', 'Cairo, Egypt', 1, 1),
('In Transit', '2024-02-27', '2024-02-23', 'Giza, Egypt', 2, 2),
('Pending', '2024-03-18', '2024-03-13', 'Alexandria, Egypt', 3, 3),
('Delivered', '2024-04-12', '2024-04-08', 'Mansoura, Egypt', 4, 4),
('Delivered', '2024-05-19', '2024-05-15', 'Aswan, Egypt', 5, 5),
('In Transit', '2024-06-26', '2024-06-21', 'Luxor, Egypt', 6, 6),
('Delivered', '2024-07-29', '2024-07-25', 'Tanta, Egypt', 7, 7),
('Delivered', '2024-08-21', '2024-08-17', 'Ismailia, Egypt', 8, 8),
('Pending', '2024-09-16', '2024-09-11', 'Suez, Egypt', 9, 9),
('Delivered', '2024-11-06', '2024-11-02', 'Port Said, Egypt', 10, 10)

------- Insert into is_recorded_in --------
INSERT INTO is_recorded_in (P_ID, I_ID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10)

------- Insert into Emp_Phone --------
INSERT INTO Emp_Phone (E_ID, E_Phone) VALUES
(1, '0101111111'),
(1, '0201111111'),
(2, '0102222222'),
(3, '0103333333'),
(4, '0104444444'),
(5, '0105555555'),
(6, '0106666666'),
(7, '0107777777'),
(8, '0108888888'),
(9, '0109999999')

------- Insert into Dependants --------
INSERT INTO Dependants (D_SSN, D_Name, D_Gender, D_Relation_Type, D_BD, D_Marital_status, D_Email, D_Phone, E_ID) VALUES
('11111111111111', 'Laila Hassan', 'Female', 'Wife', '1987-03-20', 'Married', 'laila.hassan@email.com', '0121111111', 1),
('22222222222222', 'Omar Hassan', 'Male', 'Son', '2010-06-15', 'Single', NULL, '0122222222', 1),
('33333333333333', 'Nour Mahmoud', 'Female', 'Wife', '1990-09-12', 'Married', 'nour.mahmoud@email.com', '0123333333', 3),
('44444444444444', 'Zainab Mahmoud', 'Female', 'Daughter', '2015-11-08', 'Single', NULL, NULL, 3),
('55555555555555', 'Amira Khaled', 'Female', 'Wife', '1989-04-25', 'Married', 'amira.khaled@email.com', '0125555555', 5),
('66666666666666', 'Youssef Khaled', 'Male', 'Son', '2012-07-18', 'Single', NULL, NULL, 5),
('77777777777777', 'Hoda Hassan', 'Female', 'Wife', '1988-12-05', 'Married', 'hoda.hassan@email.com', '0127777777', 7),
('88888888888888', 'Sara Hassan', 'Female', 'Daughter', '2013-02-14', 'Single', NULL, NULL, 7),
('99999999999999', 'Kareem Youssef', 'Male', 'Son', '2014-08-22', 'Single', NULL, '0129999999', 9),
('10101010101010', 'Maha Youssef', 'Female', 'Wife', '1992-10-10', 'Married', 'maha.youssef@email.com', '0121010101', 9)

GO