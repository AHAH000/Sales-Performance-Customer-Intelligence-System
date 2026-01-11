/* Customer DIMENSION Table */
CREATE TABLE DimCustomer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50)
);
INSERT INTO DimCustomer
SELECT DISTINCT
    customer_id,
    customer_name,
    segment,
    country,
    city
FROM dbo.stg_customers;

SELECT COUNT(*) FROM DimCustomer;

/* Product DIMENSION Table */
CREATE TABLE DimProduct (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    unit_price DECIMAL(10,2)
);

INSERT INTO DimProduct
SELECT DISTINCT
    product_id,
    product_name,
    category,
    unit_price
FROM dbo.stg_products;

SELECT COUNT(*) FROM DimProduct;

/* Date DIMENSION Table */


CREATE TABLE DimDate (
    date_id INT PRIMARY KEY,
    full_date DATE,
    year INT,
    month INT,
    day INT
);
INSERT INTO DimDate
SELECT DISTINCT
    CONVERT(INT, FORMAT(order_date, 'yyyyMMdd')) AS date_id,
    order_date,
    YEAR(order_date),
    MONTH(order_date),
    DAY(order_date)
FROM dbo.stg_orders;

SELECT COUNT(*) FROM DimDate;

/* Fact Table */

CREATE TABLE FactSales (
    sales_id INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT,
    date_id INT,
    customer_id INT,
    product_id INT,
    quantity INT,
    revenue DECIMAL(12,2)
);

INSERT INTO FactSales (
    order_id,
    date_id,
    customer_id,
    product_id,
    quantity,
    revenue
)
SELECT
    o.order_id,
    CONVERT(INT, FORMAT(o.order_date, 'yyyyMMdd')) AS date_id,
    o.customer_id,
    od.product_id,
    od.quantity,
    od.quantity * od.unit_price AS revenue
FROM dbo.stg_orders o
JOIN dbo.stg_order_details od
    ON o.order_id = od.order_id;


SELECT COUNT(*) FROM FactSales;
SELECT TOP 10 * FROM FactSales;

SELECT SUM(revenue) AS TotalRevenue
FROM FactSales;
