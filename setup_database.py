
import sqlite3
from pathlib import Path

# Locate the project directory
BASE_DIR = Path(__file__).resolve().parent

# Database location
DB_PATH = BASE_DIR / "data" / "crm_campaigns.db"

# SQL scripts
SCRIPTS = [
    BASE_DIR / "sql" / "01_create_tables.sql",
    BASE_DIR / "sql" / "02_insert_sample_data.sql",
]

# Create and connect to the SQLite database
with sqlite3.connect(DB_PATH) as conn:
    conn.execute("PRAGMA foreign_keys = ON")

    for script_path in SCRIPTS:
        sql = script_path.read_text(encoding="utf-8")
        conn.executescript(sql)
        print(f"Executed: {script_path.name}")

    customer_count = conn.execute(
        "SELECT COUNT(*) FROM customers"
    ).fetchone()[0]

    campaign_count = conn.execute(
        "SELECT COUNT(*) FROM campaign_activity"
    ).fetchone()[0]

print("Database created successfully.")
print(f"Customers: {customer_count}")
print(f"Campaign records: {campaign_count}")