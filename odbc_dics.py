import pyodbc
import pandas as pd


mysql_connection_str = (
    'DRIVER=MySQL ODBC 8.0 ANSI Driver;'
    'SERVER=localhost;'
    'PORT=3306;'
    'DATABASE=sakila;'
    'UID=root;'
    'PWD=root;'
    'charset=utf8mb4;'
)

sqlserver_connection_str = (
    'DRIVER={ODBC Driver 17 for SQL Server};'
    'SERVER=localhost\SQLEXPRESS;'
    'PORT=1433;'
    'DATABASE=sakila;'
    'TRUSTED_CONNECTION=yes;'
)

azure_connection_str = (
    'DRIVER={SQL Server};'
    'SERVER=tcp:smurilogs-server.database.windows.net;'
    'PORT=1433;'
    'DATABASE=smurilogs-sqldatabase;'
    'UID=smurilogs;'
    'PWD=!b166ir00;'
    'ENCRYPT=yes;'
    'TRUSTSERVERCERTIFICATE=no;'
    'CONNECTION TIMEOUT=30;'
)

db_connection = pyodbc.connect(sqlserver_connection_str)
db_cursor = db_connection.cursor()

db_query_str = 'SELECT TOP 10 * FROM actor;'
db_cursor.execute(db_query_str)

descrips = list(db_cursor.description)
cols = []
for descrip in descrips:
    cols.append(descrip[0])

rows = db_cursor.fetchall()
records = []
for row in rows:
    record = {}
    for row_i, col in enumerate(cols):
        record[col] = row[row_i]
    records.append(record)

records
