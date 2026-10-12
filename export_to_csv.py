# CRM Campaign Analytics
# Step 7: Export SQL Analysis to CSV
# Tools: Python, SQLite, CSV
# Data: Synthetic customer and campaign records

import sqlite3
import csv
from pathlib import Path

# --------------------------------------------------
# 1. Set up project directories
# --------------------------------------------------

BASE_DIR = Path(__file__).resolve().parent

DB_PATH = BASE_DIR / "data" / "crm_campaigns.db"

EXPORT_DIR = BASE_DIR / "exports"

EXPORT_DIR.mkdir(exist_ok=True)

# Prevent SQLite from creating an empty database
if not DB_PATH.is_file():
    raise FileNotFoundError(
        f"Database not found: {DB_PATH}\n"
        "Check the database location before continuing."
    )

# --------------------------------------------------
# 2. Define SQL analysis queries
# --------------------------------------------------

QUERIES = {

    "campaign_performance.csv": """
        SELECT
            campaign_name,

            COUNT(*) AS total_contacts,

            SUM(
                CASE
                    WHEN response_status = 'Responded'
                    THEN 1 ELSE 0
                END
            ) AS total_responses,

            SUM(
                CASE
                    WHEN response_status = 'Opted Out'
                    THEN 1 ELSE 0
                END
            ) AS opt_outs,

            ROUND(
                100.0 *
                SUM(
                    CASE
                        WHEN response_status = 'Responded'
                        THEN 1 ELSE 0
                    END
                ) / NULLIF(COUNT(*), 0),
                2
            ) AS response_rate_pct

        FROM campaign_activity

        GROUP BY campaign_name

        ORDER BY campaign_name;
    """,

    "customer_segmentation.csv": """
        SELECT
            c.customer_segment,

            COUNT(DISTINCT c.customer_id)
                AS total_customers,

            COUNT(*) AS campaign_contacts,

            SUM(
                CASE
                    WHEN ca.response_status = 'Responded'
                    THEN 1 ELSE 0
                END
            ) AS total_responses,

            ROUND(
                100.0 *
                SUM(
                    CASE
                        WHEN ca.response_status = 'Responded'
                        THEN 1 ELSE 0
                    END
                ) / NULLIF(COUNT(*), 0),
                2
            ) AS response_rate_pct

        FROM customers AS c

        INNER JOIN campaign_activity AS ca
            ON c.customer_id = ca.customer_id

        GROUP BY c.customer_segment

        ORDER BY response_rate_pct DESC;
    """,

    "data_quality_summary.csv": """
        SELECT
            'Missing Customer Data' AS quality_check,
            COUNT(*) AS issues_found
        FROM customers
        WHERE first_name IS NULL
           OR TRIM(first_name) = ''
           OR region IS NULL
           OR TRIM(region) = ''
           OR customer_segment IS NULL
           OR TRIM(customer_segment) = ''
           OR signup_date IS NULL
           OR TRIM(signup_date) = ''

        UNION ALL

        SELECT
            'Repeated Customer-Campaign Combinations',
            COUNT(*)
        FROM (
            SELECT customer_id, campaign_name
            FROM campaign_activity
            GROUP BY customer_id, campaign_name
            HAVING COUNT(*) > 1
        )

        UNION ALL

        SELECT
            'Invalid Customer References',
            COUNT(*)
        FROM campaign_activity AS ca
        LEFT JOIN customers AS c
            ON ca.customer_id = c.customer_id
        WHERE c.customer_id IS NULL

        UNION ALL

        SELECT
            'Customers With Activity After Opt-Out',
            COUNT(DISTINCT previous.customer_id)
        FROM campaign_activity AS previous
        INNER JOIN campaign_activity AS later
            ON previous.customer_id = later.customer_id
        WHERE previous.response_status = 'Opted Out'
          AND later.contact_date > previous.contact_date;
    """
}

# --------------------------------------------------
# 3. Execute SQL and export CSV files
# --------------------------------------------------

with sqlite3.connect(DB_PATH) as conn:

    for filename, query in QUERIES.items():

        cursor = conn.execute(query)

        columns = [
            description[0]
            for description in cursor.description
        ]

        rows = cursor.fetchall()

        file_path = EXPORT_DIR / filename

        with open(
            file_path,
            "w",
            newline="",
            encoding="utf-8-sig"
        ) as file:

            writer = csv.writer(file)

            writer.writerow(columns)

            writer.writerows(rows)

        print(f"Exported: {filename}")
        print(f"Records: {len(rows)}")
        print("-" * 40)

print("All CRM analysis files exported successfully.")