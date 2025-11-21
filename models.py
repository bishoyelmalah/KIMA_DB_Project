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