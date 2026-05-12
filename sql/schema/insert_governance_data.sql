USE data_governance_db;

INSERT INTO datasets (
    dataset_name,
    dataset_description,
    data_owner,
    source_system,
    update_frequency
)
VALUES
(
    'customers',
    'Stores customer demographic and contact information',
    'Sales Team',
    'CRM System',
    'Daily'
),
(
    'orders',
    'Stores customer order and transaction details',
    'Operations Team',
    'E-Commerce Platform',
    'Real-Time'
);