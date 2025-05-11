-- Insert sample data into Location
INSERT INTO Location (location_id, city, country) VALUES
('550e8400-e29b-41d4-a716-446655440000', 'Paris', 'France'),
('550e8400-e29b-41d4-a716-446655440001', 'New York', 'USA'),
('550e8400-e29b-41d4-a716-446655440002', 'Tokyo', 'Japan');

-- Insert sample data into User
INSERT INTO "User" (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
('550e8400-e29b-41d4-a716-446655440003', 'Alice', 'Smith', 'alice.smith@example.com', 'hashedpass1', '+33123456789', 'host', '2024-01-10 10:00:00'),
('550e8400-e29b-41d4-a716-446655440004', 'Bob', 'Johnson', 'bob.johnson@example.com', 'hashedpass2', '+12025550123', 'guest', '2024-02-15 12:00:00'),
('550e8400-e29b-41d4-a716-446655440005', 'Charlie', 'Brown', 'charlie.brown@example.com', 'hashedpass3', '+81312345678', 'guest', '2024-03-20 14:00:00'),
('550e8400-e29b-41d4-a716-446655440006', 'David', 'Lee', 'david.lee@example.com', 'hashedpass4', NULL, 'admin', '2024-04-01 09:00:00');

-- Insert sample data into Property
INSERT INTO Property (property_id, host_id, location_id, name, description, pricepernight, created_at, updated_at) VALUES
('550e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440000', 'Cozy Paris Apartment', 'A charming apartment in central Paris.', 150.00, '2024-01-15 10:00:00', '2024-05-01 12:00:00'),
('550e8400-e29b-41d4-a716-446655440008', '550e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440001', 'NYC Loft', 'Spacious loft in Manhattan.', 200.00, '2024-02-20 11:00:00', '2024-05-02 13:00:00'),
('550e8400-e29b-41d4-a716-446655440009', '550e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440002', 'Tokyo Studio', 'Modern studio in Tokyo., 120.00, '2024-03-25 15:00:00', '2024-05-03 14:00:00');

-- Insert sample data into Booking
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, status, created_at) VALUES
('550e8400-e29b-41d4-a716-446655440010', '550e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440004', '2024-06-01', '2024-06-05', 'confirmed', '2024-05-10 10:00:00'),
('550e8400-e29b-41d4-a716-446655440011', '550e8400-e29b-41d4-a716-446655440008', '550e8400-e29b-41d4-a716-446655440005', '2024-07-01', '2024-07-03', 'pending', '2024-06-15 11:00:00'),
('550e8400-e29b-41d4-a716-446655440012', '550e8400-e29b-41d4-a716-446655440009', '550e8400-e29b-41d4-a716-446655440004', '2024-08-01', '2024-08-04', 'canceled', '2024-07-20 12:00:00');

-- Insert sample data into Payment
INSERT INTO Payment (payment_id, booking_id, payment_date, payment_method) VALUES
('550e8400-e29b-41d4-a716-446655440013', '550e8400-e29b-41d4-a716-446655440010', '2024-05-11 10:00:00', 'credit_card'),
('550e8400-e29b-41d4-a716-446655440014', '550e8400-e29b-41d4-a716-446655440011', '2024-06-16 11:00:00', 'paypal');

-- Insert sample data into Review
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at) VALUES
('550e8400-e29b-41d4-a716-446655440015', '550e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440004', 4, 'Great stay, very clean!', '2024-06-06 10:00:00'),
('550e8400-e29b-41d4-a716-446655440016', '550e8400-e29b-41d4-a716-446655440008', '550e8400-e29b-41d4-a716-446655440005', 5, 'Amazing view and location!', '2024-07-04 12:00:00');

-- Insert sample data into Message
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
('550e8400-e29b-41d4-a716-446655440017', '550e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440003', 'Can I book for next month?', '2024-05-12 10:00:00'),
('550e8400-e29b-41d4-a716-446655440018', '550e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440004', 'Yes, available. Let me know!', '2024-05-12 10:05:00');