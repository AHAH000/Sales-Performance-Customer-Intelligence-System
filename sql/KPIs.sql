/* =========================================================
	 KPI & BUSINESS ANALYSIS QUERIES
   ========================================================= */

-- 1) Total Revenue
SELECT SUM(revenue) AS TotalRevenue
FROM dbo.FactSales;

-- 2) Total Orders
SELECT COUNT(DISTINCT order_id) AS TotalOrders
FROM dbo.FactSales;

-- 3) Average Order Value (AOV)
SELECT
    SUM(revenue) * 1.0 / COUNT(DISTINCT order_id) AS AverageOrderValue
FROM dbo.FactSales;

-- 4) Revenue by Month
SELECT
    d.year,
    d.month,
    SUM(f.revenue) AS MonthlyRevenue
FROM dbo.FactSales f
JOIN dbo.DimDate d ON f.date_id = d.date_id
GROUP BY d.year, d.month
ORDER BY d.year, d.month;

-- 5) Month-over-Month Growth
WITH MonthlyRevenue AS (
    SELECT
        d.year,
        d.month,
        SUM(f.revenue) AS revenue
    FROM dbo.FactSales f
    JOIN dbo.DimDate d ON f.date_id = d.date_id
    GROUP BY d.year, d.month
)
SELECT
    year,
    month,
    revenue,
    revenue - LAG(revenue) OVER (ORDER BY year, month) AS RevenueChange,
    (revenue - LAG(revenue) OVER (ORDER BY year, month)) * 1.0
        / NULLIF(LAG(revenue) OVER (ORDER BY year, month), 0) AS MoM_Growth
FROM MonthlyRevenue
ORDER BY year, month;

-- 6) Revenue by Customer
SELECT
    c.customer_name,
    c.segment,
    SUM(f.revenue) AS TotalRevenue
FROM dbo.FactSales f
JOIN dbo.DimCustomer c ON f.customer_id = c.customer_id
GROUP BY c.customer_name, c.segment
ORDER BY TotalRevenue DESC;

-- 7) Top 10 Customers
SELECT TOP 10
    c.customer_name,
    SUM(f.revenue) AS Revenue
FROM dbo.FactSales f
JOIN dbo.DimCustomer c ON f.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY Revenue DESC;

-- 8) Revenue by Product Category
SELECT
    p.category,
    SUM(f.revenue) AS CategoryRevenue
FROM dbo.FactSales f
JOIN dbo.DimProduct p ON f.product_id = p.product_id
GROUP BY p.category
ORDER BY CategoryRevenue DESC;

-- 9) Top 10 Products
SELECT TOP 10
    p.product_name,
    SUM(f.revenue) AS Revenue
FROM dbo.FactSales f
JOIN dbo.DimProduct p ON f.product_id = p.product_id
GROUP BY p.product_name
ORDER BY Revenue DESC;

-- 10) Revenue by Customer Segment
SELECT
    c.segment,
    COUNT(DISTINCT f.customer_id) AS Customers,
    SUM(f.revenue) AS Revenue
FROM dbo.FactSales f
JOIN dbo.DimCustomer c ON f.customer_id = c.customer_id
GROUP BY c.segment
ORDER BY Revenue DESC;