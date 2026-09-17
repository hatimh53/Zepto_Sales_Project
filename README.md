# Zepto Sales Analysis (SQL)

Analyzing product sales data from **Zepto**, a quick-commerce grocery delivery app.

## About the Project
This project analyzes sales data from Zepto (a quick-commerce grocery app) using SQL. 
The goal was to explore raw product data, clean it up, and answer real business 
questions that a data analyst might be asked — like which products offer the best 
discounts, which categories generate the most revenue, and which high-value items 
are out of stock.

## Dataset
The dataset (`zepto_v2.csv`) contains product-level data including category, name, 
MRP, discount percentage, stock status, quantity, and weight.

## Tools Used
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-336791?style=for-the-badge&logo=postgresql&logoColor=white)

## Steps Followed

### 1. Data Exploration
- Checked row count and null values across key columns
- Reviewed all product categories
- Checked stock status distribution (in stock vs out of stock)
- Found duplicate product names appearing multiple times

### 2. Data Cleaning
- Removed rows where price (MRP or discounted price) was 0, since these are invalid entries
- Converted prices from paise to rupees for readability

### 3. Business Analysis
Wrote 8 SQL queries to answer real business questions, including:
- Top 10 best-discounted products
- High-value products that are out of stock
- Estimated revenue per category
- Products with high MRP but low discounts
- Categories with the highest average discount
- Best value products by price-per-gram
- Products segmented into Low/Medium/Bulk by quantity
- Total inventory weight per category

Full queries with explanations are in [`Zepto_Project.sql`](./Zepto_Project.sql).

## Key Learnings
- Practiced structuring a full analysis project: explore → clean → analyze
- Learned to catch and fix data quality issues (invalid entries, missing checks)
- Practiced SQL aggregation, filtering, and conditional logic (CASE statements)

## How to Run
1. Create a PostgreSQL database
2. Run the `CREATE TABLE` statement from `Zepto_Project.sql` to set up the table
3. Import `zepto_v2.csv` into the `Zepto` table (e.g., using pgAdmin's Import feature)
4. Run the remaining queries in `Zepto_Project.sql` in order — data exploration, 
   cleaning, then business analysis

---
## If you found my work useful, leave a ⭐ on the repo.
