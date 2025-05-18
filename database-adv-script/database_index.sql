-- =============================================
-- OPTIMAL INDEXES FOR AIRBNB DATABASE
-- =============================================

-- Users Table Indexes
-- --------------------------
-- Index for user email (unique identifier)
CREATE UNIQUE INDEX IF NOT EXISTS idx_users_email ON users(email);

-- Index for username searches
CREATE INDEX IF NOT EXISTS idx_users_username ON users(username);

-- Index for user creation date (analytics)
CREATE INDEX IF NOT EXISTS idx_users_created_at ON users(created_at);

-- Bookings Table Indexes
-- --------------------------
-- Foreign key index for user bookings
CREATE INDEX IF NOT EXISTS idx_bookings_user_id ON bookings(user_id);

-- Foreign key index for property bookings
CREATE INDEX IF NOT EXISTS idx_bookings_property_id ON bookings(property_id);

-- Index for date range queries
CREATE INDEX IF NOT EXISTS idx_bookings_check_in ON bookings(check_in_date);
CREATE INDEX IF NOT EXISTS idx_bookings_check_out ON bookings(check_out_date);

-- Index for booking status filtering
CREATE INDEX IF NOT EXISTS idx_bookings_status ON bookings(status);

-- Properties Table Indexes
-- --------------------------
-- Index for host/property relationship
CREATE INDEX IF NOT EXISTS idx_properties_host_id ON properties(host_id);

-- Index for location-based searches
CREATE INDEX IF NOT EXISTS idx_properties_location ON properties(location);

-- Index for price filtering
CREATE INDEX IF NOT EXISTS idx_properties_price ON properties(price_per_night);

-- Index for rating sorting
CREATE INDEX IF NOT EXISTS idx_properties_rating ON properties(rating);

-- Index for new listings
CREATE INDEX IF NOT EXISTS idx_properties_created_at ON properties(created_at);

-- Composite Indexes
-- --------------------------
-- Optimize location+price queries
CREATE INDEX IF NOT EXISTS idx_properties_loc_price 
ON properties(location, price_per_night);

-- Optimize user booking history queries
CREATE INDEX IF NOT EXISTS idx_bookings_user_dates 
ON bookings(user_id, check_in_date, check_out_date);

-- Optimize property availability queries
CREATE INDEX IF NOT EXISTS idx_bookings_property_dates 
ON bookings(property_id, check_in_date, check_out_date);