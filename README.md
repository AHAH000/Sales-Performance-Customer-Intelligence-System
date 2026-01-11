# Sales Performance & Customer Intelligence System

## Project Overview
This project delivers an end-to-end Business Intelligence solution designed to analyze sales performance, customer behavior, and product profitability. The system follows a structured data pipeline starting from raw transactional data, transforming it into a star schema data warehouse, and presenting insights through interactive Power BI dashboards.

The main objective is to enable decision-makers to track key performance indicators (KPIs), identify revenue drivers, and support data-driven business decisions.

---

## Business Questions
- How are sales and revenue performing over time?
- Which customers contribute the most to total revenue?
- Which product categories and products drive profitability?
- How does revenue change month-over-month?
- How does customer segmentation impact sales performance?

---

## Data Pipeline Architecture
1. Raw CSV files ingested into SQL Server staging tables
2. Data transformed into dimension and fact tables
3. Star schema optimized for analytical queries
4. Power BI connected directly to SQL Server for reporting

---

## Data Model (Star Schema)
The data warehouse follows a star schema design with a central fact table and multiple supporting dimension tables:

### Fact Table
- **FactSales**
  - order_id
  - date_id
  - customer_id
  - product_id
  - quantity
  - revenue

### Dimension Tables
- **DimCustomer**: customer details and segmentation
- **DimProduct**: product information and categories
- **DimDate**: calendar attributes for time-based analysis

This structure improves query performance and simplifies BI reporting.

---

## Key Performance Indicators (KPIs)
- Total Revenue
- Total Orders
- Average Order Value (AOV)
- Revenue by Customer
- Revenue by Product Category
- Top Customers and Products
- Month-over-Month Revenue Growth

---

## SQL Analysis
SQL queries were written to calculate business KPIs and analytical insights, including:
- Revenue aggregation
- Customer and product performance
- Time-based trend analysis
- Month-over-month growth calculations

All queries are stored in:


---

## Power BI Dashboard
An interactive Power BI dashboard was built using the SQL Server data warehouse.

### Dashboard Pages
1. **Executive Overview**
   - KPI cards for revenue, orders, and AOV
   - Sales trends over time
   - Revenue by product category

2. **Customer Intelligence**
   - Top customers by revenue
   - Revenue distribution by customer segment
   - Customer-level performance table

3. **Product Performance**
   - Top-performing products
   - Category-level revenue comparison
   - Quantity and revenue analysis

4. **Insights & Recommendations**
   - Written business insights derived from data
   - Actionable recommendations for management

---

## Key Business Insights
- A small percentage of customers generate the majority of revenue.
- Certain product categories consistently outperform others.
- Month-over-month analysis highlights clear periods of growth and decline.
- Customer segmentation provides valuable insight into revenue concentration.

---

## Tools & Technologies
- **SQL Server (SSMS)** – Data storage, transformation, and analysis
- **Power BI** – Data visualization and reporting
- **DAX** – KPI and time intelligence calculations
- **Python** – Synthetic data generation
- **CSV Files** – Raw data source

---
Project Structure:

    │
    ├── data/
    │ ├── raw/
    │ └── cleaned/
    │
    ├── sql/
    │ └── analysis_queries.sql
    │
    ├── powerbi/
    │ └── sales_dashboard.pbix
    │
    ├── docs/
    │ └── star_schema.png
    │
    └── README.md
---

## Outcome
This project demonstrates a complete Business Intelligence workflow, including data ingestion, modeling, analysis, and visualization. It reflects industry-standard BI practices and is suitable for Junior Data Analyst or Business Intelligence Analyst roles.
