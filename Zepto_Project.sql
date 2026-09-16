DROP TABLE IF EXISTS Zepto;

CREATE TABLE Zepto(
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(100) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INT,
discountSellingPrice NUMERIC(5,2),
weightInGms INT,
outOfStock BOOLEAN,
quantitY INT
);

ALTER TABLE Zepto 
ALTER COLUMN discountPercent TYPE NUMERIC(10,2),
ALTER COLUMN discountSellingPrice TYPE NUMERIC(10,2);

SELECT * FROM Zepto;

--                         DATA EXPLORATION:

-- Count of rows:
SELECT COUNT(*) FROM Zepto;

-- Null values:
SELECT * FROM Zepto
WHERE category IS NULL OR name IS NULL OR mrp IS NULL OR discountpercent IS NULL OR
availablequantity IS NULL OR weightingms IS NULL OR outofstock IS NULL OR quantity IS NULL;

-- Product categories:
SELECT DISTINCT category FROM Zepto ORDER BY category;

-- Products stock status:
SELECT outofstock, COUNT(sku_id) FROM Zepto
GROUP BY outofstock;

-- Product names present multiple time:
SELECT name, COUNT(sku_id) AS no_of_time FROM Zepto
GROUP BY name
HAVING COUNT(sku_id) > 1
ORDER BY no_of_time DESC;


--                        DATA CLEANING:

-- Removing rows where prices are 0:
SELECT * FROM Zepto
WHERE mrp = 0 OR discountsellingprice = 0;

DELETE FROM Zepto
WHERE mrp = 0;

-- Converting paise to rupees:
UPDATE Zepto
SET mrp = mrp/100.0,
discountsellingprice = discountsellingprice/100.0;

SELECT * FROM Zepto;

--                   IMPORTANT BUSINESS QUESTIONS:

-- Q1.Find the top 10 best-value products based on the discount percentage.
SELECT DISTINCT name,discountpercent FROM Zepto
ORDER BY discountpercent DESC
LIMIT 10;

-- Q2.Which are the products with high MRP but out of stock.
SELECT DISTINCT name,mrp FROM Zepto
WHERE outofstock = 'true' AND mrp > 300
ORDER BY mrp DESC;

-- Q3.Calculate estimated revenue for each caegory.
SELECT category, SUM(discountsellingprice * availablequantity) AS total_revenue FROM Zepto
GROUP BY category
ORDER BY total_revenue DESC;

-- Q4.Find all products where MRP is greater than ₹500 and discount is less than 10%.
SELECT DISTINCT name, mrp, discountpercent FROM Zepto
WHERE mrp > 500 AND discountpercent < 10
ORDER BY mrp DESC, discountpercent DESC;

-- Q5.Identify the top 5 categories offering the highest avg discount percentage.
SELECT category, ROUND(AVG(discountpercent),2) AS Avg_discount FROM Zepto
GROUP BY category
ORDER BY Avg_discount DESC
LIMIT 5;

-- Q6.Find the price per gram for products above 100g and sort by best value.
SELECT DISTINCT name, weightingms, discountsellingprice,
ROUND((discountsellingprice/weightingms),2) AS pricepergms FROM Zepto
WHERE weightingms > 100 
ORDER BY pricepergms;

-- Q7.Group the products into categories like Low, Medium, Bulk.
SELECT DISTINCT name, quantity,
                CASE 
			       WHEN quantity >= 500 THEN 'Bulk'
				   WHEN quantity >= 100 THEN 'Medium'
				   ELSE 'Low'
			    END AS quantity_category
FROM Zepto
ORDER BY quantity DESC; 

-- Q8.What is the total inventory weight per category.
SELECT DISTINCT category, SUM(weightingms * availablequantity) AS total_weight FROM Zepto
GROUP BY category
ORDER BY total_weight DESC;