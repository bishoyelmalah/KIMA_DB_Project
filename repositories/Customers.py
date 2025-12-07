from extensions import db
from sqlalchemy import text

def get_all():
    with db.engine.connect() as conn:
        sql = text("SELECT * FROM Customers")
        result = conn.execute(sql)
        return [row._asdict() for row in result]

def add(firstname, lastname, email, city, country):
    with db.engine.connect() as conn:
        sql = text(f"INSERT INTO Customers (FirstName, LastName, Email, City, Country) VALUES ('{firstname}', '{lastname}', '{email}', '{city}', '{country}')")
        conn.execute(sql)
        conn.commit()

def edit():
    pass

def delete():
    pass

def get_where():
    pass