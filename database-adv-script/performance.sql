-- Initial query
SELECT b.booking_id, u.first_name AS user_name, p.name AS property_name, pay.payment_method, pay.payment_date
FROM Booking b
INNER JOIN "User" u ON b.user_id = u.user_id
INNER JOIN Property p ON b.property_id = p.property_id
INNER JOIN Payment pay ON b.booking_id = pay.booking_id
WHERE b.start_date >= '2025-01-01' AND b.status = 'confirmed';

-- Add indexes to optimize the query
CREATE INDEX idx_booking_start_date ON Booking(start_date);
CREATE INDEX idx_booking_status ON Booking(status);

-- Optimized query (same query, but now leveraging indexes)
SELECT b.booking_id, u.first_name AS user_name, p.name AS property_name, pay.payment_method, pay.payment_date
FROM Booking b
INNER JOIN "User" u ON b.user_id = u.user_id
INNER JOIN Property p ON b.property_id = p.property_id
INNER JOIN Payment pay ON b.booking_id = pay.booking_id
WHERE b.start_date >= '2025-01-01' AND b.status = 'confirmed';