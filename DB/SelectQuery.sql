USE KIMA_DB


select * from Employees

select * from Departments

select * from Salaries

select * from Invoices

select * from Machines

select * from Suppliers

select * from Stocks

select * from Customers

select * from Maintenances

select * from Trainees

select * from Train_on

select * from Costs

select * from Products

select * from Need_to_buy

select * from Consumes_From

select * from Purchased_By

select * from Customer_feedbacks

select * from Transportations

select * from is_recorded_in

select * from Emp_Phone

select * from Dependants

select S_Amount from Employees inner join Salaries on Salaries.S_Job_Position = Employees.E_Job_Position and Salaries.S_Job_Degree = Employees.E_Job_Degree

select E_Phone from Employees inner join Emp_Phone on Emp_Phone.E_ID = Employees.E_ID

select St_Name from Products inner join Stocks on Products.St_ID = Stocks.St_ID
