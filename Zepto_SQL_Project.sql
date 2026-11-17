
-- Zepto SQL Project Analysis

--Data Exploration

-- Count Rows
select count(*) from zepto;

-- Sample data Showing
select Top 10 * from Zepto;

--Null Values
select * from Zepto 
where Name is Null or Category is null
or Mrp is null
or Available_Quantity is null
or DiscountedSellingPrice is null
or Discount_Percent is null
or weight_In_Gms is null
or Out_Of_Stock is null
or Quantity is null;

--Different product Categories
select Distinct Category from Zepto
order by Category;

-- Products in stocks vs Out of stock
select Out_Of_Stock, count(Sku_id) as Product_stock from Zepto
group by Out_Of_Stock;

-- Product names present_names Multiple times
select Name,count(sku_id) as Multiple_Names from Zepto
group by Name
having count(sku_id) > 2
order by count(sku_id) desc;

--Data Cleaning

--Product With Price = 0
select * from Zepto
where Mrp = 0 or DiscountedSellingPrice = 0

Delete from Zepto
where Mrp =0;

--Convert Paise to Rupees
update Zepto set Mrp = Mrp/100.0,
discountedSellingPrice = DiscountedSellingPrice/100.0

select Mrp,DiscountedSellingPrice from Zepto;

--Q1. Find the top 10 best-value products based on the discount percentage.
select Distinct top 10 Name,Mrp, Discount_Percent from Zepto
order by Discount_Percent desc

--Q2.What are the Products with High MRP but Out of Stock
select Name,Mrp from Zepto
where Out_Of_Stock = 1 and Mrp > 300
order by Mrp desc;

--Q3.Calculate Estimated Revenue for each category
Select Category,sum(DiscountedSellingPrice * Available_Quantity) as Total_Revenue
from Zepto
group by Category
order by Total_Revenue desc;

--Q4. Find all products where MRP is greater than 500 and discount is less than 10%
select Name,Mrp,Discount_Percent from Zepto
where Mrp >= 500 and Discount_Percent < 10
order by Mrp desc,Discount_Percent desc;

--Q5. Identify the top 5 categories offering the highest average discount percentage
select top 5 Category,
Avg(Discount_Percent)as Highest_Avg from Zepto
Group by Category
order by Highest_Avg desc;

--Q6. Find the price per gram for products above 100g and sort by best value.
select Name,weight_In_Gms, DiscountedSellingPrice,
(weight_In_Gms / DiscountedSellingPrice) as Per_gram 
from Zepto
where weight_In_Gms >= 100 
order by Per_gram;

--Q7.Group the products into categories like Low, Medium, Bulk.
select Name, weight_In_Gms, 
case
when weight_In_Gms < 1000 Then 'Low'
when weight_In_Gms < 5000 Then 'Medium'
Else 'Bulk'
end as Weight_rank
from Zepto

--Q8.What is the Total Inventory Weight Per Category
select Category, Sum(weight_In_Gms) as per_Category from Zepto
group by Category
order by per_Category;