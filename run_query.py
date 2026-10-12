import sqlite3
from pathlib import Path

# Project directory
BASE_DIR = Path(__file__).resolve().parent

# Database location
DB_PATH = BASE_DIR / "data" / "crm_campaigns.db"

# SQL query file
SQL_FILE = BASE_DIR / "sql" / "12_optout_followup_check.sql"
# Check database exists
if not DB_PATH.exists():
    raise FileNotFoundError(
        f"Database not found: {DB_PATH}\n"
        "Run setup_database.py first."
    )

# Read SQL query
query = SQL_FILE.read_text(encoding="utf-8")

# Connect to database
with sqlite3.connect(DB_PATH) as conn:

    cursor = conn.execute(query)

    # Retrieve column names
    columns = [description[0] for description in cursor.description]

    # Retrieve records
    rows = cursor.fetchall()

    print("\nCRM CAMPAIGN ANALYSIS")
    print("-" * 70)

    print(" | ".join(columns))
    print("-" * 70)

    for row in rows:
        print(" | ".join(str(value) for value in row))

    print("-" * 70)
    print(f"Total records: {len(rows)}")