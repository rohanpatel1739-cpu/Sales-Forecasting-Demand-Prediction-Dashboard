-- CREATE TABLE QUERY
CREATE TABLE sales_forecasting (
    Order_ID VARCHAR(20),
    Order_Date DATE,
    Month VARCHAR(20),
    Quarter VARCHAR(5),
    Year INT,
    Week_Number INT,
    Region VARCHAR(50),
    City VARCHAR(50),
    Product_Category VARCHAR(100),
    Product_Name VARCHAR(100),
    Units_Sold INT,
    Unit_Price NUMERIC(12,2),
    Discount_Percentage NUMERIC(5,2),
    Sales_Amount NUMERIC(15,2),
    Marketing_Spend NUMERIC(15,2),
    Stock_Available INT,
    Reorder_Level INT,
    Previous_Month_Sales NUMERIC(15,2),
    Forecasted_Sales NUMERIC(15,2),
    Actual_Sales NUMERIC(15,2),
    Forecast_Error_Percentage NUMERIC(8,2),
    Demand_Level VARCHAR(50),
    Stock_Risk VARCHAR(50),
    Season VARCHAR(50)
);

-- VERIFY IMPORT 
SELECT *
FROM sales_forecasting
LIMIT 10;

-- COUNT OF ROWS
SELECT COUNT(*)
FROM sales_forecasting;

-- -- Total Sales

SELECT
ROUND(SUM(Sales_Amount),2) AS Total_Sales
FROM sales_forecasting;

-- -- Total Units Sold

SELECT
SUM(Units_Sold) AS Total_Units_Sold
FROM sales_forecasting;

-- -- Region Performance

SELECT
Region,
ROUND(SUM(Sales_Amount),2) AS Revenue
FROM sales_forecasting
GROUP BY Region
ORDER BY Revenue DESC;

-- PRODUCT PERFORMANCE
SELECT Product_Category,
ROUND(SUM(Sales_Amount),2) AS Revenue
FROM sales_forecasting
GROUP BY Product_Category
ORDER BY Revenue DESC;

-- PRODUCT DEMAND ANALYSIS
SELECT
Product_Name,
SUM(Units_Sold) AS Demand
FROM sales_forecasting
GROUP BY Product_Name
ORDER BY Demand DESC
LIMIT 10;

-- SEASONAL ANALYSIS
SELECT
Season,
ROUND(SUM(Sales_Amount),2) AS Revenue
FROM sales_forecasting
GROUP BY Season
ORDER BY Revenue DESC;

-- Forecast Accuracy
SELECT
ROUND(
AVG(Forecast_Error_Percentage),
2
) AS Forecast_Error
FROM sales_forecasting;