show databases;
create database sales;
show databases;
use sales;
select * from online_sales;

-- EXTRACTING MONTH FROM order_date
SELECT order_id,order_date,
EXTRACT(MONTH FROM order_date) AS month
FROM online_sales LIMIT 10;

-- GROUPING year and month
SELECT EXTRACT(YEAR FROM order_date) AS year,
       EXTRACT(MONTH FROM order_date) AS month,
       COUNT(*) AS order_count
FROM online_sales 
GROUP BY EXTRACT(YEAR FROM order_date), 
	     EXTRACT(MONTH FROM order_date);
   
-- SUM(amount) for revenue
SELECT EXTRACT(YEAR FROM order_date) AS year,
       EXTRACT(MONTH FROM order_date) AS month,
       SUM(amount) AS total_revenue
FROM online_sales
GROUP BY  EXTRACT(YEAR FROM order_date), 
          EXTRACT(MONTH FROM order_date);
          
-- COUNT(DISTINCT order_id) for volume
SELECT  EXTRACT(YEAR FROM order_date) AS year,
        EXTRACT(MONTH FROM order_date) AS month,
        COUNT(DISTINCT order_id) AS total_orders
FROM  online_sales
GROUP BY  EXTRACT(YEAR FROM order_date), 
		  EXTRACT(MONTH FROM order_date);

-- ORDER BY for sorting
SELECT EXTRACT(YEAR FROM order_date) AS year,
	   EXTRACT(MONTH FROM order_date) AS month,
       SUM(amount) AS total_revenue,
       COUNT(DISTINCT order_id) AS total_orders
FROM online_sales
GROUP BY  EXTRACT(YEAR FROM order_date), 
		  EXTRACT(MONTH FROM order_date)
ORDER BY year ASC, month ASC;

-- Limit results to a specific time period (e.g., 2022)
SELECT  EXTRACT(YEAR FROM order_date) AS year,
		EXTRACT(MONTH FROM order_date) AS month,
		SUM(amount) AS total_revenue,
		COUNT(DISTINCT order_id) AS total_orders
FROM online_sales
WHERE order_date BETWEEN '2022-01-01' AND '2022-12-31'
GROUP BY  EXTRACT(YEAR FROM order_date), 
		  EXTRACT(MONTH FROM order_date)
ORDER BY year ASC, month ASC;
		
        
SELECT * FROM online_sales;
         