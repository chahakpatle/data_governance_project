import mysql.connector
from mysql.connector import Error


def create_connection():

    try:
        connection = mysql.connector.connect(
            host="localhost",
            user="root",
            # Replace with your local MySQL password
            password="YOUR_PASSWORD",
            database="data_governance_db"
        )

        if connection.is_connected():
            print("Database connection successful")

        return connection

    except Error as e:
        print("Error while connecting to MySQL:", e)