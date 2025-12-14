from flask import Flask, render_template, request, redirect, url_for
from db_config import *
from extensions import db

# Import blueprints
from routes.customer_routes import customer_bp
from routes.product_routes import product_bp
from routes.Suppliers_routes import suppliers_bp
from routes.employee_routes import employee_bp
from routes.transportation_routes import transportation_bp
from routes.invoice_routes import invoice_bp
from routes.dependents_routes import dependent_bp
from routes.auth_routes import auth_bp

def create_app():
    app = Flask(__name__)
    app.config.from_object(Config)
    app.secret_key = 'your-secret-key-here-change-this'  # Required for sessions
    db.init_app(app)
    
    # Register blueprints
    app.register_blueprint(auth_bp)
    app.register_blueprint(customer_bp)
    app.register_blueprint(product_bp)
    app.register_blueprint(suppliers_bp)
    app.register_blueprint(employee_bp)
    app.register_blueprint(transportation_bp)
    app.register_blueprint(invoice_bp)
    app.register_blueprint(dependent_bp)

    return app


if __name__ == "__main__":
    app = create_app()
    app.run(host='0.0.0.0', port=5000, debug=True)