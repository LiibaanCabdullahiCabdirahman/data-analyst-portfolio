-- Liibaan Data Analyst Portfolio
-- Synthetic practice dataset: no real customer information.

-- 1. Total revenue
SELECT ROUND(SUM(Unit_Price * Quantity), 2) AS total_revenue
FROM sales;

-- 2. Revenue by product
SELECT Product,
       SUM(Quantity) AS units_sold,
       ROUND(SUM(Unit_Price * Quantity), 2) AS revenue
FROM sales
GROUP BY Product
ORDER BY revenue DESC;

-- 3. Revenue by customer
SELECT c.Customer_Name,
       c.City,
       ROUND(SUM(s.Unit_Price * s.Quantity), 2) AS customer_revenue
FROM customers c
JOIN sales s ON c.Customer_ID = s.Customer_ID
GROUP BY c.Customer_ID, c.Customer_Name, c.City
ORDER BY customer_revenue DESC;

-- 4. Orders by city
SELECT c.City,
       COUNT(DISTINCT s.Order_ID) AS orders
FROM customers c
JOIN sales s ON c.Customer_ID = s.Customer_ID
GROUP BY c.City
ORDER BY orders DESC;

-- 5. Average order value
SELECT ROUND(AVG(Unit_Price * Quantity), 2) AS average_order_value
FROM sales;
