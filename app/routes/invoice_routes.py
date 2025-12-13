from flask import Blueprint, render_template, redirect, request
import repositories.Invoices as Invoices

# 1. Create the Blueprint object
# 'invoice' is the internal name, __name__ helps locate resources
invoice_bp = Blueprint('invoice', __name__)

# 2. Define routes using the Blueprint object instead of 'app'
@invoice_bp.route('/invoices')
def list_invoices():
    data = Invoices.get()
    return render_template("Invoices_page.html", invoices=data)

@invoice_bp.route('/add_invoice', methods=["POST"])
def add_invoice():
    # firstname = request.form.get("firstName")
    # Invoices.add(firstname, ...)
    return redirect(list_invoices())