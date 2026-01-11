/* Customer Staging Table */
CREATE TABLE stg_customers (
    customer_id INT,
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50)
);

/* Products Staging Table */

CREATE TABLE stg_products (
	product_id INT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    unit_price DECIMAL(10,2)
);

/* Orders Staging Table */
CREATE TABLE stg_orders (
    order_id INT,
    customer_id INT,
    order_date DATE
);

/* Orders Details Staging Table */
CREATE TABLE stg_order_details (
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2)
);



