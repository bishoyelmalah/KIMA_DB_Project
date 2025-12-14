from flask import Blueprint, render_template, redirect, request
import repositories.Invoices as Invoices

invoice_bp = Blueprint('invoice', __name__)

@invoice_bp.route('/invoices')
def list_invoices():
    data = Invoices.get()
    return render_template("Invoices_page.html", invoices=data)

@invoice_bp.route('/invoice_details/<int:id>')
def invoice_details(id):
    """Display invoice details"""
    data = Invoices.get(conditions=f"I_ID = {id}")[0]
    return render_template("Invoices_Details_Page.html", details=data)

@invoice_bp.route('/add_invoice', methods=["GET", "POST"])
def add_invoice():
    if request.method == "GET":
        return render_template("Invoices_Form.html")
    
    if request.method == "POST":
        try:
            amount = request.form.get("amount")
            customer = request.form.get("customerName")
            currency = request.form.get("currency")
            status = request.form.get("Status")
            method = request.form.get("Method")
            date = request.form.get("paymentDate")
            recorded_by = request.form.get("recordedBy")
            cf_id = request.form.get("customerFeedbacksId")
            c_id = request.form.get("customerId")
            co_id = request.form.get("costId")
            
            Invoices.add(amount, customer, currency, status, method, date, recorded_by, cf_id, c_id, co_id)
            
            return redirect('/invoices')
        except Exception as e:
            print(f"Error adding invoice: {str(e)}")
            return render_template("Invoices_Form.html", error=str(e))

@invoice_bp.route('/edit_invoice/<int:id>', methods=['GET', 'POST'])
def edit_invoice(id):
    """Display edit form with invoice details"""
    if request.method == 'POST':
        amount = request.form.get("amount")
        customer = request.form.get("customerName")
        currency = request.form.get("currency")
        status = request.form.get("Status")
        method = request.form.get("Method")
        date = request.form.get("paymentDate")
        recorded_by = request.form.get("recordedBy")
        cost_id = request.form.get("costId")
        cf_id = request.form.get("customerFeedbacksId")
        c_id = request.form.get("customerId")
        
        try:
            Invoices.edit(f"I_ID = {id}", amount, customer, currency, status, method, date, recorded_by, cf_id, c_id, cost_id)
            return redirect(f'/invoice_details/{id}')
        except Exception as e:
            print(f"Error updating invoice: {str(e)}")
            return redirect(f'/edit_invoice/{id}')
    
    try:
        data = Invoices.get(conditions=f"I_ID = {id}")[0]
        
        print(f"\n=== INVOICE DATA FOR EDIT ===")
        print(f"Data type: {type(data)}")
        if isinstance(data, dict):
            print(f"Dictionary keys: {data.keys()}")
            for key, value in data.items():
                print(f"  {key}: {value}")
        else:
            print(f"Object attributes:")
            for attr, value in vars(data).items():
                print(f"  {attr}: {value}")
        print(f"============================\n")
        
        return render_template("Invoices_Edit.html", details=data)
    except IndexError:
        return "Invoice not found", 404
    except Exception as e:
        print(f"Error: {str(e)}")
        import traceback
        traceback.print_exc()
        return f"Error: {str(e)}", 500

@invoice_bp.route('/delete_invoice/<int:id>')
def delete_invoice(id):
    """Delete invoice"""
    try:
        Invoices.delete(f"I_ID = {id}")
        return redirect('/invoices')
    except Exception as e:
        print(f"Error deleting invoice: {str(e)}")
        return redirect(f'/invoice_details/{id}')