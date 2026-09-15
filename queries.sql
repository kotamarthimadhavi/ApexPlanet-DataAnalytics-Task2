-- ApexPlanet Task 2: EDA & Business Intelligence

-- 01_top_products_by_revenue.sql
SELECT Product, ROUND(SUM(Sales), 2) AS Revenue
FROM orders
GROUP BY Product
ORDER BY Revenue DESC
LIMIT 5;

-- 02_monthly_revenue_trend.sql
SELECT strftime('%Y-%m', Date) AS Month, ROUND(SUM(Sales), 2) AS Revenue
FROM orders
GROUP BY Month
ORDER BY Month;

-- 03_revenue_by_city_join.sql
SELECT c.City, ROUND(SUM(o.Sales), 2) AS Revenue
FROM orders o
JOIN customers c ON o.Customer_ID = c.Customer_ID
GROUP BY c.City
ORDER BY Revenue DESC;

-- 04_top_customers_join.sql
SELECT c.Customer_ID, c.Customer_Name, ROUND(SUM(o.Sales), 2) AS Revenue
FROM orders o
JOIN customers c ON o.Customer_ID = c.Customer_ID
GROUP BY c.Customer_ID, c.Customer_Name
ORDER BY Revenue DESC
LIMIT 10;

-- 05_category_revenue_share.sql
WITH category_revenue AS (
    SELECT Category, SUM(Sales) AS Revenue FROM orders GROUP BY Category
),
total AS (SELECT SUM(Revenue) AS Total_Revenue FROM category_revenue)
SELECT Category, ROUND(Revenue,2) AS Revenue,
       ROUND(100.0*Revenue/Total_Revenue,2) AS Revenue_Share_Pct
FROM category_revenue, total
ORDER BY Revenue DESC;

-- 06_gender_category_breakdown.sql
SELECT c.Gender, o.Category, COUNT(*) AS Order_Rows,
       ROUND(SUM(o.Sales),2) AS Revenue
FROM orders o
JOIN customers c ON o.Customer_ID = c.Customer_ID
GROUP BY c.Gender, o.Category
ORDER BY c.Gender, Revenue DESC;

-- 07_mom_growth_lag.sql
WITH monthly AS (
    SELECT strftime('%Y-%m', Date) AS Month, SUM(Sales) AS Revenue
    FROM orders GROUP BY Month
),
with_previous AS (
    SELECT Month, Revenue,
           LAG(Revenue) OVER (ORDER BY Month) AS Previous_Revenue
    FROM monthly
)
SELECT Month, ROUND(Revenue,2) AS Revenue,
       ROUND(Previous_Revenue,2) AS Previous_Revenue,
       ROUND(CASE
           WHEN Previous_Revenue IS NULL OR Previous_Revenue=0 THEN NULL
           ELSE 100.0*(Revenue-Previous_Revenue)/Previous_Revenue
       END,2) AS MoM_Growth_Pct
FROM with_previous
ORDER BY Month;

