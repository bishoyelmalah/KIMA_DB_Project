class Config:
    # --- 1. Database Connection Variables (REPLACE PLACEHOLDERS) ---
    # These are used to build the URI
    SERVER = 'localhost'
    DATABASE = 'KIMA_DB'
    driver = "ODBC Driver 17 for SQL Server"
    
    # SQLAlchemy URI
    SQLALCHEMY_DATABASE_URI = (
        f"mssql+pyodbc://@{SERVER}/{DATABASE}?driver={driver}&Trusted_Connection=yes"
    )
    
    SQLALCHEMY_ENGINE_OPTIONS = {
        "pool_size": 10,
        "max_overflow": 5,
        "pool_recycle": 3600, 
        "echo": True # Set to True to print SQL queries for debugging
    }
    
    # --- 2. Configuration Flags ---
    # Turning this off saves resources
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    # SQLALCHEMY_ECHO = True
    # SQLALCHEMY_RECORD_QUERIES = True