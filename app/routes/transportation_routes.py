from flask import Blueprint, render_template, redirect, request
import repositories.Transportations as Transportations

transportation_bp = Blueprint('transportation', __name__)

@transportation_bp.route('/transportations')
def list_transportations():
    """Display all transportations"""
    data = Transportations.get()
    return render_template("transportations_page.html", transportations=data)

@transportation_bp.route('/transportation_details/<int:id>')
def transportation_details(id):
    """Display transportation details"""
    try:
        data = Transportations.get(conditions=f"Tr_ID = {id}")[0]
        return render_template("Transportions_Details_Page.html", details=data)
    except IndexError:
        return "Transportation not found", 404
    except Exception as e:
        print(f"Error: {str(e)}")
        return f"Error: {str(e)}", 500

@transportation_bp.route('/add_transportation', methods=["GET", "POST"])
def add_transportation():
    """Add new transportation"""
    if request.method == "GET":
        return render_template("Transportations_Form.html")
    
    if request.method == "POST":
        try:
            status = request.form.get("status")
            arrival_date = request.form.get("arrivalDate")
            departure_date = request.form.get("departureDate")
            shipping_address = request.form.get("shippingAddress")
            cost_id = request.form.get("costId")
            invoice_id = request.form.get("invoiceId")
            
            Transportations.add(
                status,
                arrival_date,
                departure_date,
                shipping_address,
                cost_id,
                invoice_id
            )
            
            return redirect('/transportations')
            
        except Exception as e:
            print(f"Error adding transportation: {str(e)}")
            return render_template("Transportations_Form.html", error="Failed to add transportation")

@transportation_bp.route('/edit_transportation/<int:id>', methods=['GET', 'POST'])
def edit_transportation(id):
    """Edit transportation details"""
    if request.method == 'POST':
        try:
            status = request.form.get("status")
            arrival_date = request.form.get("arrivalDate")
            departure_date = request.form.get("departureDate")
            shipping_address = request.form.get("shippingAddress")
            cost_id = request.form.get("costId")
            invoice_id = request.form.get("invoiceId")
            
            Transportations.edit(
                f"Tr_ID = {id}",
                status,
                arrival_date,
                departure_date,
                shipping_address,
                cost_id,
                invoice_id
            )
            
            return redirect(f'/transportation_details/{id}')
        except Exception as e:
            print(f"Error updating transportation: {str(e)}")
            return redirect(f'/edit_transportation/{id}')
    
    try:
        data = Transportations.get(conditions=f"Tr_ID = {id}")[0]
        return render_template("Transportations_Edit.html", details=data)
    except IndexError:
        return "Transportation not found", 404
    except Exception as e:
        print(f"Error: {str(e)}")
        return f"Error: {str(e)}", 500

@transportation_bp.route('/delete_transportation/<int:id>')
def delete_transportation(id):
    """Delete transportation"""
    try:
        Transportations.delete(f"Tr_ID = {id}")
        return redirect('/transportations')
    except Exception as e:
        print(f"Error deleting transportation: {str(e)}")
        return redirect(f'/transportation_details/{id}')