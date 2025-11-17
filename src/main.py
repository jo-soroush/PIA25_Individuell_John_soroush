"""
Main program for the electronics_shop project.
"""

from queries import get_all_products, get_products_by_brand, get_customer_orders


def main():
    print("=== Alla produkter ===")
    for row in get_all_products():
        print(row)

    print("\n=== Apple-produkter ===")
    for row in get_products_by_brand("Apple"):
        print(row)

    print("\n=== Beställningar för kund med ID 1 ===")
    for row in get_customer_orders(1):
        print(row)


if __name__ == "__main__":
    main()
