import sqlite3
import csv
from pathlib import Path

# Locate project folders
BASE_DIR = Path(__file__).resolve().parent

DB_PATH = BASE_DIR / "data" / "crm_campaigns.db"

EXPORT_DIR = BASE_DIR / "exports"

EXPORT_DIR.mkdir(exist_ok=True)

# Check database exists
if not DB_PATH.is_file():
    raise FileNotFoundError(
        f"Database not found: {DB_PATH}"
    )

# Tables to export
TABLES = {
    "customers": "customers.csv",
    "campaign_activity": "campaign_activity.csv"
}

# Connect to SQLite
with sqlite3.connect(DB_PATH) as conn:

    for table_name, file_name in TABLES.items():

        query = f"SELECT * FROM {table_name}"

        cursor = conn.execute(query)

        columns = [
            description[0]
            for description in cursor.description
        ]

        rows = cursor.fetchall()

        output_path = EXPORT_DIR / file_name

        with open(
            output_path,
            "w",
            newline="",
            encoding="utf-8-sig"
        ) as file:

            writer = csv.writer(file)

            writer.writerow(columns)

            writer.writerows(rows)

        print(f"Exported: {file_name}")
        print(f"Records: {len(rows)}")

print("Power BI data export complete.")