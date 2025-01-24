#1 What is the total amount each customer spent at the restaurant?
SELECT customer_id, product_id, product_name, SUM(price) FROM sales
JOIN menu USING (product_id)
Group by customer_id;

#2 How many days has each customer visited the restaurant?
SELECT customer_id, count(order_date) FROM sales
GROUP BY customer_id;

#3 What was the first item from the menu purchased by each customer?
Select customer_id, min(order_date) as first_order, 
	   product_id, product_name from sales
JOIN menu USING (product_id)
Group by customer_id;

#4 What is the most purchased item on the menu and how many times was it purchased by all customers?
Select  product_name, count(product_id) AS count from sales
JOIN menu USING (product_id)
GROUP BY product_name
ORDER BY product_id DESC LIMIT 1;

#5 Which item was the most popular for each customer?
WITH customer_purchases AS (
    SELECT customer_id, product_name,
        COUNT(product_id) AS purchase_count
    FROM sales
    JOIN menu USING(product_id)
    GROUP BY customer_id, product_name
),
ranked_purchases AS (
    SELECT customer_id, product_name, purchase_count,
	RANK() OVER (PARTITION BY customer_id 
    ORDER BY purchase_count DESC) AS ran
    FROM customer_purchases
)
SELECT customer_id, product_name, purchase_count
FROM ranked_purchases
WHERE ran = 1;

#6 Which item was purchased first by the customer after they became a member?
WITH cust_pur_aftr_mem AS (
	SELECT customer_id, order_date, product_id, product_name
    FROM sales JOIN menu USING (product_id)
    JOIN members USING (customer_id)
    WHERE order_date >= join_date
    ORDER BY customer_id, order_date), 
    first_purchase AS (
    SELECT customer_id, min(order_date) as first_order_date, product_name
    FROM cust_pur_aftr_mem GROUP BY customer_id)
SELECT customer_id, product_name, first_order_date
FROM first_purchase ORDER BY customer_id;

#7 Which item was purchased just before the customer became a member?
WITH cust_pur_before_mem AS (
	SELECT customer_id, order_date, product_id, product_name
    FROM sales JOIN menu USING (product_id)
    JOIN members USING (customer_id)
    WHERE order_date < join_date
    ORDER BY customer_id, order_date), 
    last_non_mem_purchase AS (
    SELECT customer_id, max(order_date) as last_order_date, product_name
    FROM cust_pur_before_mem GROUP BY customer_id)
SELECT customer_id, product_name, last_order_date
FROM last_non_mem_purchase ORDER BY customer_id;

#8 What is the total items and amount spent for each member before they became a member?
WITH cust_pur_before_mem AS (
	SELECT customer_id, order_date, product_id, product_name, price
    FROM sales JOIN menu USING (product_id)
    JOIN members USING (customer_id)
    WHERE order_date < join_date
    ORDER BY customer_id, order_date), 
    total_items AS (
    SELECT customer_id, order_date,product_name, count(product_id) as total_item, sum(price) as total_amt
    FROM cust_pur_before_mem GROUP BY customer_id)
SELECT customer_id, total_item, total_amt
FROM total_items ORDER BY customer_id;

#9 If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
WITH purchase_points AS (
    SELECT customer_id, product_name, price,
        CASE
		WHEN product_name = 'sushi' THEN price*10*2
		ELSE price*10
        END AS points
    FROM sales JOIN menu USING(product_id))
SELECT customer_id, SUM(points) AS total_points
FROM purchase_points GROUP BY customer_id;

#10 In the first week after a customer joins the program (including their join date) they earn 2x points on all items, 
# not just sushi - how many points do customer A and B have at the end of January?
WITH purchase_points AS (
    SELECT customer_id, product_name, price,
        CASE
		WHEN order_date >= join_date THEN price*10*2
		ELSE price*10
        END AS points
    FROM sales 
    JOIN menu USING(product_id)
    JOIN members USING (customer_id))
SELECT customer_id, SUM(points) AS total_points
FROM purchase_points GROUP BY customer_id 
ORDER BY customer_id;