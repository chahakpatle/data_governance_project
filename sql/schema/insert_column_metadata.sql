USE data_governance_db;

INSERT INTO columns_metadata (
    dataset_id,
    column_name,
    data_type,
    is_nullable,
    sensitivity_level,
    business_definition
)
VALUES

-- Customers Table Metadata

(1, 'customer_id', 'INT', FALSE, 'Internal',
'Unique identifier assigned to each customer'),

(1, 'customer_name', 'VARCHAR', FALSE, 'Internal',
'Full name of the customer'),

(1, 'email', 'VARCHAR', TRUE, 'Sensitive',
'Customer email address used for communication'),

(1, 'phone_number', 'VARCHAR', TRUE, 'Sensitive',
'Customer contact number'),

(1, 'city', 'VARCHAR', TRUE, 'Internal',
'City where customer resides'),

(1, 'registration_date', 'DATE', FALSE, 'Internal',
'Date when customer registered'),


-- Orders Table Metadata

(2, 'order_id', 'INT', FALSE, 'Internal',
'Unique identifier assigned to each order'),

(2, 'customer_id', 'INT', FALSE, 'Internal',
'Customer associated with the order'),

(2, 'order_amount', 'DECIMAL', FALSE, 'Confidential',
'Total monetary value of the order'),

(2, 'order_date', 'DATE', FALSE, 'Internal',
'Date when the order was placed'),

(2, 'payment_method', 'VARCHAR', TRUE, 'Confidential',
'Payment mode used by customer');