-- PROJECT: CRM Campaign Analytics
-- ANALYSIS: Missing Customer Data
-- DATABASE: SQLite

SELECT
    customer_id,
    first_name,
    region,
    customer_segment,
    signup_date

FROM customers

WHERE
    first_name IS NULL
    OR TRIM(first_name) = ''

    OR region IS NULL
    OR TRIM(region) = ''

    OR customer_segment IS NULL
    OR TRIM(customer_segment) = ''

    OR signup_date IS NULL
    OR TRIM(signup_date) = ''

ORDER BY customer_id;