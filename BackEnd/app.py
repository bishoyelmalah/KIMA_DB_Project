from flask import Flask, render_template
from flask_sqlalchemy import SQLAlchemy
from config import *
from models import *
# from extensions import db

app = Flask(__name__)
app.config.from_object(Config)
db.init_app(app)

@app.route('/')
def home():
    customers = Customer.query.all()
    print(customers)
    return render_template("/Html_Files/test.html", customers = customers)



if __name__ == "__main__":
    app.run(debug=True)