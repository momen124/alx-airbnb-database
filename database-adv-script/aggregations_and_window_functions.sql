-- Query 1: Total number of bookings per user
SELECT u.user_id, u.first_name, COUNT(b.booking_id) AS booking_count
FROM "User" u
LEFT JOIN Booking b ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name;

-- Query 2: Rank properties based on number of bookings
SELECT p.property_id, p.name,
       COUNT(b.booking_id) AS booking_count,
       RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM Property p
LEFT JOIN Booking b ON p.property_id = b.property_id
GROUP BY p.property_id, p.name;