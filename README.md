# Flask + SQLAlchemy Database Project

This project demonstrates how to use Flask with SQLAlchemy to interact with a Microsoft SQL Server database. The application follows a modular architecture with separate files for configuration, database extensions, and models.

## 🏗️ Project Structure

```
BackEnd/
├── app.py              # Main Flask application
├── config.py           # Database configuration
├── extensions.py       # SQLAlchemy database instance
├── models.py           # Database models (ORM)
└── README.md           # Project documentation
```

## 🔧 Technology Stack

- **Flask**: Lightweight web framework for Python
- **SQLAlchemy**: SQL toolkit and Object-Relational Mapping (ORM) library
- **Flask-SQLAlchemy**: Flask extension that adds SQLAlchemy support
- **pyodbc**: Python ODBC bridge for connecting to SQL Server

## 📦 Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd BackEnd
   ```

2. **Create a virtual environment** (recommended)
   ```bash
   python -m venv venv
   venv\Scripts\activate  # On Windows
   ```

3. **Install dependencies**
   ```bash
   pip install flask flask-sqlalchemy pyodbc
   ```

## ⚙️ Configuration

### Database Connection (`config.py`)

The configuration file contains the database connection settings:

```python
class Config:
    SERVER = 'DESKTOP-G42CK9A'        # SQL Server instance name
    DATABASE = 'Test'                  # Database name
    
    # Connection string for SQL Server with Windows Authentication
    SQLALCHEMY_DATABASE_URI = (
        f"mssql+pyodbc://@{SERVER}/{DATABASE}?driver=SQL+Server&Trusted_Connection=yes"
    )
    
    SQLALCHEMY_TRACK_MODIFICATIONS = False
```

**Key Configuration Options:**
- `SERVER`: Your SQL Server instance name
- `DATABASE`: The database you want to connect to
- `SQLALCHEMY_DATABASE_URI`: Connection string using Windows Authentication
- `SQLALCHEMY_TRACK_MODIFICATIONS`: Disabled to save resources

### Extension Pattern (`extensions.py`)

The database instance is created in a separate file to avoid circular imports:

```python
from flask_sqlalchemy import SQLAlchemy
db = SQLAlchemy()
```

This pattern allows us to:
- Import `db` in multiple files without circular dependencies
- Initialize the database later using `db.init_app(app)`
- Keep the application modular and maintainable

## 📊 Database Models

### Customer Model (`models.py`)

The `Customer` model represents the `Customers` table in the database:

```python
from extensions import db

class Customer(db.Model):
    __tablename__ = 'Customers'

    CustomerID = db.Column(db.Integer, primary_key=True)
    FirstName = db.Column(db.String(100))
    LastName = db.Column(db.String(100))
    Email = db.Column(db.String(100))
    City = db.Column(db.String(100))
    Country = db.Column(db.String(100))

    def __repr__(self):
        return f'<Customer {self.FirstName}>'
```

**Model Components:**
- `__tablename__`: Maps the model to the `Customers` database table
- `db.Column()`: Defines table columns with their data types
- `primary_key=True`: Marks CustomerID as the primary key
- `__repr__()`: Provides a readable string representation

## 🚀 Application Setup (`app.py`)

The main application file initializes Flask and SQLAlchemy:

```python
from flask import Flask, render_template
from config import Config
from models import Customer
from extensions import db

app = Flask(__name__)
app.config.from_object(Config)
db.init_app(app)

@app.route('/')
def home():
    customers = Customer.query.all()
    return render_template("/Html_Files/test.html", customers=customers)

if __name__ == "__main__":
    app.run(debug=True)
```

**Initialization Steps:**
1. Create Flask application instance
2. Load configuration from `Config` class
3. Initialize SQLAlchemy with the Flask app using `db.init_app(app)`
4. Define routes that query the database

## 🔍 How SQLAlchemy Works in This Project

### 1. **Application Factory Pattern**
The database instance (`db`) is created separately from the Flask app, then connected using `db.init_app(app)`. This allows for:
- Better testing capabilities
- Multiple application instances
- Delayed configuration

### 2. **ORM (Object-Relational Mapping)**
SQLAlchemy maps Python classes to database tables:
- Python Class (`Customer`) → Database Table (`Customers`)
- Class Attributes → Table Columns
- Class Instances → Table Rows

### 3. **Querying the Database**
SQLAlchemy provides a powerful query interface:

```python
# Get all customers
customers = Customer.query.all()

# Get a customer by ID
customer = Customer.query.get(1)

# Filter customers
customers = Customer.query.filter_by(Country='USA').all()

# Get first result
customer = Customer.query.filter_by(Email='user@example.com').first()
```

### 4. **Database Operations**

**Create:**
```python
new_customer = Customer(
    FirstName='John',
    LastName='Doe',
    Email='john@example.com',
    City='New York',
    Country='USA'
)
db.session.add(new_customer)
db.session.commit()
```

**Update:**
```python
customer = Customer.query.get(1)
customer.Email = 'newemail@example.com'
db.session.commit()
```

**Delete:**
```python
customer = Customer.query.get(1)
db.session.delete(customer)
db.session.commit()
```

## 🎯 Running the Application

1. **Ensure SQL Server is running** and accessible
2. **Activate your virtual environment** (if using one)
3. **Run the Flask application:**
   ```bash
   python app.py
   ```
4. **Access the application** at `http://127.0.0.1:5000/`

## 🔐 Database Connection

This project uses **Windows Authentication** to connect to SQL Server. The connection string:

```
mssql+pyodbc://@SERVER/DATABASE?driver=SQL+Server&Trusted_Connection=yes
```

- `mssql+pyodbc`: SQLAlchemy dialect for SQL Server via pyodbc
- `@SERVER`: Your SQL Server instance
- `/DATABASE`: Database name
- `Trusted_Connection=yes`: Uses Windows Authentication

## 📝 Best Practices Implemented

1. ✅ **Separation of Concerns**: Configuration, models, and application logic are in separate files
2. ✅ **Extension Pattern**: Database instance created separately to avoid circular imports
3. ✅ **Configuration Class**: Centralized configuration management
4. ✅ **ORM Usage**: Database interactions through Python objects, not raw SQL
5. ✅ **Type Hints**: Clear column types defined in models

## 🛠️ Future Enhancements

- [ ] Add environment variables for sensitive configuration
- [ ] Implement database migrations with Flask-Migrate
- [ ] Add more models and relationships (foreign keys)
- [ ] Create RESTful API endpoints
- [ ] Add error handling and logging
- [ ] Implement user authentication

## 📚 Additional Resources

- [Flask Documentation](https://flask.palletsprojects.com/)
- [SQLAlchemy Documentation](https://docs.sqlalchemy.org/)
- [Flask-SQLAlchemy Documentation](https://flask-sqlalchemy.palletsprojects.com/)

## 🤝 Contributing

Feel free to submit issues and enhancement requests!
