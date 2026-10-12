import sqlite3
import csv
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent

DB_PATH = BASE_DIR / "data" / "crm_campaigns.db"

SQL_PATH = BASE_DIR / "sql" / "12_optout_followup_check.sql"

EXPORT_DIR = BASE_DIR / "exports"

EXPORT_DIR.mkdir(exist_ok=True)

OUTPUT_PATH = EXPORT_DIR / "optout_investigation.csv"

# Verify input files
if not DB_PATH.is_file():
    raise FileNotFoundError(
        f"Database not found: {DB_PATH}"
    )

if not SQL_PATH.is_file():
    raise FileNotFoundError(
        f"SQL file not found: {SQL_PATH}"
    )

# Read SQL query
query = SQL_PATH.read_text(encoding="utf-8")

# Execute query
with sqlite3.connect(DB_PATH) as conn:

    cursor = conn.execute(query)

    columns = [
        description[0]
        for description in cursor.description
    ]

    rows = cursor.fetchall()

# Export results
with open(
    OUTPUT_PATH,
    "w",
    newline="",
    encoding="utf-8-sig"
) as file:

    writer = csv.writer(file)

    writer.writerow(columns)

    writer.writerows(rows)

print(f"Exported: {OUTPUT_PATH.name}")
print(f"Records: {len(rows)}")
print("Opt-out investigation export complete.")