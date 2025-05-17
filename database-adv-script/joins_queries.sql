-- Query 1: INNER JOIN to retrieve bookings and users
SELECT b.booking_id, b.start_date, b.end_date, b.status, u.first_name, u.email
FROM Booking b
INNER JOIN "User" u ON b.user_id = u.user_id;

-- Query 2: LEFT JOIN to retrieve properties and their reviews (including properties with no reviews)
SELECT 
    Property.property_id,
    Property.name AS property_name,
    Property.description,
    Property.location,
    Property.price_per_night,
    Review.review_id,
    Review.rating,
    Review.comment
FROM 
    Property
LEFT JOIN 
    Review 
ON 
    Property.property_id = Review.property_id;
-- Query 3: FULL OUTER JOIN to retrieve all users and bookings
SELECT u.user_id, u.first_name, b.booking_id, b.start_date
FROM "User" u
FULL OUTER JOIN Booking b ON u.user_id = b.user_id;