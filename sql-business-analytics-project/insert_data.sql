-- Customers
INSERT INTO Customers (customer_id, customer_name, country) VALUES
(1, 'Ravi Sharma', 'Switzerland'),
(2, 'Ananya Verma', 'France'),
(3, 'Luca Rossi', 'Italy'),
(4, 'Sofia Müller', 'Germany'),
(5, 'Noah Dubois', 'Switzerland');

-- Products
INSERT INTO Products (product_id, product_name, price) VALUES
(1, 'Laptop Sleeve', 29.90),
(2, 'Wireless Mouse', 39.90),
(3, 'Mechanical Keyboard', 129.00),
(4, 'USB-C Hub', 59.00),
(5, 'Noise Cancelling Headphones', 199.00);

-- Orders
INSERT INTO Orders (order_id, customer_id, order_date) VALUES
(1001, 1, '2026-01-05'),
(1002, 2, '2026-01-18'),
(1003, 3, '2026-02-02'),
(1004, 1, '2026-02-15'),
(1005, 4, '2026-03-01'),
(1006, 5, '2026-03-08');

-- Order Items
INSERT INTO Order_Items (order_item_id, order_id, product_id, quantity) VALUES
(1, 1001, 2, 1),
(2, 1001, 4, 1),

(3, 1002, 1, 2),
(4, 1002, 2, 1),

(5, 1003, 3, 1),

(6, 1004, 5, 1),
(7, 1004, 4, 1),

(8, 1005, 3, 1),
(9, 1005, 2, 2),

(10, 1006, 5, 1);

-- Payments
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    payment_status VARCHAR(20) NOT NULL,
    payment_date DATE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);