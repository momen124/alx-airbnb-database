# AirBnB Database Normalization to 3NF

## Objective
This document outlines the normalization process for the AirBnB database schema to achieve the Third Normal Form (3NF), ensuring data integrity and minimizing redundancy.

## Original Schema

### User
- `user_id`: PK, UUID, Indexed
- `first_name`: VARCHAR, NOT NULL
- `last_name`: VARCHAR, NOT NULL
- `email`: VARCHAR, UNIQUE, NOT NULL
- `password_hash`: VARCHAR, NOT NULL
- `phone_number`: VARCHAR, NULL
- `role`: ENUM (guest, host, admin), NOT NULL
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### Property
- `property_id`: PK, UUID, Indexed
- `host_id`: FK, references `User(user_id)`
- `name`: VARCHAR, NOT NULL
- `description`: TEXT, NOT NULL
- `location`: VARCHAR, NOT NULL
- `pricepernight`: DECIMAL, NOT NULL
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- `updated_at`: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

### Booking
- `booking_id`: PK, UUID, Indexed
- `property_id`: FK, references `Property(property_id)`
- `user_id`: FK, references `User(user_id)`
- `start_date`: DATE, NOT NULL
- `end_date`: DATE, NOT NULL
- `total_price`: DECIMAL, NOT NULL
- `status`: ENUM (pending, confirmed, canceled), NOT NULL
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### Payment
- `payment_id`: PK, UUID, Indexed
- `booking_id`: FK, references `Booking(booking_id)`
- `amount`: DECIMAL, NOT NULL
- `payment_date`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- `payment_method`: ENUM (credit_card, paypal, stripe), NOT NULL

### Review
- `review_id`: PK, UUID, Indexed
- `property_id`: FK, references `Property(property_id)`
- `user_id`: FK, references `User(user_id)`
- `rating`: INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL
- `comment`: TEXT, NOT NULL
- `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### Message
- `message_id`: PK, UUID, Indexed
- `sender_id`: FK, references `User(user_id)`
- `recipient_id`: FK, references `User(user_id)`
- `message_body`: TEXT, NOT NULL
- `sent_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

## Normalization Steps

### Step 1: Verify 1NF (First Normal Form)
- **Requirement**: All attributes must be atomic, and each table must have a primary key.
- **Analysis**:
  - All attributes are atomic (no repeating groups).
  - Each table has a primary key (e.g., `user_id`, `property_id`).
- **Result**: The schema is in 1NF.

### Step 2: Verify 2NF (Second Normal Form)
- **Requirement**: Must be in 1NF, and all non-key attributes must be fully functionally dependent on the entire primary key.
- **Analysis**:
  - No composite primary keys (all tables use single UUID PKs).
  - 2NF is automatically satisfied.
- **Result**: The schema is in 2NF.

### Step 3: Verify 3NF (Third Normal Form)
- **Requirement**: Must be in 2NF, and there should be no transitive dependencies.
- **Issues Identified**:
  1. **Property.location**:
     - `location` (e.g., "Paris, France") may cause redundancy if multiple properties are in the same city/country.
  2. **Booking.total_price**:
     - `total_price` is derived (`pricepernight * (end_date - start_date)`), violating 3NF.
  3. **Payment.amount**:
     - `amount` likely duplicates `Booking.total_price`, creating a transitive dependency.

### Step 4: Normalize to 3NF
#### Adjustment 1: Normalize `Property.location`
- **Solution**: Created a new `Location` table to store unique city-country pairs.
- **New Table**:
  - **Location**:
    - `location_id`: PK, UUID, Indexed
    - `city`: VARCHAR, NOT NULL
    - `country`: VARCHAR, NOT NULL
- **Updated Property**:
  - Removed: `location`
  - Added: `location_id`: FK, references `Location(location_id)`.

#### Adjustment 2: Remove `Booking.total_price`
- **Solution**: Removed `total_price` because it’s a derived attribute that can be calculated dynamically using `Property.pricepernight` and the booking duration (`end_date - start_date`). Storing derived data violates 3NF as it depends on `start_date`, `end_date`, and `pricepernight`, not just the primary key.
- **Implementation**:
  - Removed `total_price` from the `Booking` table.