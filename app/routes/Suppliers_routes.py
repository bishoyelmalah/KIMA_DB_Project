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

@suppliers_bp.route('/add_supplier', methods=["GET", "POST"])
def add_supplier():
    if request.method == "GET":
        return render_template("Suppliers_Form.html")
    
    if request.method == "POST":
        try:
            # Get form data
            supplier_name = request.form.get("supplierName")
            address = request.form.get("address")
            phone = request.form.get("phone")
            email = request.form.get("email")
            bank_account = request.form.get("supplierBankAccount")
            contract_start_date = request.form.get("supplierContractStartDate")
            contract_end_date = request.form.get("supplierContractEndDate")
            
            # Add supplier to database
            Suppliers.add(supplier_name, phone,contract_end_date,contract_start_date, email, bank_account,address)
            
            return redirect('/suppliers')
            
        except Exception as e:
            print(f"Error adding supplier: {str(e)}")  # For debugging
            return render_template("Suppliers_Form.html", error="Failed to add supplier")