-- PROJECT: CRM Campaign Analytics
-- ANALYSIS: Duplicate Campaign Detection

SELECT
    customer_id,
    campaign_name,

    COUNT(*) AS record_count

FROM campaign_activity

GROUP BY
    customer_id,
    campaign_name

HAVING COUNT(*) > 1

ORDER BY record_count DESC;