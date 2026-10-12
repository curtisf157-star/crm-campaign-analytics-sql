-- CRM Campaign Performance Analysis
-- Author: CF Analytics
-- Database: SQLite

SELECT
    campaign_name,

    COUNT(*) AS total_contacts,

    SUM(
        CASE
            WHEN response_status = 'Responded'
            THEN 1
            ELSE 0
        END
    ) AS total_responses,

    SUM(
        CASE
            WHEN response_status = 'No Response'
            THEN 1
            ELSE 0
        END
    ) AS no_responses,

    SUM(
        CASE
            WHEN response_status = 'Opted Out'
            THEN 1
            ELSE 0
        END
    ) AS opt_outs,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN response_status = 'Responded'
                THEN 1
                ELSE 0
            END
        ) / NULLIF(COUNT(*), 0),
        2
    ) AS response_rate

FROM campaign_activity

GROUP BY campaign_name

ORDER BY response_rate DESC, campaign_name;