USE data_governance_db;

-- Invalid email formats

SELECT
    customer_id,
    customer_name,
    email
FROM customers
WHERE email IS NOT NULL
AND email NOT LIKE '%@%';


-- Invalid phone numbers

SELECT
    customer_id,
    customer_name,
    phone_number
FROM customers
WHERE phone_number IS NOT NULL
AND LENGTH(phone_number) < 10;


-- Negative order amounts

SELECT
    order_id,
    customer_id,
    order_amount
FROM orders
WHERE order_amount < 0;