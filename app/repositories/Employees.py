import sys
import os
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

import db
# from extensions import db
from sqlalchemy import text

#-----------------------------------------------------------------------------------
    
def get(columns="*", conditions=None, order_by=None):
    with db.engine.connect() as conn:
        query = f"SELECT {columns} FROM Employees"

        if conditions:
            query += f" WHERE {conditions}"

        if order_by:
            query += f" ORDER BY {order_by}"
            
        sql = text(query)
        result = conn.execute(sql)
        return [row._asdict() for row in result]

#-----------------------------------------------------------------------------------

def add(Fname, Mname, Lname, E_SSN, E_Email, E_Job_Position, E_Job_Degree, E_Marital_Status, E_Military_Status, E_BD, E_Gender, E_Shift, E_Governate, E_City, E_Street, E_Scientific_Degree, Dep_ID):
    with db.engine.connect() as conn:
        sql = text(
            f"INSERT INTO Employees VALUES ('{Fname}', '{Mname}', '{Lname}', '{E_SSN}', '{E_Email}', '{E_Job_Position}', '{E_Job_Degree}', '{E_Marital_Status}', '{E_Military_Status}', '{E_BD}', '{E_Gender}', '{E_Shift}', '{E_Governate}', '{E_City}', '{E_Street}', '{E_Scientific_Degree}', '{Dep_ID}')"
            )
        conn.execute(sql)
        conn.commit()
                  
#-----------------------------------------------------------------------------------

def edit(condition, Fname, Mname, Lname, E_SSN, E_Email, E_Job_Position, E_Job_Degree, E_Marital_Status, E_Military_Status, E_BD, E_Gender, E_Shift, E_Governate, E_City, E_Street, E_Scientific_Degree, Dep_ID):
    with db.engine.connect() as conn:
        sql = text(
            f"UPDATE Employees SET Fname = '{Fname}', Mname = '{Mname}', Lname = '{Lname}', E_SSN = '{E_SSN}', E_Email = '{E_Email}', E_Job_Position = '{E_Job_Position}', E_Job_Degree = '{E_Job_Degree}' , E_Marital_Status = '{E_Marital_Status}', E_Military_Status = '{E_Military_Status}', E_BD = '{E_BD}', E_Gender  = '{E_Gender}', E_Shift = '{E_Shift}', E_Governate = '{E_Governate}', E_City = '{E_City}', E_Street = '{E_Street}', E_Scientific_Degree = '{E_Scientific_Degree}', Dep_ID = '{Dep_ID}' WHERE {condition}"
            )
        conn.execute(sql)
        conn.commit()
        
#-----------------------------------------------------------------------------------

def delete(condition):
    with db.engine.connect() as conn:
        sql = text(
            f"DELETE FROM Employees WHERE {condition}")
        conn.execute(sql)
        conn.commit()
        
#-----------------------------------------------------------------------------------

def custom(query):
    with db.engine.connect() as conn:
        sql = text(query)
        result = conn.execute(sql)
        return [row._asdict() for row in result]

# print(custom("SELECT Dep_ID FROM Departments WHERE Dep_Name = 'Quality Control'"))