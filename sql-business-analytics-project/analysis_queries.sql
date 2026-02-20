

-- Q1) Total revenue (only PAID payments)
SELECT
    SUM(p.amount) AS total_revenue_paid
FROM Payments p
WHERE p.payment_status = 'PAID';


-- Q2) Monthly revenue trend (PAID only)
SELECT
    FORMAT(o.order_date, 'yyyy-MM') AS month,
    SUM(p.amount) AS revenue_paid
FROM Orders o
JOIN Payments p ON p.order_id = o.order_id
WHERE p.payment_status = 'PAID'
GROUP BY FORMAT(o.order_date, 'yyyy-MM')
ORDER BY month;


-- Q3) Top customers by spending (PAID only)
SELECT
    c.customer_id,
    c.customer_name,
    c.country,
    SUM(p.amount) AS total_spent
FROM Customers c
JOIN Orders o ON o.customer_id = c.customer_id
JOIN Payments p ON p.order_id = o.order_id
WHERE p.payment_status = 'PAID'
GROUP BY c.customer_id, c.customer_name, c.country
ORDER BY total_spent DESC;


-- Q4) Best-selling products (by quantity)
SELECT
    pr.product_id,
    pr.product_name,
    SUM(oi.quantity) AS total_quantity_sold
FROM Products pr
JOIN Order_Items oi ON oi.product_id = pr.product_id
GROUP BY pr.product_id, pr.product_name
ORDER BY total_quantity_sold DESC;


-- Q5) Revenue by country (PAID only)
SELECT
    c.country,
    SUM(p.amount) AS revenue_paid
FROM Customers c
JOIN Orders o ON o.customer_id = c.customer_id
JOIN Payments p ON p.order_id = o.order_id
WHERE p.payment_status = 'PAID'
GROUP BY c.country
ORDER BY revenue_paid DESC;


-- Q6) Customer ranking by spending using window function (PAID only)
SELECT
    c.customer_name,
    c.country,
    SUM(p.amount) AS total_spent,
    RANK() OVER (ORDER BY SUM(p.amount) DESC) AS spending_rank
FROM Customers c
JOIN Orders o ON o.customer_id = c.customer_id
JOIN Payments p ON p.order_id = o.order_id
WHERE p.payment_status = 'PAID'
GROUP BY c.customer_name, c.country
ORDER BY spending_rank;


-- Q7) Failed / Pending payments (to show payment risk)
SELECT
    p.payment_status,
    COUNT(*) AS payment_count,
    SUM(p.amount) AS total_amount
FROM Payments p
WHERE p.payment_status IN ('FAILED', 'PENDING')
GROUP BY p.payment_status;


-- Q8) Orders with their customer + payment status (simple operational view)
SELECT
    o.order_id,
    c.customer_name,
    c.country,
    o.order_date,
    p.payment_status,
    p.amount
FROM Orders o
JOIN Customers c ON c.customer_id = o.customer_id
JOIN Payments p ON p.order_id = o.order_id
ORDER BY o.order_date;


-- Q9) Order-level total from items (calculated from quantity * price)
-- Useful: shows you can compute revenue from item lines
SELECT
    o.order_id,
    c.customer_name,
    SUM(oi.quantity * pr.price) AS computed_order_total
FROM Orders o
JOIN Customers c ON c.customer_id = o.customer_id
JOIN Order_Items oi ON oi.order_id = o.order_id
JOIN Products pr ON pr.product_id = oi.product_id
GROUP BY o.order_id, c.customer_name
ORDER BY computed_order_total DESC;