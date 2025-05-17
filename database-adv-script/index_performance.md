EXPLAIN ANALYZE SELECT b.booking_id, u.first_name
FROM Booking b
INNER JOIN "User" u ON b.user_id = u.user_id
WHERE b.start_date >= '2025-01-01';