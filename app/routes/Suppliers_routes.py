from flask import Blueprint, render_template, redirect, request
import repositories.Suppliers as Suppliers

suppliers_bp = Blueprint('suppliers', __name__)

@suppliers_bp.route('/suppliers')
def list_suppliers():
    """Display all suppliers"""
    data = Suppliers.get()
    return render_template("Suppliers_Page.html", suppliers=data)

@suppliers_bp.route('/supplier_details/<int:id>')
def supplier_details(id):
    """Display supplier details"""
    try:
        data = Suppliers.get(conditions=f"Sup_ID = {id}")[0]
        return render_template("Suppliers_Details_page.html", details=data)
    except IndexError:
        return "Supplier not found", 404
    except Exception as e:
        print(f"Error: {str(e)}")
        return f"Error: {str(e)}", 500

@suppliers_bp.route('/add_supplier', methods=["GET", "POST"])
def add_supplier():
    """Add new supplier"""
    if request.method == "GET":
        return render_template("Suppliers_Form.html")
    
    if request.method == "POST":
        try:
            supplier_name = request.form.get("supplierName")
            address = request.form.get("address")
            phone = request.form.get("phone")
            email = request.form.get("email")
            bank_account = request.form.get("supplierBankAccount")
            contract_start_date = request.form.get("supplierContractStartDate")
            contract_end_date = request.form.get("supplierContractEndDate")
            
            Suppliers.add(
                supplier_name, 
                phone, 
                contract_end_date, 
                contract_start_date, 
                email, 
                bank_account, 
                address
            )
            
            return redirect('/suppliers')
            
        except Exception as e:
            print(f"Error adding supplier: {str(e)}")
            return render_template("Suppliers_Form.html", error="Failed to add supplier")

@suppliers_bp.route('/edit_supplier/<int:id>', methods=['GET', 'POST'])
def edit_supplier(id):
    """Edit supplier details"""
    if request.method == 'POST':
        try:
            supplier_name = request.form.get("supplierName")
            address = request.form.get("address")
            phone = request.form.get("phone")
            email = request.form.get("email")
            bank_account = request.form.get("supplierBankAccount")
            contract_start_date = request.form.get("supplierContractStartDate")
            contract_end_date = request.form.get("supplierContractEndDate")
            
            Suppliers.edit(
                f"Sup_ID = {id}",
                supplier_name,
                phone,
                contract_end_date,
                contract_start_date,
                email,
                bank_account,
                address
            )
            
            return redirect(f'/supplier_details/{id}')
        except Exception as e:
            print(f"Error updating supplier: {str(e)}")
            return redirect(f'/edit_supplier/{id}')
    
    try:
        data = Suppliers.get(conditions=f"Sup_ID = {id}")[0]
        return render_template("Suppliers_Edit.html", details=data)
    except IndexError:
        return "Supplier not found", 404
    except Exception as e:
        print(f"Error: {str(e)}")
        return f"Error: {str(e)}", 500

@suppliers_bp.route('/delete_supplier/<int:id>')
def delete_supplier(id):
    """Delete supplier"""
    try:
        Suppliers.delete(f"Sup_ID = {id}")
        return redirect('/suppliers')
    except Exception as e:
        print(f"Error deleting supplier: {str(e)}")
        return redirect(f'/supplier_details/{id}')