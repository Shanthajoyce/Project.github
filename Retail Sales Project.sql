#RETAIL SALES EXPLORATORY DATA ANALYSIS
DESCRIBE retail_data;


#Distribution of customer ages
SELECT Age,COUNT(*) as No_of_customers
FROM retail_data
GROUP BY Age
ORDER BY Age;


#Gender Distribution of Customers
SELECT Gender,COUNT(*) as Customers
FROM retail_data
GROUP BY Gender;


#Distribution of products sold
SELECT Product_Category,COUNT(*)
FROM retail_data
GROUP BY Product_Category;


#Total Revenue generated per Month
SELECT MONTH(Order_Date) AS Sales_Month,
SUM(Total_amount) AS Total_Revenue
FROM retail_data
GROUP BY Sales_Month
ORDER BY Sales_Month;


#Top selling product categories by Revenue 
SELECT Product_Category,SUM(Total_Amount) AS Revenue
FROM retail_data
GROUP BY Product_Category
ORDER BY Revenue DESC;


#Product categories and it's price per unit
SELECT Product_Category,SUM(Price_per_Unit) AS Price_per_Unit
FROM retail_data
GROUP BY Product_Category;



#TOP 5 customer ID'S with the highest total amount 
SELECT Customer_ID,Total_amount
FROM retail_data
ORDER BY Total_amount DESC
LIMIT 5;


#Avg amount spent by Age
SELECT Age,AVG(Total_Amount) AS Amount_spent
FROM retail_data
GROUP BY Age 
ORDER BY Age;


#Total Quantity of product purchased by each age group 
SELECT 
CASE 
  WHEN Age BETWEEN 18 AND 30 THEN '18-30'
  WHEN Age BETWEEN 30 AND 40 THEN '30-40'
  WHEN Age BETWEEN 40 AND 50 THEN '40-50'
 ELSE 'Above 50'
 END AS Age_Group,
 SUM(Quantity) AS Total_Quantity
 FROM retail_data
 GROUP BY Age_Group;
 
 
 #Total Quantity sales over different months
 SELECT MONTH(Order_Date) AS Sales_Month,
 SUM(Quantity) AS Total_Sales
 FROM retail_data
 GROUP BY Sales_Month
 ORDER BY Sales_Month;
 
 
 #Relationship between gender and spending 
 SELECT Gender,SUM(Total_Amount) Total_spending,
 SUM(Total_Amount)/(SELECT SUM(Total_Amount) FROM retail_data)*100 AS spending_percentage
 FROM retail_data
 GROUP BY Gender;
 
