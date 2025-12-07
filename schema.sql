-- Core Entities

CREATE TABLE Salaries (
    S_Job_Position VARCHAR(255) NOT NULL,
    S_Job_Degree VARCHAR(255) NOT NULL,
    S_Amount DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (S_Job_Position, S_Job_Degree)
);

CREATE TABLE Departments (
    Dep_ID INTEGER PRIMARY KEY,
    Dep_Name VARCHAR(255) NOT NULL,
    Dep_Phone_Center VARCHAR(50),
    Dep_Creation_date DATE,
    Manager_ID INTEGER -- FK to Employees, added later to avoid circular dependency issues during creation
);

CREATE TABLE Employees (
    E_ID INTEGER PRIMARY KEY,
    Fname VARCHAR(50) NOT NULL,
    Mname VARCHAR(50),
    Lname VARCHAR(50) NOT NULL,
    E_SSN VARCHAR(50) NOT NULL,
    E_Email VARCHAR(100),
    E_Job_Position VARCHAR(255),
    E_Job_Degree VARCHAR(255),
    E_Marital_Status VARCHAR(50),
    E_Military_Status VARCHAR(50),
    E_BD DATE,
    E_Gender VARCHAR(10),
    E_Shift VARCHAR(50),
    Governorate VARCHAR(100),
    City VARCHAR(100),
    Street VARCHAR(255),
    E_Scientific_Degree VARCHAR(255),
    Dep_ID INTEGER,
    FOREIGN KEY (Dep_ID) REFERENCES Departments(Dep_ID),
    FOREIGN KEY (E_Job_Position, E_Job_Degree) REFERENCES Salaries(S_Job_Position, S_Job_Degree)
);

-- Add the circular FK link from Departments to Employees
ALTER TABLE Departments
ADD CONSTRAINT FK_Departments_Manager
FOREIGN KEY (Manager_ID) REFERENCES Employees(E_ID);

CREATE TABLE Dependants (
    D_ID INTEGER PRIMARY KEY,
    D_SSN VARCHAR(50),
    D_Gender VARCHAR(10),
    D_Name VARCHAR(100) NOT NULL,
    D_Relation_Type VARCHAR(50),
    D_BD DATE,
    D_Marital_Status VARCHAR(50),
    D_Email VARCHAR(100),
    D_Phone VARCHAR(50),
    E_ID INTEGER NOT NULL,
    FOREIGN KEY (E_ID) REFERENCES Employees(E_ID)
);

CREATE TABLE Emp_Phone (
    E_ID INTEGER NOT NULL,
    Phone VARCHAR(50) NOT NULL,
    PRIMARY KEY (E_ID, Phone),
    FOREIGN KEY (E_ID) REFERENCES Employees(E_ID)
);

-- Machines & Maintenance

CREATE TABLE Machines (
    M_ID INTEGER PRIMARY KEY,
    M_Name VARCHAR(255) NOT NULL,
    M_Type VARCHAR(100),
    M_Status VARCHAR(50),
    M_Serial_Num VARCHAR(100),
    M_Model_Num VARCHAR(100),
    M_LMD DATE 
);

CREATE TABLE Maintenance (
    Ma_ID INTEGER PRIMARY KEY,
    Ma_Type VARCHAR(100),
    Ma_Start_Time TIMESTAMP,
    Ma_End_Time TIMESTAMP,
    Ma_Next_Schedule_Date DATE,
    M_ID INTEGER NOT NULL,
    E_ID INTEGER,
    FOREIGN KEY (M_ID) REFERENCES Machines(M_ID),
    FOREIGN KEY (E_ID) REFERENCES Employees(E_ID)
);

-- Training

CREATE TABLE Trainees (
    T_ID INTEGER PRIMARY KEY,
    T_Name VARCHAR(100) NOT NULL,
    T_Email VARCHAR(100),
    T_SSN VARCHAR(50),
    T_End_Date DATE,
    T_Start_Date DATE,
    T_Education_Level VARCHAR(100),
    T_Gender VARCHAR(10),
    T_Course_ID INTEGER,
    Address VARCHAR(255),
    T_BD DATE,
    T_Phone VARCHAR(50),
    Dep_ID INTEGER,
    FOREIGN KEY (Dep_ID) REFERENCES Departments(Dep_ID)
);

CREATE TABLE Train_on (
    T_ID INTEGER NOT NULL,
    M_ID INTEGER NOT NULL,
    PRIMARY KEY (T_ID, M_ID),
    FOREIGN KEY (T_ID) REFERENCES Trainees(T_ID),
    FOREIGN KEY (M_ID) REFERENCES Machines(M_ID)
);

-- Products & Inventory

CREATE TABLE Stocks (
    St_ID INTEGER PRIMARY KEY,
    St_Name VARCHAR(255) NOT NULL,
    St_capacity INTEGER
);

CREATE TABLE Products (
    P_ID INTEGER PRIMARY KEY,
    P_Name VARCHAR(255) NOT NULL,
    P_Description TEXT,
    P_Expiry_Duration INTEGER, -- Or INTEGER days? Keeping as VARCHAR to be safe unless specified
    P_Unit_Price DECIMAL(10, 2),
    P_Cost_Price DECIMAL(10, 2),
    P_Amount INTEGER,
    P_Can_buy BIT,
    St_ID INTEGER,
    FOREIGN KEY (St_ID) REFERENCES Stocks(St_ID)
);

CREATE TABLE Consumes_From (
    Ma_ID INTEGER NOT NULL,
    P_ID INTEGER NOT NULL,
    PRIMARY KEY (Ma_ID, P_ID),
    FOREIGN KEY (Ma_ID) REFERENCES Maintenance(Ma_ID),
    FOREIGN KEY (P_ID) REFERENCES Products(P_ID)
);

-- Sales & Customers

CREATE TABLE Customers (
    C_ID INTEGER PRIMARY KEY,
    C_Phone VARCHAR(50),
    C_Name VARCHAR(100) NOT NULL,
    C_Address VARCHAR(255),
    C_Email VARCHAR(100),
    C_Type VARCHAR(50),
    C_Reg_Date DATE
);

CREATE TABLE Purchased_By (
    P_ID INTEGER NOT NULL,
    C_ID INTEGER NOT NULL,
    PRIMARY KEY (P_ID, C_ID),
    FOREIGN KEY (P_ID) REFERENCES Products(P_ID),
    FOREIGN KEY (C_ID) REFERENCES Customers(C_ID)
);

CREATE TABLE Customer_feedbacks (
    CF_ID INTEGER PRIMARY KEY,
    CF_Responed_Date DATE,
    CF_Rating INTEGER,
    CF_Notes TEXT,
    C_ID INTEGER NOT NULL,
    FOREIGN KEY (C_ID) REFERENCES Customers(C_ID)
);

-- Financials & Operations

CREATE TABLE Suppliers (
    Sup_ID INTEGER PRIMARY KEY,
    Sup_Name VARCHAR(255) NOT NULL,
    Sup_phone VARCHAR(50),
    Sup_CSD DATE,
    Sup_CED DATE,
    Sup_Email VARCHAR(100),
    Sup_Bank_Acc VARCHAR(100),
    Sup_address VARCHAR(255)
);

CREATE TABLE Costs (
    Co_ID INTEGER PRIMARY KEY,
    Co_Date DATE,
    Co_Category VARCHAR(100),
    Co_Amount DECIMAL(10, 2),
    Co_Payment_Method VARCHAR(50),
    Dep_ID INTEGER,
    Sup_ID INTEGER,
    FOREIGN KEY (Dep_ID) REFERENCES Departments(Dep_ID),
    FOREIGN KEY (Sup_ID) REFERENCES Suppliers(Sup_ID)
);

CREATE TABLE need_to_buy (
    Co_ID INTEGER NOT NULL,
    P_ID INTEGER NOT NULL,
    PRIMARY KEY (Co_ID, P_ID),
    FOREIGN KEY (Co_ID) REFERENCES Costs(Co_ID),
    FOREIGN KEY (P_ID) REFERENCES Products(P_ID)
);

CREATE TABLE Invoices (
    I_ID INTEGER PRIMARY KEY,
    I_Amount DECIMAL(10, 2),
    -- I_Customer VARCHAR(255), -- Redundant if linked to Customers? Keeping as per schema.
    I_Currency VARCHAR(10),
    Status VARCHAR(50),
    Method VARCHAR(50),
    Date DATE,
    -- I_Recorded_By VARCHAR(100), -- Employee Name or ID?
    E_ID INTEGER,
    CF_ID INTEGER,
    C_ID INTEGER,
    Co_ID INTEGER,
    FOREIGN KEY (CF_ID) REFERENCES Customer_feedbacks(CF_ID),
    FOREIGN KEY (C_ID) REFERENCES Customers(C_ID),
    FOREIGN KEY (Co_ID) REFERENCES Costs(Co_ID),
    FOREIGN KEY (E_ID) REFERENCES Employees(E_ID)
);

CREATE TABLE is_recorded_in (
    P_ID INTEGER NOT NULL,
    I_ID INTEGER NOT NULL,
    PRIMARY KEY (P_ID, I_ID),
    FOREIGN KEY (P_ID) REFERENCES Products(P_ID),
    FOREIGN KEY (I_ID) REFERENCES Invoices(I_ID)
);

CREATE TABLE Transportations (
    Tr_ID INTEGER PRIMARY KEY,
    Tr_status VARCHAR(50),
    Tr_arrival_date DATE,
    Tr_departure_date DATE,
    Tr_Shipping_Address VARCHAR(255),
    Co_ID INTEGER,
    I_ID INTEGER,
    FOREIGN KEY (Co_ID) REFERENCES Costs(Co_ID),
    FOREIGN KEY (I_ID) REFERENCES Invoices(I_ID)
);
