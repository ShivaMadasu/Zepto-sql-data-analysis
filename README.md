# 🛒 Zepto E-commerce SQL Data Analysis Project

An end-to-end SQL data analysis of Zepto's quick-commerce inventory data using **Microsoft SQL Server**. The project simulates a real analyst workflow: exploring raw data, cleaning it, and answering business questions about pricing, discounts, stock availability, revenue and inventory weight.

This project is useful for:

- 📊 Aspiring Business / Data / Marketing Analysts building a portfolio project
- 📚 Anyone practising SQL hands-on with a realistic retail dataset
- 💼 Preparing for interviews in retail, e-commerce and product analytics

---

## 📌 Project Overview

The goal is to show how analysts in e-commerce and retail use SQL to:

✅ Load and explore a messy, real-world inventory dataset

✅ Run **Exploratory Data Analysis (EDA)** on categories, stock status and pricing

✅ Perform **Data Cleaning**: find nulls, remove invalid prices, convert paise to rupees

✅ Write **business-driven SQL queries** on discounts, revenue, stock-outs, value-for-money and inventory weight

---

## 📁 Dataset Overview

The dataset is a Zepto product-listing inventory dataset (public Kaggle dataset, file `zepto_v2.csv`). Each row is a unique SKU (Stock Keeping Unit). The same product name can appear several times because it is listed in different package sizes, weights, discounts or categories.

**Columns**

| Column | Description |
|---|---|
| `Sku_id` | Unique ID for each product entry |
| `Name` | Product name as shown in the app |
| `Category` | Product category (Fruits, Snacks, Beverages, etc.) |
| `Mrp` | Maximum Retail Price (originally in paise, converted to ₹) |
| `Discount_Percent` | Discount applied on MRP |
| `DiscountedSellingPrice` | Final selling price after discount (converted to ₹) |
| `Available_Quantity` | Units available in inventory |
| `weight_In_Gms` | Product weight in grams |
| `Out_Of_Stock` | Flag showing stock availability (1 = out of stock) |
| `Quantity` | Units per package |

---

## 🛠️ Tools Used

- **SQL Server** (T-SQL) / SSMS
- Dataset: Zepto inventory CSV
- Version control: Git & GitHub

---

## 🔧 Project Workflow

### 1. Data Exploration 🔍

- Counted total records in the table
- Viewed a sample of 10 rows to understand structure
- Checked for NULL values across all columns
- Listed distinct product categories
- Compared in-stock vs out-of-stock products
- Found product names that appear multiple times (different SKUs)

### 2. Data Cleaning 🧹

- Identified products with `Mrp = 0` or `DiscountedSellingPrice = 0`
- Deleted rows with zero MRP
- Converted `Mrp` and `DiscountedSellingPrice` from **paise to rupees** (÷ 100)

### 3. Business Analysis 📊

| # | Business Question |
|---|---|
| Q1 | What are the top 10 best-value products by discount percentage? |
| Q2 | Which high-MRP products (> ₹300) are out of stock? |
| Q3 | What is the estimated revenue for each category? |
| Q4 | Which products have MRP ≥ ₹500 but discount below 10%? |
| Q5 | Which 5 categories offer the highest average discount? |
| Q6 | What is the value-for-money (weight vs price) for products of 100g and above? |
| Q7 | How can products be grouped into Low, Medium and Bulk by weight? |
| Q8 | What is the total inventory weight per category? |

**Sample query: estimated revenue per category**

```sql
SELECT Category,
       SUM(DiscountedSellingPrice * Available_Quantity) AS Total_Revenue
FROM Zepto
GROUP BY Category
ORDER BY Total_Revenue DESC;
```

**Sample query: weight grouping**

```sql
SELECT Name, weight_In_Gms,
  CASE
    WHEN weight_In_Gms < 1000 THEN 'Low'
    WHEN weight_In_Gms < 5000 THEN 'Medium'
    ELSE 'Bulk'
  END AS Weight_rank
FROM Zepto;
```

---

## 📈 Key Insights

> Run the queries and replace the lines below with your own findings.

- Categories with the highest estimated revenue: *(add result of Q3)*
- Categories offering the deepest average discounts: *(add result of Q5)*
- Number of high-MRP products currently out of stock: *(add result of Q2)*
- Share of products falling in Low / Medium / Bulk weight groups: *(add result of Q7)*

---

## 🚀 How to Use This Project

1. **Clone the repository**
   ```bash
   git clone https://github.com/<your-username>/zepto-sql-data-analysis.git
   cd zepto-sql-data-analysis
   ```
2. **Create a database** in SQL Server and import `zepto_v2.csv` into a table named `Zepto` (use the SSMS Import Flat File wizard; save the CSV as UTF-8 if you see encoding errors).
3. **Open `Zepto SQL Project.sql`** and run it section by section: Exploration → Cleaning → Business Analysis.
4. Review the output of each query and note your insights.

---

## 📂 Repository Structure

```
zepto-sql-data-analysis/
├── Zepto SQL Project.sql   # Exploration, cleaning and analysis queries
├── zepto_v2.csv            # Dataset
├── README.md               # Project documentation
└── LICENSE                 # MIT License
```

---

## 🔮 Future Improvements

- Connect the cleaned data to **Power BI** and build an inventory & discount dashboard
- Add window-function analysis (category-wise ranking of products)
- Add stored procedures for repeatable cleaning

---

## 📜 License

MIT: feel free to fork, learn from it and use it in your portfolio.

## 👤 About the Author

**Madasu Shiva**: MBA (Marketing) graduate focused on Business, Marketing and Data Analyst roles. Skills: SQL Server, Excel, Power BI.

- 💼 LinkedIn: https://www.linkedin.com/in/shiva-madasu-8a6625350/
- 📧 Email: shivamadasu593@gmail.com

⭐ If you found this project helpful, please star the repo!
