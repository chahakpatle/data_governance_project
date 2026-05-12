USE data_governance_db;

-- Orders referencing non-existing customers

SELECT
    o.order_id,
    o.customer_id
FROM orders o
LEFT JOIN customers c
ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;