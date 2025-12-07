from flask import Flask, render_template, request, redirect, url_for
from flask_sqlalchemy import SQLAlchemy
from db_config import *
from extensions import db

def create_app():
    app = Flask(__name__)
    app.config.from_object(Config)
    db.init_app(app)
    
    import repositories.Customers as Customers

    @app.route('/')
    def home():
        return render_template("Home_Page.html")

    @app.route('/employees')
    def employees_page():
        return render_template("Employee_Page.html")

    @app.route('/suppliers')
    def suppliers_page():
        pass

    @app.route('/products')
    def products_page():
        pass

    @app.route('/customers')
    def customers_page():
        customers = Customers.get_all()
        print(customers)
        return render_template("Customer_Page.html", customers = customers)

    @app.route('/add_customer', methods=["POST"])
    def add_customer():
        firstname = request.form.get("firstName")
        lastname = request.form.get("lastName")
        email = request.form.get("email")
        phone = request.form.get("phone")
        company = request.form.get("company")
        address = request.form.get("address")

    @app.route('/test_add')
    def test():
        Customers.add("Ahmed", "Mohammed", "test@test.com", "Aswan", "Egypt")
        print("Customer added successfully")

        return redirect(url_for("customer_page"))
    
    return app


if __name__ == "__main__":
    # This tells the server to listen on all public IPs (0.0.0.0)
    app = create_app()
    app.run(host='0.0.0.0', port=5000, debug=True)