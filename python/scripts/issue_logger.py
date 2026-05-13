import sys
import os

sys.path.append(
    os.path.abspath(
        os.path.join(os.path.dirname(__file__), '..')
    )
)

from utils.database_connection import create_connection


connection = create_connection()

cursor = connection.cursor()


insert_issue_query = """
INSERT INTO data_quality_issues (
    rule_id,
    dataset_id,
    issue_description,
    affected_record_count,
    issue_status
)
VALUES (%s, %s, %s, %s, %s)
"""


issue_data = (
    1,
    1,
    "Customer records contain NULL email values",
    2,
    "Open"
)


cursor.execute(insert_issue_query, issue_data)

connection.commit()

print("Issue logged successfully")


cursor.close()
connection.close()