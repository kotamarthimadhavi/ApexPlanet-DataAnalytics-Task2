# LinkedIn Video Script – 5–7 Minutes

**Introduction:** Hello everyone. In this project, I worked on Exploratory Data Analysis and Business Intelligence using a sales dataset containing 1,000 records and 12 columns. My goal was to understand sales patterns, answer business questions using SQL, and create a dashboard.

**Data inspection:** First, I loaded the Excel file using pandas. I checked the shape, data types, missing values and duplicate Order_IDs. There are 20 missing Age values, 13 missing City values and 8 repeated Order_ID values.

**EDA:** I calculated descriptive statistics and created histograms and categorical bar charts. Total Sales is right-skewed because it depends on quantity and unit price.

**SQL:** I split the data into customers and orders tables and loaded them into SQLite. I wrote seven queries covering product revenue, monthly trends, city revenue with JOIN, top customers with JOIN, category share, gender-category analysis and MoM growth using LAG().

**Key insights:** Electronics is the leading category with about 36.4% of revenue. Quantity and Unit Price have the strongest relationships with Total Sales. Age does not show a meaningful relationship with sales.

**Visual analysis:** I created a correlation heatmap, scatter plot, box plot and pair plot to understand relationships between variables.

**Dashboard:** Finally, I created a static dashboard with revenue and order KPIs plus monthly, category, city and gender charts.

**Closing:** This project helped me practice Python, pandas, SQL JOINs, aggregation, window functions, visualization and business storytelling. Thank you for watching.
