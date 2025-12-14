from flask import Blueprint, render_template, redirect, request
import repositories.Employees as Employees

employee_bp = Blueprint('employee', __name__)

@employee_bp.route('/employees')
def list_products():
    data = Employees.get()
    return render_template('Employee_Page.html', employees = data)

@employee_bp.route('/add_employee', methods=['GET', 'POST'])
def add_employee():
    if request.method == 'POST':
        # Get data from all three forms
        # Personal Information
        fname = request.form.get('firstName')
        mname = request.form.get('middleName')
        lname = request.form.get('lastName')
        birth_date = request.form.get('birthDate')
        governate = request.form.get('governate')
        city = request.form.get('city')
        street = request.form.get('street')
        gender = request.form.get('gender')
        ssn = request.form.get('ssn')
        marital_status = request.form.get('maritalStatus')
        military_status = request.form.get('militaryStatus')
        
        # Contact Information
        phone = request.form.get('phone')
        email = request.form.get('email')
        
        # Employee Information
        department = request.form.get('department')
        department_id = Employees.custom(f"SELECT Dep_ID FROM Departments WHERE Dep_Name = '{department}'")[0]['Dep_ID']

        position = request.form.get('position')
        job_degree = request.form.get('jobDegree')
        shift = request.form.get('shift')
        scientific_degree = request.form.get('degree')
        
        # Add employee to database
        Employees.add(
            fname, mname, lname, ssn, email, position, job_degree,
            marital_status, military_status, birth_date, gender, shift,
            governate, city, street, scientific_degree, department_id
        )
        
        return redirect('/employees')
    
    departments = Employees.custom("SELECT DISTINCT(Dep_Name) FROM Departments")
    positions = Employees.custom("SELECT DISTINCT(S_Job_Position) FROM Salaries")
    degrees = Employees.custom("SELECT DISTINCT(S_Job_Degree) FROM Salaries")

    return render_template('Employee_Form.html', depts = departments, positions = positions, degrees = degrees)

@employee_bp.route('/employee_details/<int:id>')
def employee_details(id):

    data = Employees.get(conditions=f"E_ID = {id}")[0]

    phone_data = Employees.custom(f"select E_Phone from Emp_Phone where E_ID = {id}")
    phone = ', '.join([p['E_Phone'] for p in phone_data]) if phone_data else 'N/A'

    salary = Employees.custom(f"select S_Amount from Employees inner join Salaries on Salaries.S_Job_Position = Employees.E_Job_Position and Salaries.S_Job_Degree = Employees.E_Job_Degree where E_ID = {id}")[0]['S_Amount']

    return render_template('Employee_Page_Details.html', details = data, phone = phone, salary = salary)

@employee_bp.route('/delete_employee/<int:id>')
def delete_employee(id):
    Employees.delete(condition=f"E_ID = {id}")
    return redirect('/employees')

@employee_bp.route('/edit_employee/<int:id>', methods=['GET', 'POST'])
def edit_employee(id):
    if request.method == 'POST':
        # Get data from form
        fname = request.form.get('firstName')
        mname = request.form.get('middleName')
        lname = request.form.get('lastName')
        birth_date = request.form.get('birthDate')
        governate = request.form.get('governate')
        city = request.form.get('city')
        street = request.form.get('street')
        gender = request.form.get('gender')
        ssn = request.form.get('ssn')
        marital_status = request.form.get('maritalStatus')
        military_status = request.form.get('militaryStatus')
        
        phone = request.form.get('phone')
        email = request.form.get('email')
        
        department = request.form.get('department')
        department_id = Employees.custom(f"SELECT Dep_ID FROM Departments WHERE Dep_Name = '{department}'")[0]['Dep_ID']
        
        position = request.form.get('position')
        job_degree = request.form.get('jobDegree')
        shift = request.form.get('shift')
        scientific_degree = request.form.get('degree')
        
        # Update employee in database
        Employees.edit(
            f"E_ID = {id}",
            fname, mname, lname, ssn, email, position, job_degree,
            marital_status, military_status, birth_date, gender, shift,
            governate, city, street, scientific_degree, department_id
        )
        
        return redirect(f'/employee_details/{id}')
    
    # GET request - fetch employee data and display form
    employee = Employees.get(conditions=f"E_ID = {id}")[0]
    departments = Employees.custom("SELECT DISTINCT(Dep_Name) FROM Departments")
    positions = Employees.custom("SELECT DISTINCT(S_Job_Position) FROM Salaries")
    degrees = Employees.custom("SELECT DISTINCT(S_Job_Degree) FROM Salaries")
    
    # Get department name from ID
    dept_name = Employees.custom(f"SELECT Dep_Name FROM Departments WHERE Dep_ID = {employee['Dep_ID']}")[0]['Dep_Name']
    
    return render_template('Employee_edit.html', 
                        employee=employee, 
                        dept_name=dept_name,
                        depts=departments, 
                        positions=positions, 
                        degrees=degrees)

@employee_bp.route('/dependents')
def dependents():
    return render_template('Dependents.html')