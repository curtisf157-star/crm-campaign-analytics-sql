-- CRM Campaign Analytics
-- Check for invalid customer references

SELECT
    ca.activity_id,
    ca.customer_id,
    ca.campaign_name,
    ca.contact_date,
    ca.response_status
FROM campaign_activity AS ca
LEFT JOIN customers AS c
    ON ca.customer_id = c.customer_id
WHERE c.customer_id IS NULL
ORDER BY ca.activity_id;