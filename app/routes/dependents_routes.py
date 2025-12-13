from flask import Blueprint, render_template, redirect, request
import repositories.Dependents as Dependents

# 1. Create the Blueprint object
# 'dependents' is the internal name, __name__ helps locate resources
dependent_bp = Blueprint('dependent', __name__)

# 2. Define routes using the Blueprint object instead of 'app'
@dependent_bp.route('/dependents')
def list_customers():
    data = Dependents.get()
    return render_template("Dependents.html", dependents=data)

@dependent_bp.route('/add_dependent', methods=["POST"])
def add_dependent():
    # firstname = request.form.get("firstName")
    # Dependents.add(firstname, ...)
    return redirect(list_dependents())