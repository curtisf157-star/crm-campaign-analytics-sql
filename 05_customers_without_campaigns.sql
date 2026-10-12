-- Query 2: Identify Customers Without Campaign Activity

SELECT
    c.customer_id,
    c.first_name,
    c.region,
    c.customer_segment

FROM customers AS c

LEFT JOIN campaign_activity AS ca
    ON c.customer_id = ca.customer_id

WHERE ca.customer_id IS NULL

ORDER BY c.customer_id;