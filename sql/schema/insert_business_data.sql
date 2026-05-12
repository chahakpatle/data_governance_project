USE data_governance_db;

INSERT INTO customers (
    customer_id,
    customer_name,
    email,
    phone_number,
    city,
    registration_date
)
VALUES
(101, 'Rahul Sharma', 'rahul@gmail.com', '9876543210', 'Mumbai', '2025-01-10'),

(102, 'Priya Mehta', NULL, '9123456780', 'Pune', '2025-01-15'),

(103, 'Arjun Patel', 'arjunmail.com', '99887', 'Delhi', '2025-02-01'),

(101, 'Rahul Sharma', 'rahul@gmail.com', '9876543210', 'Mumbai', '2025-01-10'),

(104, 'Sneha Iyer', 'sneha@gmail.com', NULL, 'Bangalore', '2025-02-18'),

(105, 'Karan Verma', 'karan@gmail.com', '9988776655', 'Hyderabad', '2025-03-01');



INSERT INTO orders (
    order_id,
    customer_id,
    order_amount,
    order_date,
    payment_method
)
VALUES
(5001, 101, 2500.00, '2025-03-10', 'UPI'),

(5002, 102, -1500.00, '2025-03-11', 'Card'),

(5003, 103, 3200.00, '2025-03-12', NULL),

(5004, 110, 1800.00, '2025-03-13', 'Cash'),

(5005, 104, NULL, '2025-03-14', 'UPI'),

(5006, 105, 4200.00, '2025-03-15', 'Card');