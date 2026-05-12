USE data_governance_db;

INSERT INTO data_quality_rules (
    dataset_id,
    column_id,
    rule_name,
    rule_description,
    rule_type,
    validation_condition,
    severity_level
)
VALUES

-- Customers Table Rules

(
    1,
    3,
    'email_not_null',
    'Customer email address should not be missing',
    'Completeness',
    'email IS NOT NULL',
    'High'
),

(
    1,
    3,
    'valid_email_format',
    'Customer email must contain @ symbol',
    'Validity',
    'email LIKE ''%@%''',
    'High'
),

(
    1,
    1,
    'unique_customer_id',
    'Customer IDs should be unique',
    'Uniqueness',
    'customer_id should be unique',
    'Critical'
),

(
    1,
    4,
    'valid_phone_number',
    'Phone number should contain at least 10 digits',
    'Validity',
    'phone_number length >= 10',
    'Medium'
),

-- Orders Table Rules

(
    2,
    9,
    'positive_order_amount',
    'Order amount should always be positive',
    'Validity',
    'order_amount > 0',
    'Critical'
),

(
    2,
    11,
    'payment_method_not_null',
    'Payment method should not be missing',
    'Completeness',
    'payment_method IS NOT NULL',
    'Medium'
),

(
    2,
    8,
    'valid_customer_reference',
    'Customer ID in orders table must exist in customers table',
    'Consistency',
    'customer_id must exist in customers table',
    'High'
);