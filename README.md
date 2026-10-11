# CRM Campaign Analytics (SQL Portfolio Project)

## Project overview
This portfolio project uses **synthetic customer and marketing-campaign data** to demonstrate SQL skills relevant to a Graduate CRM Analyst role.

The analysis focuses on:
- Joining customer and campaign tables
- Grouping and aggregating campaign results
- Calculating response rates
- Checking data quality
- Comparing campaign performance by region and customer segment

> **Data notice:** All records in this project are fictional and generated for demonstration. They do not represent real customers or a real company's performance.

## Business questions
1. How many customers are in each region and segment?
2. How many customers were contacted by each campaign?
3. What are the response counts and response rates by campaign?
4. Which regions and segments have the highest response rates?
5. Are there duplicate customer IDs, missing fields, or invalid campaign statuses?

## Tools
- SQL (SQLite-compatible syntax)
- SQLite for running the queries
- GitHub for version control and portfolio presentation

## Repository structure
```text
crm-campaign-analytics-sql/
├── data/
│   └── README.md
├── reports/
│   └── README.md
├── sql/
│   ├── 01_create_tables.sql
│   ├── 02_insert_sample_data.sql
│   └── 03_analysis_queries.sql
└── README.md
```

## How to run
1. Install or open a SQLite-compatible SQL editor (for example, SQLiteStudio or DB Browser for SQLite), or use the SQLite extension in VS Code.
2. Create a database named `crm_campaigns.db`.
3. Run `sql/01_create_tables.sql`.
4. Run `sql/02_insert_sample_data.sql`.
5. Run individual queries from `sql/03_analysis_queries.sql`.

Run the scripts in the order shown. The SQL uses SQLite-compatible syntax and should also be straightforward to adapt to other SQL engines.

## Key metric definition
**Campaign response rate** = number of responding campaign records / number of campaign records × 100.

This version counts campaign records, not unique people. If one customer can appear more than once in a campaign, the metric should be adjusted to count distinct customer IDs.

## Suggested next improvements
- Add a data dictionary
- Add more realistic edge cases for quality checks
- Compare results by campaign and customer segment
- Export query outputs and build an Excel or Power BI report
- Add screenshots of executed queries and results

## Portfolio integrity
Do not describe synthetic data as real customer data or claim that this project was completed for a client. Explain that it is a self-directed portfolio project.
