import sys
import os
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

import db
# from extensions import db
from sqlalchemy import text

#-----------------------------------------------------------------------------------
    
def get(columns="*", conditions=None, order_by=None):
    with db.engine.connect() as conn:
        query = f"SELECT {columns} FROM Suppliers"

        if conditions:
            query += f" WHERE {conditions}"

        if order_by:
            query += f" ORDER BY {order_by}"
            
        sql = text(query)
        result = conn.execute(sql)
        return [row._asdict() for row in result]

#-----------------------------------------------------------------------------------

def add(Sup_Name, Sup_phone, Sup_CED, Sup_CSD, Sup_Email, Sup_Bank_Acc, Sup_Address):
    with db.engine.connect() as conn:
        sql = text(
            f"INSERT INTO Suppliers VALUES ('{Sup_Name}', '{Sup_phone}', '{Sup_CED}', '{Sup_CSD}', '{Sup_Email}', '{Sup_Bank_Acc}', '{Sup_Address}')"
            )
        conn.execute(sql)
        conn.commit()
                  
#-----------------------------------------------------------------------------------

def edit(condition, Sup_Name, Sup_phone, Sup_CED, Sup_CSD, Sup_Email, Sup_Bank_Acc, Sup_Address):
    with db.engine.connect() as conn:
        sql = text(
            f"UPDATE Suppliers SET Sup_Name = '{Sup_Name}', Sup_phone = '{Sup_phone}', Sup_CED = '{Sup_CED}', Sup_CSD = '{Sup_CSD}', Sup_Email = '{Sup_Email}', Sup_Bank_Acc = '{Sup_Bank_Acc}', Sup_Address = '{Sup_Address}' WHERE {condition}"
            )
        conn.execute(sql)
        conn.commit()
        
#-----------------------------------------------------------------------------------

def delete(condition):
    with db.engine.connect() as conn:
        sql = text(
            f"DELETE FROM Suppliers WHERE {condition}")
        conn.execute(sql)
        conn.commit()
        
#-----------------------------------------------------------------------------------

# Sup_Name, Sup_phone, Sup_CED, Sup_CSD, Sup_Email, Sup_Bank_Acc, Sup_Address
    
    # Sup_Name varchar(255) not null,
    # Sup_phone varchar(15),
    # Sup_CED Date,
    # Sup_CSD Date,
    # Sup_Email varchar(100),
    # Sup_Bank_Acc varchar(100),
    # Sup_Address varchar(255)


# add ("Bavlyyyy","01285872999","2025-12-13","2005-7-6","bavly@kima.com","5060809030","4 elhaded w elsolb - kima")
# add ("Bisho","01285872999","2025-12-13","2005-7-6","bavly@kima.com","5060809030","4 elhaded w elsolb - kima")
#edit ("Sup_ID = 13", "Bishoooo0","010000005","2025-12-13","2005-7-6","bisho@kima.com","55555555","5 elsel - aswan")
#delete ("Sup_ID = 13")
#print(get())