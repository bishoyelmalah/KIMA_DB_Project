from flask import Blueprint, render_template, redirect
import repositories.Products as Products

product_bp = Blueprint('product', __name__)

@product_bp.route('/products')
def list_products():
    data = Products.get()
    return render_template('Products_page.html', products = data)