USE data_governance_db;

CREATE TABLE customers (
    customer_id INT,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    city VARCHAR(50),
    registration_date DATE
);

CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    order_amount DECIMAL(10,2),
    order_date DATE,
    payment_method VARCHAR(50)
);