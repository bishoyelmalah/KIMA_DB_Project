from flask import Blueprint, render_template, redirect, request
import repositories.Customers as Customers

# 1. Create the Blueprint object
# 'customers' is the internal name, __name__ helps locate resources
customer_bp = Blueprint('customer', __name__)

# 2. Define routes using the Blueprint object instead of 'app'
@customer_bp.route('/customers')
def list_customers():
    data = Customers.get()
    return render_template("CustomerPtTwo.html", customers=data)

@customer_bp.route('/customer_details/<int:id>')
def customer_details(id):
    """Display customer details"""
    data = Customers.get(conditions=f"C_ID = {id}")[0]
    print(data)
    return render_template("Customers_Details_page.html", details=data)



@customer_bp.route('/add_customer', methods=["GET", "POST"])
def add_customer():
    if request.method == "GET":
        return render_template("Customer_Form.html")
    
    if request.method == "POST":
        try:
            # Get form data
            name = request.form.get("name")
            address = request.form.get("address")
            phone = request.form.get("phone")
            email = request.form.get("email")
            customer_type = request.form.get("type")
            registration_date = request.form.get("registrationDate")
            
            # Add customer to database
            Customers.add(phone, name , address , email, customer_type, registration_date)
            

            return redirect('/customers')
            
        except Exception as e:
            return render_template("Customer_Form.html")
        
@customer_bp.route('/edit_customer/<int:id>', methods=['GET', 'POST'])
def edit_customer(id):
    """Display edit form with customer details"""
    if request.method == 'POST':
        # Get form data
        name = request.form.get('name')
        address = request.form.get('address')
        phone = request.form.get('phone')
        email = request.form.get('email')
        customer_type = request.form.get('type')
        registration_date = request.form.get('registrationDate')
        
        try:
            # Update customer in database using edit function
            Customers.edit(f"C_ID = {id}", phone, name, address, email, customer_type, registration_date)
            return redirect(f'/customer_details/{id}')
        except Exception as e:
            print(f"Error updating customer: {str(e)}")
            return redirect(f'/edit_customer/{id}')
    
    # GET request - fetch customer details
    data = Customers.get(conditions=f"C_ID = {id}")[0]
    return render_template('Customer_Edit.html', details=data)

@customer_bp.route('/delete_customer/<int:id>')
def delete_customer(id):
    """Delete customer"""
    try:
        Customers.delete(f"C_ID = {id}")
        return redirect('/customers')
    except Exception as e:
        print(f"Error deleting customer: {str(e)}")
        return redirect(f'/customer_details/{id}')