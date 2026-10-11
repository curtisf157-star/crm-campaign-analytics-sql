-- CRM Campaign Analytics
-- SQL dialect: SQLite-compatible
-- Run this script first.

PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS campaign_activity;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    region TEXT,
    customer_segment TEXT,
    signup_date TEXT
);

CREATE TABLE campaign_activity (
    activity_id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    campaign_name TEXT NOT NULL,
    contact_date TEXT,
    response_status TEXT NOT NULL
        CHECK (response_status IN ('Responded', 'No Response', 'Opted Out')),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- A customer can have multiple campaign activity records.
