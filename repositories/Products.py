import sys
import os
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

import db
# from extensions import db
from sqlalchemy import text

def get(columns="*", conditions=None, order_by=None):
    with db.engine.connect() as conn:
        query = f"SELECT {columns} FROM Products"
        if conditions:
            query += f" WHERE {conditions}"
        if order_by:
            query += f" ORDER BY {order_by}"
        sql = text(query)
        result = conn.execute(sql)
        return [row._asdict() for row in result]

def add(name, Description, ExpiaryDuration,UnitPrice , CostPrice, amount, canBuy, st_id):
    with db.engine.connect() as conn:
        sql = text(
            f"INSERT INTO Products VALUES ('{name}' ,'{Description}', '{ExpiaryDuration}', '{UnitPrice}', '{CostPrice}', '{amount}' ,'{canBuy}','{st_id}')"
            )
        conn.execute(sql)
        conn.commit()

def edit(condition, name, Description, ExpiaryDuration,UnitPrice , CostPrice, amount, canBuy, st_id):
    with db.engine.connect() as conn:
        sql = text(
            f"UPDATE Products SET P_Name = '{name}', P_Description = '{Description}', P_Expiry_Duration = '{ExpiaryDuration}', P_Unit_Price = '{UnitPrice}', P_Cost_Price = '{CostPrice}', P_Amount = '{amount}', P_Can_buy = '{canBuy}', St_ID = '{st_id}' WHERE {condition}")
        conn.execute(sql)
        conn.commit()

def delete(condition):
    with db.engine.connect() as conn:
        sql = text(
            f"DELETE FROM Products WHERE {condition}")
        conn.execute(sql)
        conn.commit()

delete(
    "P_ID = 11",
)