# app/routes/auth_routes.py
from flask import Blueprint, render_template, redirect, request, session, flash

auth_bp = Blueprint('auth', __name__)

# Hardcoded credentials
VALID_CREDENTIALS = {
    'admin@kima.com': 'admin123',
    'manager@kima.com': 'manager123',
    'user@kima.com': 'user123',
    'drTamer@kima.com': 'drTamer123',
    'maivy@kima.com' : 'maivy132',
    'bavly@kima.com' : 'bavly@2005',
    'aya@kima.com' : 'aya123'
}

@auth_bp.route('/')
@auth_bp.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form.get('email')
        password = request.form.get('password')
        
        # Check credentials
        if email in VALID_CREDENTIALS and VALID_CREDENTIALS[email] == password:
            session['user_email'] = email
            session['logged_in'] = True
            return redirect('/dashboard')
        else:
            return render_template('login.html', error='Invalid email or password')
    
    return render_template('login.html')

@auth_bp.route('/logout')
def logout():
    session.clear()
    return redirect('/login')

@auth_bp.route('/dashboard')
def dashboard():
    if not session.get('logged_in'):
        return redirect('/login')
    return render_template('Home_Page.html')  # or your home page