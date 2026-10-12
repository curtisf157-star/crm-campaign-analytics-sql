-- Project: CRM Campaign Analytics
-- Analysis: Customer Segmentation
-- Database: SQLite

SELECT
    c.customer_segment,

    COUNT(DISTINCT c.customer_id) AS total_customers,

    COUNT(*) AS total_campaign_contacts,

    SUM(
        CASE
            WHEN ca.response_status = 'Responded'
            THEN 1
            ELSE 0
        END
    ) AS total_responses,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN ca.response_status = 'Responded'
                THEN 1
                ELSE 0
            END
        ) / NULLIF(COUNT(*), 0),
        2
    ) AS response_rate_pct

FROM customers AS c

INNER JOIN campaign_activity AS ca
    ON c.customer_id = ca.customer_id

GROUP BY c.customer_segment

ORDER BY response_rate_pct DESC;