from sqlalchemy import create_engine

# Database configuration
DB_CONFIG = {
    'server': 'localhost',
    'database': 'KIMA_DB',
    'driver': 'ODBC Driver 17 for SQL Server',
    'trusted_connection': 'yes'
}

# Create connection string
CONNECTION_STRING = (
    f"mssql+pyodbc://@{DB_CONFIG['server']}/{DB_CONFIG['database']}"
    f"?driver={DB_CONFIG['driver']}&trusted_connection={DB_CONFIG['trusted_connection']}"
)

# Create engine - can be used with or without Flask
engine = create_engine(CONNECTION_STRING)