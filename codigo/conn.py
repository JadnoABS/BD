import mysql.connector
from password import password

try:
    conn = mysql.connector.connect(user='root', password=admin,
                            host='127.0.0.1',
                            database='db')
except Exception as e:
    print("Conexão falhou")
