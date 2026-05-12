USE data_governance_db;

INSERT INTO data_quality_issues (
    rule_id,
    dataset_id,
    issue_description,
    affected_record_count,
    issue_status
)
VALUES

(
    1,
    1,
    'Customer records with missing email addresses detected',
    1,
    'Open'
),

(
    2,
    1,
    'Invalid email format detected in customer records',
    1,
    'Open'
),

(
    3,
    1,
    'Duplicate customer IDs detected',
    1,
    'Open'
),

(
    4,
    1,
    'Invalid phone numbers detected',
    1,
    'In Progress'
),

(
    5,
    2,
    'Negative order amounts detected',
    1,
    'Open'
),

(
    6,
    2,
    'Orders with missing payment methods detected',
    1,
    'Resolved'
),

(
    7,
    2,
    'Orders referencing non-existing customers detected',
    1,
    'Open'
);