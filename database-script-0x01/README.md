# AirBnB Database Schema

## Overview
This directory contains the SQL schema for the AirBnB database, designed to manage users, properties, bookings, payments, reviews, and messages. The schema is normalized to the Third Normal Form (3NF) to ensure data integrity and minimize redundancy.

## Files
- `schema.sql`: SQL script to create the database tables, constraints, and indexes.
- `README.md`: This file, providing setup instructions and schema overview.

## Schema Details
The database includes the following tables:
- **User**: Stores user information (guests, hosts, admins).
- **Location**: Stores unique city-country pairs to avoid redundancy.
- **Property**: Represents properties listed by hosts.
- **Booking**: Manages bookings made by users for properties.
- **Payment**: Records payment details for bookings.
- **Review**: Stores reviews and ratings for properties.
- **Message**: Handles messages between users.

### Constraints
- Primary keys use UUIDs for uniqueness.
- Foreign keys ensure referential integrity.
- Non-null constraints on required fields.
- Check constraints (e.g., `rating` between 1 and 5).
- Unique constraint on `User.email`.

### Indexes
- Primary keys are automatically indexed.
- Additional indexes on `email`, `location_id`, `property_id`, and `booking_id` for performance.