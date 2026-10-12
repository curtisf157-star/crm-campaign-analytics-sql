# CRM Campaign Analytics — Data Quality Report

## Project Objective

Evaluate the quality of synthetic CRM customer and
campaign data using SQL.

## Dataset

- 12 customer records
- 18 campaign activity records
- 3 marketing campaigns

All data is synthetic and used for portfolio demonstration.

## Data Quality Tests

### 1. Missing Customer Data

Method:
SQL IS NULL and TRIM checks.

Expected findings:
0 records with missing or blank values in the fields tested.

### 2. Duplicate Campaign Records

Method:
GROUP BY customer_id and campaign_name,
with HAVING COUNT(*) > 1.

Expected findings:
0 repeated customer-campaign combinations.

### 3. Invalid Customer References

Method:
LEFT JOIN between campaign activity and customers.

Expected findings:
0 unmatched customer references.

### 4. Marketing Activity After Opt-Out

Method:
Self-join on campaign activity with date comparison.

Expected findings:
1 customer with activity recorded after an earlier opt-out.

Customer ID: 1006

## Business Interpretation

The dataset passes the selected missing-value,
duplicate-combination and referential-integrity checks.

One record requires further investigation because
campaign activity occurred after an earlier opt-out.

The scope of the opt-out must be verified before
determining whether the later activity was inappropriate.

## Limitations

- The dataset is synthetic.
- The dataset contains only 12 customers.
- Consent scope and marketing channels are unavailable.
- These tests do not cover every possible data-quality issue.

## Conclusion

SQL data-quality checks can help CRM teams identify
potential problems before launching marketing campaigns.

This exercise demonstrates practical applications of
SQL validation, JOINs, aggregations and self-joins.