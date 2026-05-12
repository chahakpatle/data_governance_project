USE data_governance_db;

-- Customers with missing emails

SELECT
    customer_id,
    customer_name,
    email
FROM customers
WHERE email IS NULL;


-- Customers with missing phone numbers

SELECT
    customer_id,
    customer_name,
    phone_number
FROM customers
WHERE phone_number IS NULL;


-- Orders with missing payment methods

SELECT
    order_id,
    customer_id,
    payment_method
FROM orders
WHERE payment_method IS NULL;


-- Orders with missing order amounts

SELECT
    order_id,
    customer_id,
    order_amount
FROM orders
WHERE order_amount IS NULL;