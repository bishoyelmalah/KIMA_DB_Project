CREATE DATABASE KIMA_DB
GO
USE KIMA_DB
GO

------- Bavly --------
create table Salaries (
    S_Job_Position varchar(255) not null,
    S_Job_Degree varchar(255) not null,
    S_Amount decimal(10, 2) not null,
    primary key (S_Job_Position, S_Job_Degree)
)

------- Gergis --------
CREATE TABLE Machines (
    M_ID int primary key identity(1, 1),
    M_Name varchar(255) NOT NULL,
    M_Type varchar(100),
    M_Status varchar(50),
    M_Serial_Num varchar(100) unique,
    M_Model_Num varchar(100),
    M_LMD date
)

------- Sara --------
create table Suppliers(
    Sup_ID int primary key identity(1, 1),
    Sup_Name varchar(255) not null,
    Sup_phone varchar(15),
    Sup_CED Date,
    Sup_CSD Date,
    Sup_Email varchar(100),
    Sup_Bank_Acc varchar(100),
    Sup_Address varchar(255)
)

------- Basmala --------
create table Stocks(
    St_ID int primary key identity(1, 1),
    St_Name varchar(50) not null,
    St_capacity decimal(10,2)
)

create table Customers(
    C_ID int primary key identity(1, 1),
    C_Phone varchar(15),
    C_Name varchar(50) not null,
    C_Address varchar(50),
    C_Email varchar(50) not null,
    C_Type varchar(20),
    C_Reg_Date date
)

------- Bishoy --------
create table Employees (
    E_ID int primary key identity(1, 1),
    Fname varchar(50),
    Mname varchar(50),
    Lname varchar(50),
    E_SSN varchar(50) unique,
    E_Email varchar(50),
    E_Job_Position varchar(255),
    E_Job_Degree varchar(255),
    E_Marital_Status varchar(50),
    E_Military_Status varchar(50),
    E_BD Date,
    E_Gender varchar(10),
    E_Shift varchar(10),
    E_Governate varchar(50),
    E_City varchar(50),
    E_Street varchar(50),
    E_Scientific_Degree varchar(100),
    Dep_ID int, 
    foreign key (E_Job_Position, E_Job_Degree) references Salaries (S_Job_Position, S_Job_Degree) ON DELETE CASCADE
)

------- Bavly --------
create table Departments (
    Dep_ID int primary key identity (1,1),
    Dep_Name varchar(255) not null,
    Dep_Phone_Center varchar(15),
    Dep_Creation_date date,
    Manager_ID int foreign key references Employees(E_ID) ON DELETE SET NULL
)

-- Add the missing FK for Employees
ALTER TABLE Employees 
ADD foreign key (Dep_ID) references Departments (Dep_ID)

create table Maintenances (
    Ma_ID int primary key identity (1,1),
    Ma_Type varchar(255),
    Ma_Start_Time datetime,
    Ma_End_Time datetime,
    Ma_Next_Schedule_Date date,
    M_ID int not null foreign key references Machines(M_ID) ON DELETE CASCADE,
    E_ID int not null foreign key references Employees(E_ID) ON DELETE CASCADE
)

------- Gergis --------
CREATE TABLE Trainees (
    T_ID int primary key identity(1, 1),
    T_Name varchar(255) NOT NULL,
    T_Email varchar(255) unique,
    T_SSN varchar(50) unique,
    T_End_Date date,
    T_Education_Level varchar(100),
    T_Gender varchar(10),
    T_Start_Date date,
    T_Course_ID int, -- What is it??
    T_Address varchar(255),
    T_BD date, 
    T_Phone varchar(15),
    Dep_ID int,
    foreign key (Dep_ID) references Departments(Dep_ID) ON DELETE CASCADE
)

CREATE TABLE Train_on (
    T_ID int,
    M_ID int,
    primary key (T_ID, M_ID),
    foreign key (T_ID) references Trainees(T_ID) ON DELETE CASCADE,
    foreign key (M_ID) references Machines(M_ID) ON DELETE CASCADE
)

------- Sara --------
create table Costs(
    Co_ID int primary key identity(1, 1),
    Co_Date Date not null,
    Co_Category varchar(100),
    Co_Amount decimal(10,2) not null,
    Co_Payment_Method varchar(100),
    Dep_ID int,
    Sup_ID int,
    foreign key(Dep_ID) references Departments(Dep_ID) ON DELETE CASCADE,
    foreign key(Sup_ID) references Suppliers(Sup_ID) ON DELETE CASCADE
)

------- Marina -------- 
Create table Products(
    P_ID int primary key identity(1, 1) ,
    P_Name varchar(100) not null, 
    P_Description varchar(255),
    P_Expiry_Duration int, -- in years
    P_Unit_Price Decimal (10,2),
    P_Cost_Price Decimal (10,2),
    P_Amount int ,
    P_Can_buy bit , -- boolean
    St_ID int, 
    Foreign key (St_ID) REFERENCES Stocks(St_ID) ON DELETE CASCADE
)

Create table Need_to_buy(
    Co_ID int,
    P_ID int,
    primary key (Co_ID ,P_ID),
    Foreign key (Co_ID) References Costs(Co_ID) ON DELETE CASCADE,
    Foreign key (P_ID) References Products(P_ID) ON DELETE CASCADE,
)

Create table Consumes_From(
    Ma_ID int,
    P_ID int,
    primary key (Ma_ID ,P_ID),
    Foreign key (Ma_ID) References Maintenances(Ma_ID) ON DELETE CASCADE,
    Foreign key (P_ID) References Products(P_ID) ON DELETE CASCADE
)

------- Basmala --------
create table Purchased_By(
    P_ID int,
    C_ID int,
    primary key (P_ID,C_ID),
    foreign key (C_ID) references Customers (C_ID) ON DELETE CASCADE,
    foreign key (P_ID) references Products (P_ID) ON DELETE CASCADE
) 

------- AlZahraa --------
create table Customer_feedbacks(
    CF_ID int primary key identity(1, 1),
    CF_Responed_Dates date not null,
    CF_Rating varchar(100),
    CF_Notes varchar(300),
    C_ID int foreign key references Customers (C_ID) ON DELETE CASCADE
)

create table Invoices (
    I_ID int primary key identity(1, 1),
    I_Amount int not null,
    I_Customer varchar(100) not null,
    I_Currency varchar (100) not null,
    I_Status varchar (100),
    I_Method varchar (100) not null,
    I_Date date not null,
    I_Recorded_By varchar(200),

    CF_ID int foreign key references Customer_feedbacks (CF_ID) ON DELETE SET NULL,
    C_ID int foreign key references Customers (C_ID) ,
    Co_ID int foreign key references Costs (Co_ID) ON DELETE SET NULL
)

------- Sara --------
create table Transportations(
    Tr_ID int primary key identity(1, 1),
    Tr_status varchar(50) not null,
    Tr_arrival_date Date,
    Tr_departure_date Date,
    Tr_shipping_Address varchar(100),
    Co_ID int, 
    I_ID int,
    foreign key(Co_ID) references Costs(Co_ID) ON DELETE CASCADE,
    foreign key(I_ID) references Invoices(I_ID) ON DELETE CASCADE
)

------- AlZahraa --------
create table is_recorded_in ( 
    P_ID int ,
    I_ID int ,
    primary key (P_ID,I_ID),
    foreign key (P_ID) references Products (P_ID) ON DELETE CASCADE,
    foreign key (I_ID) references Invoices (I_ID) ON DELETE CASCADE
)

------- Bishoy --------
create table Emp_Phone (
    E_ID int,
    E_Phone varchar(15),
    primary key (E_ID, E_Phone),
    foreign key (E_ID) references Employees (E_ID) ON DELETE CASCADE
)

create table Dependants (
    D_ID int primary key identity(1, 1),
    D_SSN varchar(20), 
    D_Name varchar(100),
    D_Gender varchar(10),
    D_Relation_Type varchar(100),
    D_BD Date,
    D_Marital_status varchar(50),
    D_Email varchar(50),
    D_Phone varchar(15),
    E_ID int not null foreign key references Employees (E_ID) ON DELETE CASCADE,
)