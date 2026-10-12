-- Identify customer segments with
-- at least five campaign contacts
-- and at least two responses.

SELECT
    c.customer_segment,

    COUNT(*) AS total_contacts,

    SUM(
        CASE
            WHEN ca.response_status = 'Responded'
            THEN 1
            ELSE 0
        END
    ) AS total_responses

FROM customers AS c

INNER JOIN campaign_activity AS ca
    ON c.customer_id = ca.customer_id

GROUP BY c.customer_segment

HAVING
    COUNT(*) >= 5
    AND
    SUM(
        CASE
            WHEN ca.response_status = 'Responded'
            THEN 1
            ELSE 0
        END
    ) >= 2

ORDER BY total_responses DESC;