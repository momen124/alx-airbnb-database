-- Index on Booking.start_date
CREATE INDEX idx_booking_start_date ON Booking(start_date);

-- Index on Booking.user_id
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- Index on Review.rating
CREATE INDEX idx_review_rating ON Review(rating);