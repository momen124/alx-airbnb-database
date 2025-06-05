-- total number of bookings made by each user, using the COUNT function and GROUP BY clause.
-- This query retrieves the user_id and the total number of bookings for each user.

SELECT user_id, COUNT(*) AS total_bookings
FROM booking
GROUP BY user_id;

--Using a window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received
-- This query retrieves the property_id and the total number of bookings for each property.

SELECT property_id, total_bookings,
       ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS row_number_rank,
       RANK() OVER (ORDER BY COUNT(*) DESC) AS rank
FROM (
    SELECT property_id, COUNT(*) AS total_bookings
    FROM booking
    GROUP BY property_id
) AS property_stats;
