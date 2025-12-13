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
    return redirect('/products')

@product_bp.route('/add_product', methods=['GET', 'POST'])
def add_product_page():
    if request.method == 'POST':
        # Get form data
        name = request.form.get('productName')
        description = request.form.get('description')
        expiry_duration = request.form.get('expirationDate')
        unit_price = request.form.get('unitPrice')
        cost_price = request.form.get('costPrice')
        amount_stored = request.form.get('amountStored')
        can_be_purchased = request.form.get('canBePurchased')
        stocks_id = request.form.get('stocksId')
        
        # Add product to database
        Products.add(
            name, description, 
            expiry_duration, unit_price, 
            cost_price, amount_stored, 
            can_be_purchased, stocks_id
            )
        
        # Redirect to products list
        return redirect('/products')
    
    return render_template('Products_Form.html')


@product_bp.route('/edit_product/<int:id>', methods=['GET', 'POST'])
def edit_product(id):
    if request.method == 'POST':
        # Get form data
        name = request.form.get('productName')
        description = request.form.get('description')
        expiry_duration = request.form.get('expirationDate')
        unit_price = request.form.get('unitPrice')
        cost_price = request.form.get('costPrice')
        amount_stored = request.form.get('amountStored')
        can_be_purchased = request.form.get('canBePurchased')
        stocks_id = request.form.get('stocksId')
        
        # Update product in database
        Products.edit(
            f"P_ID = {id}", name,
            description, expiry_duration,
            unit_price, cost_price,
            amount_stored, can_be_purchased, stocks_id
            )
        
        # Redirect to product details
        return redirect(f'/product_details/{id}')
    
    # GET request - fetch product details
    data = Products.get(conditions=f"P_ID = {id}")[0]
    return render_template('Products_Edit.html', details=data)
