from flask import Blueprint, render_template, redirect, request
import repositories.Employees as Employees

employee_bp = Blueprint('employee', __name__)

@employee_bp.route('/employees')
def list_products():
    data = Employees.get()
    return render_template('Employee_Page.html', employees = data)

@employee_bp.route('/add_employee')
def add_employee():
    return render_template('Employee_Form.html')

@employee_bp.route('/employee_details/<int:id>')
def employee_details(id):
    data = Employees.get(conditions=f"E_ID = {id}")
    return render_template('Employee_Page_Details.html', details = data)