import sys
import os
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

import db
# from extensions import db
from sqlalchemy import text
#-----------------------------------------------------------------------------------
    
def get(columns="*", conditions=None, order_by=None):
    with db.engine.connect() as conn:
        query = f"SELECT {columns} FROM Invoices"

        if conditions:
            query += f" WHERE {conditions}"

        if order_by:
            query += f" ORDER BY {order_by}"
            
        sql = text(query)
        result = conn.execute(sql)
        return [row._asdict() for row in result]

#-----------------------------------------------------------------------------------

def add(I_Amount, I_Customer, I_Currency, I_Status, I_Method, I_Date, I_Recorded_By, CF_ID, C_ID, Co_ID):
    with db.engine.connect() as conn:
        sql = text(
            f"INSERT INTO Invoices VALUES ('{I_Amount}', '{I_Customer}', '{I_Currency}', '{I_Status}', '{I_Method}', '{I_Date}', '{I_Recorded_By}', '{CF_ID}', '{C_ID}', '{Co_ID}')"
            )
        conn.execute(sql)
        conn.commit()
                  
#-----------------------------------------------------------------------------------

def edit(condition, I_Amount, I_Customer, I_Currency, I_Status, I_Method, I_Date, I_Recorded_By, CF_ID, C_ID, Co_ID):
    with db.engine.connect() as conn:
        sql = text(
            f"UPDATE Invoices SET I_Amount = '{I_Amount}', I_Customer = '{I_Customer}', I_Currency = '{I_Currency}', I_Status = '{I_Status}', I_Method = '{I_Method}', I_Date = '{I_Date}', I_Recorded_By = '{I_Recorded_By}', CF_ID = '{CF_ID}', C_ID = '{C_ID}', Co_ID = '{Co_ID}' WHERE {condition}"
            )
        conn.execute(sql)
        conn.commit()
        
#-----------------------------------------------------------------------------------

def delete(condition):
    with db.engine.connect() as conn:
        sql = text(
            f"DELETE FROM Invoices WHERE {condition}")
        conn.execute(sql)
        conn.commit()
        
#-----------------------------------------------------------------------------------

# I_Amount, I_Customer, I_Currency, I_Status, I_Method, I_Date, I_Recorded_By, CF_ID, C_ID, Co_ID

# add ("30", "Bavly", "EGP", "Paid", "Check", "2024-11-02", "Admin3", "4", "4", "4")
# add ("30", "Bisho", "EGP", "Paid", "Check", "2024-11-02", "Admin3", "4", "4", "4")
# edit ( "I_ID = 12", "30", "Biishooooooo", "EGP", "Paid", "Check", "2024-11-02", "Admin3", "4", "4", "4")
# delete ("I_ID = 12")
# print(get())