-- Query 1: Customer Campaign Activity

SELECT
    c.customer_id,
    c.first_name,
    c.region,
    c.customer_segment,
    ca.campaign_name,
    ca.response_status

FROM customers AS c

INNER JOIN campaign_activity AS ca
    ON c.customer_id = ca.customer_id

ORDER BY c.customer_id;