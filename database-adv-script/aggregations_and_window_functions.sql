-- 1. Aggregation query to find total bookings per user
SELECT 
    u.user_id,
    u.username,
    u.email,
    COUNT(b.booking_id) AS total_bookings
FROM 
    users u
LEFT JOIN 
    bookings b ON u.user_id = b.user_id
GROUP BY 
    u.user_id, u.username, u.email
ORDER BY 
    total_bookings DESC;

-- 2. Window function to rank properties by booking count
SELECT 
    p.property_id,
    p.title,
    p.price_per_night,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_row_num
FROM 
    properties p
LEFT JOIN 
    bookings b ON p.property_id = b.property_id
GROUP BY 
    p.property_id, p.title, p.price_per_night
ORDER BY 
    total_bookings DESC;