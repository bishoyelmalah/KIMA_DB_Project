import sys
import os
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

import db
# from extensions import db
from sqlalchemy import text

def get(columns="*", conditions=None, order_by=None):
    with db.engine.connect() as conn:
        query = f"SELECT {columns} FROM Customers"
        if conditions:
            query += f" WHERE {conditions}"
        if order_by:
            query += f" ORDER BY {order_by}"
        sql = text(query)
        result = conn.execute(sql)
        return [row._asdict() for row in result]

def add(firstname, lastname, email, city, country):
    with db.engine.connect() as conn:
        sql = text(
            f"INSERT INTO Customers VALUES ('{firstname}', '{lastname}', '{email}', '{city}', '{country}')"
            )
        conn.execute(sql)
        conn.commit()

def edit(condition, firstname, lastname, email, city, country):
    with db.engine.connect() as conn:
        sql = text(
            f"UPDATE Customers SET FirstName = {firstname}, LastName = {lastname} WHERE {condition}")
        conn.execute(sql)
        conn.commit()

def delete(condition):
    with db.engine.connect() as conn:
        sql = text(
            f"DELETE FROM Customers WHERE {condition}")
        conn.execute(sql)
        conn.commit()

print(get(
    columns="C_ID, C_Name",
    conditions="C_ID > 5"
))