-- Query 1: INNER JOIN to retrieve bookings and users
SELECT b.booking_id, b.start_date, b.end_date, b.status, u.first_name, u.email
FROM Booking b
INNER JOIN "User" u ON b.user_id = u.user_id;

-- Query 2: LEFT JOIN to retrieve properties and their reviews (including properties with no reviews)
SELECT p.property_id, p.name, r.review_id, r.rating, r.comment
FROM Property p
LEFT JOIN Review r ON p.property_id = r.property_id;

-- Query 3: FULL OUTER JOIN to retrieve all users and bookings
SELECT u.user_id, u.first_name, b.booking_id, b.start_date
FROM "User" u
FULL OUTER JOIN Booking b ON u.user_id = b.user_id;