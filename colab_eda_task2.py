# ApexPlanet Task 2 – EDA & Business Intelligence
import pandas as pd
import matplotlib.pyplot as plt
import sqlite3

df = pd.read_excel("ApexPlanet_DataAnalytics_Dataset.xlsx")
df["Order_Date"] = pd.to_datetime(df["Order_Date"])

# Step 1
print("Shape:", df.shape)
print("\nDtypes:\n", df.dtypes)
print("\nNulls:\n", df.isna().sum())
print("\nDuplicate Order_ID rows:", df["Order_ID"].duplicated().sum())

# Step 2
numeric_cols = ["Age","Quantity","Unit_Price","Total_Sales"]
print(df[numeric_cols].describe())
print("\nMedians:\n", df[numeric_cols].median())

for col in ["Gender","City","Product","Category"]:
    print(f"\n{col}:")
    print(df[col].value_counts(dropna=False))

for col in numeric_cols:
    df[col].dropna().plot(kind="hist", bins=25, title=f"Distribution of {col}")
    plt.show()

for col in ["Gender","City","Product","Category"]:
    df[col].fillna("Missing").value_counts().plot(kind="bar", title=f"{col} Frequency")
    plt.xticks(rotation=35)
    plt.show()

# Step 3
customers = (df.groupby("Customer_ID", as_index=False)
               .agg({"Customer_Name":"first","Age":"first","Gender":"first","City":"first"}))
orders = df.rename(columns={"Order_Date":"Date","Quantity":"Qty",
                            "Unit_Price":"Price","Total_Sales":"Sales"})[
    ["Order_ID","Customer_ID","Date","Product","Category","Qty","Price","Sales"]]

con = sqlite3.connect("eda_business_intelligence.sqlite")
customers.to_sql("customers", con, if_exists="replace", index=False)
orders.to_sql("orders", con, if_exists="replace", index=False)

# Step 4: use queries.sql from this project or paste the seven queries here.
# Step 5
corr = df[numeric_cols].corr()
print(corr)
plt.imshow(corr, aspect="auto")
plt.xticks(range(len(corr.columns)), corr.columns, rotation=35)
plt.yticks(range(len(corr.index)), corr.index)
plt.colorbar()
plt.title("Correlation Heatmap")
plt.show()

plt.scatter(df["Unit_Price"], df["Total_Sales"], alpha=.6)
plt.xlabel("Unit Price"); plt.ylabel("Total Sales")
plt.title("Unit Price vs Total Sales")
plt.show()

df.boxplot(column="Age", by="Category", figsize=(9,5))
plt.title("Age vs Category"); plt.suptitle("")
plt.show()

pd.plotting.scatter_matrix(df[numeric_cols].dropna(), figsize=(11,11), diagonal="hist")
plt.show()

con.close()
