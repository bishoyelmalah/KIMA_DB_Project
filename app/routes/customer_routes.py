from flask import Blueprint, render_template, redirect
import repositories.Customers as Customers

# 1. Create the Blueprint object
# 'customers' is the internal name, __name__ helps locate resources
customer_bp = Blueprint('customer', __name__)

# 2. Define routes using the Blueprint object instead of 'app'
@customer_bp.route('/customers')
def list_customers():
    data = Customers.get()
    return render_template("CustomerPtTwo.html", customers=data)

@customer_bp.route('/add_customer', methods=["POST"])
def add_customer():
    # firstname = request.form.get("firstName")
    # Customers.add(firstname, ...)
    return redirect(list_customers())