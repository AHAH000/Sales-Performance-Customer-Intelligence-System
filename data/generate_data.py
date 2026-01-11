import pandas as pd
import random
from datetime import datetime, timedelta

# -------------------------
# CONFIG
# -------------------------
NUM_CUSTOMERS = 100
NUM_PRODUCTS = 30
NUM_ORDERS = 300

random.seed(42)

# -------------------------
# CUSTOMERS
# -------------------------
customers = []
segments = ["VIP", "Regular", "New"]

for i in range(1, NUM_CUSTOMERS + 1):
    customers.append({
        "customer_id": i,
        "customer_name": f"Customer {i}",
        "segment": random.choice(segments),
        "country": random.choice(["Egypt", "UAE", "Saudi Arabia"]),
        "city": random.choice(["Cairo", "Alexandria", "Dubai", "Riyadh"])
    })

customers_df = pd.DataFrame(customers)

# -------------------------
# PRODUCTS
# -------------------------
categories = ["Electronics", "Clothing", "Home Appliances", "Sports"]

products = []
for i in range(1, NUM_PRODUCTS + 1):
    price = random.randint(50, 5000)
    products.append({
        "product_id": i,
        "product_name": f"Product {i}",
        "category": random.choice(categories),
        "unit_price": price
    })

products_df = pd.DataFrame(products)

# -------------------------
# ORDERS
# -------------------------
orders = []
start_date = datetime(2024, 1, 1)

for i in range(1, NUM_ORDERS + 1):
    order_date = start_date + timedelta(days=random.randint(0, 365))
    orders.append({
        "order_id": i,
        "customer_id": random.randint(1, NUM_CUSTOMERS),
        "order_date": order_date.strftime("%Y-%m-%d")
    })

orders_df = pd.DataFrame(orders)

# -------------------------
# ORDER DETAILS (FACT DATA)
# -------------------------
order_details = []

for order in orders:
    num_items = random.randint(1, 5)
    for _ in range(num_items):
        product = products_df.sample(1).iloc[0]
        quantity = random.randint(1, 10)

        order_details.append({
            "order_id": order["order_id"],
            "product_id": product["product_id"],
            "quantity": quantity,
            "unit_price": product["unit_price"]
        })

order_details_df = pd.DataFrame(order_details)

# -------------------------
# SAVE FILES
# -------------------------
customers_df.to_csv("data/raw/customers.csv", index=False)
products_df.to_csv("data/raw/products.csv", index=False)
orders_df.to_csv("data/raw/orders.csv", index=False)
order_details_df.to_csv("data/raw/order_details.csv", index=False)

print("✅ Data generation completed successfully!")
