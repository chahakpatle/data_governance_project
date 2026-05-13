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


# NULL EMAIL VALIDATION

null_email_query = """
SELECT customer_id, customer_name, email
FROM customers
WHERE email IS NULL
"""

cursor.execute(null_email_query)

null_email_results = cursor.fetchall()

print("Customers with NULL emails:")

for row in null_email_results:
    print(row)


# COUNT ISSUES

null_issue_count = len(null_email_results)


# INSERT ISSUE INTO GOVERNANCE TABLE

if null_issue_count > 0:

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
        null_issue_count,
        "Open"
    )

    cursor.execute(insert_issue_query, issue_data)

    connection.commit()

    print("\nNULL email issue logged successfully")


# DUPLICATE EMAIL VALIDATION

print("\nDuplicate Emails:")

duplicate_query = """
SELECT email, COUNT(*)
FROM customers
GROUP BY email
HAVING COUNT(*) > 1
AND email IS NOT NULL
"""

cursor.execute(duplicate_query)

duplicate_results = cursor.fetchall()

for row in duplicate_results:
    print(row)


cursor.close()
connection.close()