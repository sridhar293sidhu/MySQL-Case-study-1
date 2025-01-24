# MySQL-Case-study-1
8week SQL challenge - Danny's Diner case study

**Introduction**
Danny seriously loves Japanese food so in the beginning of 2021, he decides to embark upon a risky venture and opens up a cute little restaurant that sells his 3 favourite foods: sushi, curry and ramen.
Danny’s Diner is in need of your assistance to help the restaurant stay afloat - the restaurant has captured some very basic data from their few months of operation but have no idea how to use their data to help them run the business.

**Problem Statement**
Danny wants to analyze customer data to better understand their visiting patterns, spending habits, and favorite menu items. This will help him offer a more personalized experience to his loyal customers. He plans to use these insights to decide whether to expand the current loyalty program. Additionally, Danny needs help generating basic datasets for his team to inspect the data without using SQL.

**Data**
Danny has provided you with a sample of his overall customer data due to privacy issues - but he hopes that these examples are enough for you to write fully functioning SQL queries to help him answer his questions!
Danny has shared with you 3 key datasets for this case study:
A. sales - captures all customer_id level purchases with an corresponding order_date and product_id information for when and what menu items were ordered.
B. menu - maps the product_id to the actual product_name and price of each menu item.
C. members - captures the join_date when a customer_id joined the beta version of the Danny’s Diner loyalty program.

**Questions:**
1. What is the total amount each customer spent at the restaurant?
Query:
![image](https://github.com/user-attachments/assets/66638cc8-bdc7-4346-a45f-f42b0426d7bc)
Result:
![image](https://github.com/user-attachments/assets/6fde6f8f-a846-446b-985b-d5f32980d668)

2. How many days has each customer visited the restaurant?
Query:
![image](https://github.com/user-attachments/assets/6d420c19-fe9f-4e6b-be3c-6741ef8275a3)

Result:
![image](https://github.com/user-attachments/assets/f551c993-ac02-480e-b82b-664307653447)

3. What was the first item from the menu purchased by each customer?
Query:
![image](https://github.com/user-attachments/assets/5298625a-e9aa-407e-a916-329eb1ee14f3)

Result:
![image](https://github.com/user-attachments/assets/f770bc0b-7b50-4271-846a-52e70cd378c9)

4. What is the most purchased item on the menu and how many times was it purchased by all customers?
Query:
![image](https://github.com/user-attachments/assets/ce5ede34-9d88-4ac9-8d17-da79fd4aa1a0)

Result:
![image](https://github.com/user-attachments/assets/88ff7a80-a67a-40f8-86f2-581c6e040cc3)

5. Which item was the most popular for each customer?
Query:
![image](https://github.com/user-attachments/assets/fe5cde10-999f-4804-8047-2ec561577b88)

Result:
![image](https://github.com/user-attachments/assets/7dd683f6-7136-452f-a842-b2ecf2ade70a)

6. Which item was purchased first by the customer after they became a member?
Query:
![image](https://github.com/user-attachments/assets/d3bc758a-0390-4cfe-b8c9-bf52dc39655e)

Result:
![image](https://github.com/user-attachments/assets/64b4ed94-aa1b-46f8-8a98-93a35aa8ffd8)

7. Which item was purchased just before the customer became a member?
Query:
![image](https://github.com/user-attachments/assets/9b5fde04-4c75-42fb-b914-f214bab1252d)

Result:
![image](https://github.com/user-attachments/assets/5cfe557b-2a0a-420b-abaa-ef3093280a78)

8. What is the total items and amount spent for each member before they became a member?
Query:
![image](https://github.com/user-attachments/assets/ee0d8157-e824-4fec-baf4-ded134cbf724)

Result:
![image](https://github.com/user-attachments/assets/6eb7001f-f63a-4859-891c-f70b9eb7d33c)

9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
Query:
![image](https://github.com/user-attachments/assets/72672945-3984-4789-8de6-59ed0131bf35)

Result:
![image](https://github.com/user-attachments/assets/40fd5b8e-b10e-42a4-bdb4-db811130242a)

10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?
Query:
![image](https://github.com/user-attachments/assets/3e447f5c-c224-4caf-b19b-adc2db712137)

Result:
![image](https://github.com/user-attachments/assets/0ffb3641-d36a-4122-98ee-c76f09b3c2fc)

