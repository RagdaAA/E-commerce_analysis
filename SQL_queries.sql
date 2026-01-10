--1) What were the order counts, sales, and AOV for Macbooks sold in North America for each quarter across all years?  
------Joined the customers table on to the orders table in order to identify which orders were placed by cutomers in region NA
SELECT distinct (product_name)
FROM core.orders;

SELECT 
date_trunc (purchase_ts, quarter) AS Quarter,
COUNT (orders.id) AS nr_of_orders,
round (sum (usd_price),2) AS sales,
round (avg(usd_price),2) AS aov
FROM core.orders
LEFT JOIN core.customers
  ON customers.id = orders.customer_id
LEFT JOIN core.geo_lookup
  ON customers.country_code = geo_lookup.country_code
WHERE LOWER (product_name) LIKE 'macbook%'
AND LOWER (region) = 'na'
GROUP BY 1
ORDER BY 1 DESC;


--2)For products purchased in 2022 on the website or products purchased on mobile in any year, which region has the average highest time to deliver? 
----Output shows delvery times for website specifically for the year 2022. AS WELL AS mobile puchases for all years. 
----Time is based on difference in days between puchase and delivery. I will join orders to order_status to customers to geo_lookup to get all information needed.

SELECT 
  geo_lookup.region AS region,
round (avg (date_diff (order_status.delivery_ts, order_status.purchase_ts, DAY)),2) AS days_to_deliver
  FROM core.order_status
LEFT JOIN core.orders
  ON order_status.order_id = orders.id
LEFT JOIN core.customers
  ON customers.id = orders.customer_id
LEFT JOIN core.geo_lookup
  ON geo_lookup.country_code = customers.country_code
WHERE orders.purchase_platform LIKE '%mobile%'
OR (orders.purchase_platform ='website' AND extract (year FROM order_status.purchase_ts) = 2022)
GROUP BY 1
ORDER BY 2 desc;


--3) What was the refund rate and refund count for each product overall?
----Refund rate was calculted with a helper column based on the count of refund for each product. 
SELECT
CASE product_name
  WHEN '27in"" 4k gaming monitor' THEN '27in 4k gaming monitor'
  ELSE product_name
END AS products,
COUNT (order_id) AS count_orders,
COUNT (refund_ts) AS nr_of_refunds,
ROUND (((COUNT (refund_ts)) / (COUNT (order_id))*100),2) AS refund_rate
FROM core.order_status
LEFT JOIN core.orders
  ON order_status.order_id = orders.id
GROUP BY 1
ORDER BY 4 DESC;


--4) Within each region, what is the most popular product? 
----Popular product is based on nr of orders.  Orders table joined to customers table and again joined to geo_lookup. These 3 tables have the info needed to extact nr of orders, product_name as well as region. 
--STEP 1 - need clean product_name, nr of orders, sorted by region. 
--STEP 2 - turn above output into a CTE and do a rank window function.
--STEP 3 - use above as subquery and the output will show only where the region_rank equals 1.

WITH sales_per_region AS (
SELECT
geo_lookup.region AS region,
CASE
  WHEN product_name = '27in"" 4k gaming monitor' THEN '27in 4K gaming monitor' ELSE product_name 
END AS product_clean,
COUNT (orders.id) AS count_orders
FROM core.orders
LEFT JOIN core.customers
ON orders.customer_id = customers.id
LEFT JOIN core.geo_lookup
ON customers.country_code = geo_lookup.country_code
WHERE region IS NOT NULL
GROUP BY 1,2
),

ranked_orders AS (
SELECT *,
  RANK() OVER (PARTITION BY sales_per_region.region ORDER BY count_orders DESC) AS region_rank
FROM sales_per_region)

SELECT *
FROM ranked_orders
WHERE region_rank = 1




--5) How does the time to make a purchase differ between loyalty customers vs. non-loyalty customers?
----Time to purchase is based on the days or months between purchase timestamp and customer created timestamp. Orders table joined on to customers table

SELECT
loyalty_program AS is_loyalty,
ROUND (AVG (DATE_DIFF(purchase_ts, created_on, DAY)),2) AS days_to_purchase,
ROUND (AVG (DATE_DIFF(purchase_ts, created_on, MONTH)),2) AS months_to_purchase
FROM core.orders
LEFT JOIN core.customers
	ON orders.customer_id = customers.id
GROUP BY 1;




