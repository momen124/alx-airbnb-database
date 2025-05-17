-- Drop existing Booking table (backup data if needed)
DROP TABLE Booking;

-- Create parent Booking table with partitioning
CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(10) NOT NULL CHECK (status IN ('pending', 'confirmed', 'canceled')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES "User"(user_id) ON DELETE CASCADE
) PARTITION BY RANGE (start_date);

-- Create partitions for 2024 and 2025
CREATE TABLE booking_2024 PARTITION OF Booking
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE booking_2025 PARTITION OF Booking
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Recreate indexes on partitions
CREATE INDEX idx_booking_2024_property_id ON booking_2024(property_id);
CREATE INDEX idx_booking_2024_user_id ON booking_2024(user_id);
CREATE INDEX idx_booking_2025_property_id ON booking_2025(property_id);
CREATE INDEX idx_booking_2025_user_id ON booking_2025(user_id);