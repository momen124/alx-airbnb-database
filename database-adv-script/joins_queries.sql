-- 1. INNER JOIN to retrieve all bookings and their respective users
SELECT b.booking_id, b.property_id, b.check_in_date, b.check_out_date, 
       u.user_id, u.username, u.email
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id;

-- 2. LEFT JOIN to retrieve all properties and their reviews (including properties with no reviews)
-- Ordered by property_id and review creation date
SELECT p.property_id, p.title, p.description, p.price_per_night,
       r.review_id, r.rating, r.comment, r.created_at
FROM properties p
LEFT JOIN reviews r ON p.property_id = r.property_id
ORDER BY p.property_id ASC, r.created_at DESC;

-- 3. FULL OUTER JOIN to retrieve all users and all bookings
-- (including users with no bookings and bookings not linked to users)
SELECT u.user_id, u.username, u.email,
       b.booking_id, b.property_id, b.check_in_date, b.check_out_date
FROM users u
FULL OUTER JOIN bookings b ON u.user_id = b.user_id;