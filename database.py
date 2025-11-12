"""
Database connection utilities for the electronics_shop project.
"""

import psycopg
from psycopg import OperationalError


# Basic database configuration
DB_NAME = "electronics_db"
DB_USER = "postgres"
DB_PASSWORD = "2020"  # <-- här skriver du ditt riktiga lösenord
DB_HOST = "localhost"
DB_PORT = 5432


def get_connection():
    """
    Create and return a new database connection.

    :return: psycopg connection object
    :raises OperationalError: if the connection to the database fails
    """
    try:
        conn = psycopg.connect(
            dbname=DB_NAME,
            user=DB_USER,
            password=DB_PASSWORD,
            host=DB_HOST,
            port=DB_PORT,
        )
        return conn
    except OperationalError as exc:
        print("Failed to connect to database:", exc)
        raise


def execute_query(query, params=None):
    """
    Execute a SELECT query and return all rows.

    :param query: SQL query string to execute
    :param params: optional tuple with parameter values
    :return: list of rows (list of tuples), or empty list on error
    """
    try:
        with get_connection() as conn:
            with conn.cursor() as cur:
                cur.execute(query, params or ())
                rows = cur.fetchall()
                return rows
    except psycopg.Error as exc:
        print("Database error:", exc)
        return []
