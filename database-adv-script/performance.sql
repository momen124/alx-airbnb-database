-- Initial query with EXPLAIN analysis
EXPLAIN ANALYZE 
SELECT 
    b.booking_id,
    u.user_id,
    u.username,
    u.email,
    p.property_id,
    p.title AS property_title,
    p.price_per_night,
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.status AS payment_status
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.user_id
JOIN 
    properties p ON b.property_id = p.property_id
LEFT JOIN 
    payments pay ON b.booking_id = pay.booking_id
WHERE 
    b.check_in_date BETWEEN '2023-01-01' AND '2023-12-31'
ORDER BY 
    b.check_in_date DESC;

-- Optimized query with EXPLAIN analysis
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.user_id,
    u.username,
    u.email,
    b.property_id,
    p.title AS property_title,
    p.price_per_night,
    pay.amount,
    pay.payment_date,
    pay.status AS payment_status
FROM 
    bookings b
JOIN 
    users u USING (user_id)
JOIN 
    properties p USING (property_id)
LEFT JOIN LATERAL (
    SELECT 
        payment_id, 
        amount, 
        payment_date, 
        status
    FROM 
        payments
    WHERE 
        booking_id = b.booking_id
    ORDER BY 
        payment_date DESC
    LIMIT 1
) pay ON true
WHERE 
    b.check_in_date BETWEEN '2023-01-01' AND '2023-12-31'
ORDER BY 
    b.check_in_date DESC
LIMIT 1000;