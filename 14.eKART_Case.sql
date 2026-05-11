Namastekart, an e-commerce company, has observed a notable surge in return orders recently. They suspect that a specific group of customers may be responsible for a significant portion of these returns. To address this issue, their initial goal is to identify customers who have returned more than 50% of their orders. This way, they can proactively reach out to these customers to gather feedback.

 

Write an SQL to find list of customers along with their return percent (Round to 2 decimal places), display the output in ascending order of customer name.

Table: orders (primary key : order_id)

+---------------+-------------+

| COLUMN_NAME | DATA_TYPE |

+---------------+-------------+

| customer_name | varchar(10) |

| order_date | date |

| order_id | int |

| sales | int |

+---------------+-------------+

Table: returns (primary key : order_id)

+-------------+-----------+

| COLUMN_NAME | DATA_TYPE |

+-------------+-----------+

| order_id | int |

| return_date | date |

+-------------+-----------+



Solution : 



WITH CTE AS(
SELECT orders.customer_name, COUNT(orders.order_id) AS NO_OF_ORDERS,COUNT(RETURNS.order_id) AS NO_OF_RETURNS FROM [dbo].[orders]
LEFT JOIN [dbo].[returns]
ON orders.order_id = returns.order_id
GROUP BY orders.customer_name)

SELECT CUSTOMER_NAME, ROUND((NO_OF_RETURNS * 100.0 / NO_OF_ORDERS ),2) AS RET_PER
FROM cte WHERE (NO_OF_RETURNS * 100.0 / NO_OF_ORDERS ) > 50
ORDER BY CUSTOMER_NAME
