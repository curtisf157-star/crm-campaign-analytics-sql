# CRM Campaign Analytics | SQL, Python, Excel & Power BI

## Project Overview

An end-to-end CRM analytics portfolio project demonstrating customer segmentation, marketing campaign performance analysis, data validation and business intelligence reporting.

The project uses a synthetic customer dataset to simulate analytical tasks performed by CRM and marketing data analysts.

**Tools:** SQL, SQLite, Python, Excel, Power BI and GitHub.

**Project type:** Independent data analytics portfolio project.

**Data source:** Synthetic customer and campaign data created for educational purposes.

## Business Objectives

The project addresses five business questions:

1. How effectively do marketing campaigns engage customers?
2. Which customer segments produce the highest response rates?
3. How does marketing performance vary between campaigns?
4. Are there data-quality problems affecting customer records?
5. Are customers included in campaign activity after previously opting out?

## Dataset

The project contains:

* 12 fictional customers.
* 18 campaign activity records.
* 3 marketing campaigns.
* 3 customer segments.
* 4 UK geographical regions.

All data is fictional and does not contain real customer information.

## Technical Methodology

### SQL Database Development

Created a relational SQLite database containing customer and marketing campaign activity tables.

Used SQL to perform:

* Data extraction and filtering.
* INNER JOIN and LEFT JOIN operations.
* Customer segmentation.
* Aggregation and response-rate calculations.
* Duplicate-combination detection.
* Missing-value validation.
* Referential-integrity checks.
* Self-joins to investigate activity after opt-out events.

### Python Automation

Developed Python scripts to execute SQL queries and export results to CSV files.

Used Python's built-in SQLite and CSV modules to support reproducible data extraction.

### Excel Reporting

Prepared an Excel reporting workflow covering campaign performance, customer segmentation, data quality and business KPIs.

## Power BI Dashboard

### CRM Overview

![CRM Overview](screenshots/01_crm_overview.png)

### Customer Segmentation

![Customer Segmentation](screenshots/02_customer_segmentation.png)

### Campaign Performance

![Campaign Performance](screenshots/03_campaign_performance.png)

### Data Quality

![Data Quality](screenshots/04_data_quality.png)

## Key Findings

The original synthetic dataset produces the following expected findings:

| Metric                                             | Result |
| -------------------------------------------------- | -----: |
| Total Customers                                    |     12 |
| Campaign Activity Records                          |     18 |
| Marketing Campaigns                                |      3 |
| Total Responses                                    |      9 |
| Overall Response Rate                              |    50% |
| Loyal Segment Response Rate                        |    75% |
| New Segment Response Rate                          |    40% |
| At Risk Segment Response Rate                      |    20% |
| Records with Opt-Out Status                        |      2 |
| Customers Flagged for Later Activity After Opt-Out |      1 |

These figures must be validated against executed query results before being presented as final findings.

## Business Recommendations

The analysis demonstrates how businesses can use customer data to:

* Monitor marketing engagement.
* Compare campaign outcomes.
* Identify customers requiring further analysis.
* Improve data validation processes.
* Review marketing consent and suppression records.

The project highlights the importance of checking data accuracy before making business decisions.

## Limitations

The dataset is synthetic and small.

Results demonstrate analytical techniques rather than statistically reliable evidence of customer behaviour.

The dataset does not contain detailed marketing-consent histories or communication channels.

Activity recorded after an opt-out should be investigated but does not automatically establish a legal violation.

## Skills Demonstrated

**SQL:** JOINs, aggregations, filtering, conditional logic and data validation.

**Python:** Database connectivity, query execution and CSV export automation.

**Excel:** Spreadsheet reporting, formulas, charting and KPI analysis.

**Power BI:** Data modelling, DAX measures, interactive dashboards and business intelligence reporting.

**GitHub:** Version control, project documentation and reproducibility.

## How to Reproduce

1. Download or clone the repository.
2. Open the project folder in VS Code.
3. Install Python 3.
4. Run `python setup_database.py` to create the sample SQLite database.
5. Run `python export_to_csv.py` to generate analytical CSV outputs.
6. Run `python export_powerbi_data.py` to generate the underlying customer and campaign CSV files.
7. Run `python export_optout_details.py` for the opt-out investigation export.
8. Open the Excel workbook or Power BI report, if included.
9. Update local CSV source paths in Power BI if necessary, then refresh.

## Portfolio Purpose

This independent project demonstrates the application of data analytics techniques to customer relationship management, marketing performance measurement and data-quality validation.

It was developed as a technical portfolio project, not as commissioned work for a commercial client.
