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

#Fname, Mname, Lname, E_SSN, E_Email, E_Job_Position, E_Job_Degree, E_Marital_Status, E_Military_Status, E_BD, E_Gender, E_Shift, E_Governate, E_City, E_Street, E_Scientific_Degree, Dep_ID

# add ("bavly","peter","barsoum","30507062800366","fvfvf@gmail.com","Engineer","Senior","single","exempted","2005-7-6","male","night","cairo","cairo","5th avenue","phd", "1")
# add ("Maria","peter","barsoum","305070628008988366","fvfmvf@gmail.com","Engineer","Senior","single","exempted","2005-7-6","male","night","cairo","cairo","5th avenue","phd", "1")
# edit ("E_ID = 16", "Bavitooo","peter","barsoum","655665565656605070628008988366","bavito@Kima.com","Engineer","Senior","single","exempted","2005-7-6","male","night","cairo","cairo","5th avenue","phd", "1")
# delete ("E_ID = 20")
# print(get())