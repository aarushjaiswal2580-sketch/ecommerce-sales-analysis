
use ecommerce_analysis;

SET GLOBAL local_infile = 1;





SHOW VARIABLES LIKE 'local_infile';
LOAD DATA LOCAL INFILE
'C:/Users/hp/Downloads/superstore_mysql_import_ready.csv'
INTO TABLE superstore
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


-- Total Sales
SELECT
    SUM(Sales) AS Total_Sales
FROM superstore;

-- Total Profit

SELECT
    SUM(Profit) AS Total_Profit
FROM superstore;

-- Sales by Category
SELECT
    Category,
    SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Category
ORDER BY Total_Sales DESC;

-- Profit by Region
SELECT
    Region,
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Region
ORDER BY Total_Profit DESC;

-- Top 10 Customers
SELECT
    `Customer Name`,
    SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY `Customer Name`
ORDER BY Total_Sales DESC
LIMIT 10;

-- Top 10 Products
SELECT
    `Product Name`,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 10;


