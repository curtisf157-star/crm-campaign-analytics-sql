-- CRM Campaign Analytics
-- Run one query block at a time and inspect the results.

-- Q1. Inspect campaign activity with customer attributes.
-- Demonstrates INNER JOIN.
SELECT
    ca.activity_id,
    c.customer_id,
    c.region,
    c.customer_segment,
    ca.campaign_name,
    ca.contact_date,
    ca.response_status
FROM campaign_activity AS ca
INNER JOIN customers AS c
    ON ca.customer_id = c.customer_id
ORDER BY ca.campaign_name, ca.activity_id;


-- Q2. Count customers by region and segment.
-- Demonstrates GROUP BY and COUNT.
SELECT
    region,
    customer_segment,
    COUNT(*) AS customer_count
FROM customers
GROUP BY region, customer_segment
ORDER BY region, customer_segment;


-- Q3. Campaign volume, response count, opt-outs, and response rate.
-- The response rate uses all campaign activity records as the denominator.
SELECT
    campaign_name,
    COUNT(*) AS activity_records,
    SUM(CASE WHEN response_status = 'Responded' THEN 1 ELSE 0 END) AS responses,
    SUM(CASE WHEN response_status = 'Opted Out' THEN 1 ELSE 0 END) AS opt_outs,
    ROUND(
        100.0 * SUM(CASE WHEN response_status = 'Responded' THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS response_rate_pct
FROM campaign_activity
GROUP BY campaign_name
ORDER BY response_rate_pct DESC;


-- Q4. Response rate by region and campaign.
SELECT
    c.region,
    ca.campaign_name,
    COUNT(*) AS activity_records,
    SUM(CASE WHEN ca.response_status = 'Responded' THEN 1 ELSE 0 END) AS responses,
    ROUND(
        100.0 * SUM(CASE WHEN ca.response_status = 'Responded' THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS response_rate_pct
FROM campaign_activity AS ca
INNER JOIN customers AS c
    ON ca.customer_id = c.customer_id
GROUP BY c.region, ca.campaign_name
ORDER BY c.region, response_rate_pct DESC;


-- Q5. Response rate by customer segment.
SELECT
    c.customer_segment,
    COUNT(*) AS activity_records,
    SUM(CASE WHEN ca.response_status = 'Responded' THEN 1 ELSE 0 END) AS responses,
    ROUND(
        100.0 * SUM(CASE WHEN ca.response_status = 'Responded' THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0),
        2
    ) AS response_rate_pct
FROM campaign_activity AS ca
INNER JOIN customers AS c
    ON ca.customer_id = c.customer_id
GROUP BY c.customer_segment
ORDER BY response_rate_pct DESC;


-- Q6. Find customers contacted more than once.
SELECT
    customer_id,
    COUNT(*) AS campaign_contacts
FROM campaign_activity
GROUP BY customer_id
HAVING COUNT(*) > 1
ORDER BY campaign_contacts DESC, customer_id;


-- Q7. Data quality check: missing optional customer attributes.
SELECT
    customer_id,
    first_name,
    region,
    customer_segment,
    signup_date
FROM customers
WHERE region IS NULL
   OR TRIM(region) = ''
   OR customer_segment IS NULL
   OR TRIM(customer_segment) = ''
   OR signup_date IS NULL
   OR TRIM(signup_date) = '';


-- Q8. Data quality check: campaign records with missing dates.
SELECT *
FROM campaign_activity
WHERE contact_date IS NULL
   OR TRIM(contact_date) = '';


-- Q9. Validate that every campaign activity record has a matching customer.
-- With foreign keys enforced, this should return zero rows.
SELECT ca.*
FROM campaign_activity AS ca
LEFT JOIN customers AS c
    ON ca.customer_id = c.customer_id
WHERE c.customer_id IS NULL;


-- Q10. Count outcomes across all campaign records.
SELECT
    response_status,
    COUNT(*) AS record_count
FROM campaign_activity
GROUP BY response_status
ORDER BY record_count DESC;
