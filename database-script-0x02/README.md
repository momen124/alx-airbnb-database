# AirBnB Database Seed Data

## Overview
This directory contains SQL scripts to populate the AirBnB database with sample data. The data reflects real-world usage, including multiple users, properties, bookings, payments, reviews, and messages, based on the normalized 3NF schema.

## Files
- `seed.sql`: SQL script to insert sample data into the database tables.
- `README.md`: This file, providing setup instructions and data overview.

## Schema Context
The seed data corresponds to the following tables (normalized to 3NF):
- **User**: Stores user profiles (guests, hosts, admins).
- **Location**: Stores unique city-country pairs.
- **Property**: Lists properties hosted by users.
- **Booking**: Manages user bookings for properties.
- **Payment**: Records payment transactions.
- **Review**: Stores user reviews and ratings.
- **Message**: Handles user-to-user messages.

### Sample Data Summary
- **Locations**: 3 (Paris, New York, Tokyo).
- **Users**: 4 (1 host, 2 guests, 1 admin).
- **Properties**: 3 (hosted by the same host).
- **Bookings**: 3 (1 confirmed, 1 pending, 1 canceled).
- **Payments**: 2 (for confirmed and pending bookings).
- **Reviews**: 2 (from guests after stays).
- **Messages**: 2 (between a guest and host).
