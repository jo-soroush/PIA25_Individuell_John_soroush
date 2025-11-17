"""
SQL query functions for the electronics_shop project.
"""

from database import execute_query


def get_all_products():
    """
    Retrieve all products sorted by name.
    :return: list of tuples containing product data
    """
    query = "SELECT id, name, price, category FROM products ORDER BY name;"
    return execute_query(query)


def get_products_by_brand(brand_name: str):
    """
    Retrieve products by a given brand name.
    :param brand_name: name of the brand
    :return: list of tuples containing product data
    """
    query = """
        SELECT p.name, b.name AS brand_name, p.price
        FROM products p
        JOIN brands b ON p.brand_id = b.id
        WHERE b.name = %s
        ORDER BY p.price DESC;
    """
    return execute_query(query, (brand_name,))


def get_customer_orders(customer_id: int):
    """
    Retrieve all orders for a given customer.
    :param customer_id: ID of the customer
    :return: list of tuples containing order information
    """
    query = """
        SELECT o.id, o.order_date, o.total_amount, o.status
        FROM orders o
        WHERE o.customer_id = %s
        ORDER BY o.order_date DESC;
    """
    return execute_query(query, (customer_id,))
