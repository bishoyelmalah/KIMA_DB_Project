import sys
import os
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

import db
# from extensions import db
from sqlalchemy import text

def get(columns="*", conditions=None, order_by=None):
    with db.engine.connect() as conn:
        query = f"SELECT {columns} FROM Dependants"
        if conditions:
            query += f" WHERE {conditions}"
        if order_by:
            query += f" ORDER BY {order_by}"
        sql = text(query)
        result = conn.execute(sql)
        return [row._asdict() for row in result]

def add(D_SSN, D_Name, D_Gender, D_Relation_Type,  D_BD,D_Marital_status,D_Email,D_Phone, E_ID):
    with db.engine.connect() as conn:
        sql = text(
            f"INSERT INTO Dependants VALUES ('{D_SSN}', '{D_Name}', '{D_Gender}', '{D_Relation_Type}', '{D_BD}', '{D_Marital_status}','{D_Email}','{D_Phone}', '{E_ID}')"
            )
        conn.execute(sql)
        conn.commit()

def edit(condition, D_SSN, D_Name, D_Gender, D_Relation_Type,  D_BD,D_Marital_status,D_Email,D_Phone, E_ID):
    with db.engine.connect() as conn:
        sql = text(
            f"UPDATE Dependants SET D_SSN = '{D_SSN}', D_Name = '{D_Name}', D_Gender = '{D_Gender}', D_Relation_Type = '{D_Relation_Type}', D_BD = '{D_BD}', D_Marital_status = '{D_Marital_status}', D_Email = '{D_Email}', D_Phone = '{D_Phone}', E_ID = '{E_ID}' WHERE {condition}")
        conn.execute(sql)
        conn.commit()

def delete(condition):
    with db.engine.connect() as conn:
        sql = text(
            f"DELETE FROM Dependants WHERE {condition}")
        conn.execute(sql)
        conn.commit()
        
        
delete(
    "D_Name = 'ali'",
)