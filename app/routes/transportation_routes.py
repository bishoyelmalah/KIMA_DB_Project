from flask import Blueprint, render_template, redirect, request
import repositories.Transportations as Transportations

# 1. Create the Blueprint object
# 'transportation' is the internal name, __name__ helps locate resources
transportation_bp = Blueprint('transportation', __name__)

# 2. Define routes using the Blueprint object instead of 'app'
@transportation_bp.route('/transportations')
def list_transportations():
    data = Transportations.get()
    return render_template("transportations_page.html", transportations=data)

@transportation_bp.route('/add_transportation', methods=["POST"])
def add_transportation():
    # firstname = request.form.get("firstName")
    # Customers.transportation(firstname, ...)
    return redirect(list_transportations())