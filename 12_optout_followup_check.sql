-- Project: CRM Campaign Analytics
-- Step 6.4: Marketing Activity After Opt-Out
-- Database: SQLite

SELECT
    c.customer_id,
    c.first_name,

    previous.campaign_name AS opted_out_campaign,
    previous.contact_date AS optout_date,

    later.campaign_name AS later_campaign,
    later.contact_date AS later_contact_date,
    later.response_status AS later_response

FROM customers AS c

INNER JOIN campaign_activity AS previous
    ON c.customer_id = previous.customer_id

INNER JOIN campaign_activity AS later
    ON c.customer_id = later.customer_id

WHERE
    previous.response_status = 'Opted Out'

    AND later.contact_date > previous.contact_date

ORDER BY
    c.customer_id,
    later.contact_date;