# ApexPlanet Task 2 – Exploratory Data Analysis (EDA) & Business Intelligence

## Objective
Uncover patterns, trends and relationships in the sales data and use SQL for business questions, joins, aggregation and window functions.

## Dataset Overview
- **1,000 rows × 12 columns**
- Missing Age: **20**
- Missing City: **13**
- Repeated Order_ID rows: **8** (representing **8 repeated Order_ID values**)
- Unique Order_IDs: **992**
- Unique Customer_IDs: **947**
- Date range: **2025-01-01 to 2026-01-01**

The raw rows are retained. For the SQLite `customers` table, one consistent row per Customer_ID is kept because the source repeats some Customer_IDs with differing attributes.

## Descriptive Statistics

| Field | Mean | Median | Std | Min | Max |
|---|---:|---:|---:|---:|---:|
| Age | 41.36 | 41.00 | 13.82 | 18 | 65 |
| Quantity | 5.43 | 5.00 | 2.84 | 1 | 10 |
| Unit_Price | ₹25,486.78 | ₹25,398.74 | ₹14,179.40 | ₹145.78 | ₹49,997.53 |
| Total_Sales | ₹139,399.44 | ₹108,594.02 | ₹114,100.05 | ₹437.34 | ₹493,677.50 |

**Interpretation:** Total_Sales is right-skewed because it is driven by both Quantity and Unit_Price, producing a smaller number of high-value transactions.

## Categorical Analysis
- Gender: Male **511**, Female **489**
- Most frequent City: **Patna**
- Most frequent Product: **Mobile**
- Largest Category by record count: **Electronics**

## SQL Business Questions
1. Top 5 products by revenue.
2. Monthly revenue trend.
3. Revenue by city using a JOIN.
4. Top customers using a JOIN.
5. Category revenue share.
6. Gender × category revenue breakdown.
7. Month-over-month growth using `LAG()`.

Top product by revenue: **Laptop — ₹25,443,008.51**.

Highest city revenue in the JOIN analysis: **Kolkata — ₹19,932,381.33**.

### Category revenue share
- Electronics: **36.43%**
- Education: **17.96%**
- Grocery: **15.95%**
- Furniture: **15.44%**
- Fashion: **14.23%**

## Multivariate Analysis
- Quantity vs Total_Sales correlation: **0.65**
- Unit_Price vs Total_Sales correlation: **0.69**
- Strongest absolute Age correlation with another requested numeric field: **0.03**

**Interpretation:** Quantity and Unit_Price are the main sales-related variables. Age does not show a meaningful relationship with sales in this dataset.

## Dashboard KPIs
- Total Revenue
- Sales Records
- Unique Order IDs
- Average Sales per Record
- Monthly Revenue Trend
- Revenue by Category
- Revenue by City
- Revenue by Gender

## Key Insights
1. **Electronics contributes 36.43% of total revenue**, making it the leading category.
2. Quantity and Unit_Price have the strongest relationships with Total_Sales.
3. Missing values and repeated Order_IDs should be checked before production reporting.

## Deliverables
EDA report, SQL queries, query-result CSVs, charts, SQLite database, dashboard mock-up, Colab Python script and LinkedIn video script.
