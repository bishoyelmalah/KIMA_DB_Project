from flask import Blueprint, render_template, redirect, request
import repositories.Suppliers as Suppliers

# 1. Create the Blueprint object
# 'suppliers' is the internal name, __name__ helps locate resources
suppliers_bp = Blueprint('suppliers', __name__)

# 2. Define routes using the Blueprint object instead of 'app'
@suppliers_bp.route('/suppliers')
def list_suppliers():
    data = Suppliers.get()
    return render_template("Suppliers_Page.html", suppliers=data)

@suppliers_bp.route('/add_suppliers', methods=["POST"])
def add_suppliers():
    # firstname = request.form.get("firstName")
    # Suppliers.add(firstname, ...)
    return redirect(list_suppliers())