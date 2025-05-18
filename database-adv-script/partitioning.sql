-- Step 1: Create the partitioned table structure
CREATE TABLE bookings_partitioned (
    booking_id BIGSERIAL,
    user_id BIGINT NOT NULL,
    property_id BIGINT NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY (booking_id, check_in_date)
) PARTITION BY RANGE (check_in_date);

-- Step 2: Create partitions for different time periods
-- Historical data
CREATE TABLE bookings_historical PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2000-01-01') TO ('2020-01-01');

-- Recent years (2020-2023)
CREATE TABLE bookings_2020_2023 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2020-01-01') TO ('2024-01-01');

-- Current year partition
CREATE TABLE bookings_2024 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

-- Future bookings partition
CREATE TABLE bookings_future PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2025-01-01') TO ('2030-01-01');

-- Default partition (catch-all)
CREATE TABLE bookings_default PARTITION OF bookings_partitioned
    DEFAULT;

-- Step 3: Migrate data from original table
INSERT INTO bookings_partitioned
SELECT * FROM bookings;

-- Step 4: Create indexes on partitioned table
CREATE INDEX idx_bookings_partitioned_user_id ON bookings_partitioned(user_id);
CREATE INDEX idx_bookings_partitioned_property_id ON bookings_partitioned(property_id);
CREATE INDEX idx_bookings_partitioned_dates ON bookings_partitioned(check_in_date, check_out_date);

-- Step 5: Replace original table (optional - in production you would schedule this)
BEGIN;
ALTER TABLE bookings RENAME TO bookings_old;
ALTER TABLE bookings_partitioned RENAME TO bookings;
COMMIT;