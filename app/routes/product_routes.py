from flask import Blueprint, render_template, redirect, request
import repositories.Products as Products

product_bp = Blueprint('product', __name__)

@product_bp.route('/products')
def list_products():
    data = Products.get()
    return render_template('Products_page.html', products = data)

@product_bp.route('/product_details/<int:id>')
def product_details(id):
    data = Products.get(conditions=f"P_ID = {id}")[0]
    print(data)
    return render_template('Products_Details_Page.html', details = data)

@product_bp.route('/delete_product/<int:id>')
def delete_product(id):
    Products.delete(f"P_ID = {id}")
    return redirect(list_products())