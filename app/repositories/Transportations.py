import sys
import os
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

import db
# from extensions import db
from sqlalchemy import text

def get(columns="*", conditions=None, order_by=None):
    with db.engine.connect() as conn:
        query = f"SELECT {columns} FROM Transportations"
        if conditions:
            query += f" WHERE {conditions}"
        if order_by:
            query += f" ORDER BY {order_by}"
        sql = text(query)
        result = conn.execute(sql)
        return [row._asdict() for row in result]

def add(Status, Arrivaldate, Departuredate, Shippingaddress, Co_ID, I_ID):
    with db.engine.connect() as conn:
        sql = text(
            f"INSERT INTO Transportations VALUES ('{Status}', '{Arrivaldate}', '{Departuredate}', '{Shippingaddress}', '{Co_ID}', '{I_ID}')"
            )
        conn.execute(sql)
        conn.commit()

def edit(condition, Status, Arrivaldate, Departuredate, Shippingaddress, Co_ID, I_ID):
    with db.engine.connect() as conn:
        sql = text(
            f"UPDATE Transportations SET Tr_status = '{Status}', Tr_arrival_date = '{Arrivaldate}', Tr_departure_date = '{Departuredate}', Tr_shipping_Address = '{Shippingaddress}', Co_ID = '{Co_ID}', I_ID = '{I_ID}' WHERE {condition}")
        conn.execute(sql) 
        conn.commit()

def delete(condition):
    with db.engine.connect() as conn:
        sql = text(
            f"DELETE FROM Transportations WHERE {condition}")
        conn.execute(sql)
        conn.commit()
