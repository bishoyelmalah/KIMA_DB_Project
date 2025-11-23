from flask import Flask, render_template, request, redirect, url_for
from flask_sqlalchemy import record_queries as rq
from config import *
from models import *
# from extensions import db

app = Flask(__name__)
app.config.from_object(Config)
db.init_app(app)

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
    customers = Customer.query.all()
    return render_template("Customer_Page.html", customers = customers)

@app.route('/add_customer', methods=["POST"])
def add_customer():
    firstname = request.form.get("firstName")
    lastname = request.form.get("lastName")
    email = request.form.get("email")
    phone = request.form.get("phone")
    company = request.form.get("company")
    address = request.form.get("address")

    new_customer = Customer(
        FirstName = firstname,
        LastName = lastname,
        Email = email,
        City = address,
        Country = "Egypt"
    )

    db.session.add(new_customer)
    db.session.commit()
    db.session.expire_all()

    return redirect(url_for("customers_page"))


# @app.after_request
# def after_request(response):
#     for query_info in rq.get_recorded_queries():
#         print(f"Statement: {query_info.statement}")
#         print(f"Parameters: {query_info.parameters}")
#         print(f"Duration: {query_info.duration} seconds")
#         print(f"Location: {query_info.location}")
#         print("-" * 20)
#     return response

if __name__ == "__main__":
    # This tells the server to listen on all public IPs (0.0.0.0)
    app.run(host='0.0.0.0', port=5000, debug=True)