# SQL Game Database Project 

## Description
This repository contains an **SQL project** that creates a structured **video game database** with real-world queries. It showcases:
- **Database design**
- **Data insertion**
- **Aggregations & analytics**
- **SQL query optimization**

## Files
- **Game_database.sql** → Full SQL script for MySQL (Database creation, table structure, sample data, and queries).
- **Game_database_postgres.sql** → PostgreSQL version of the same database with adapted syntax.

## Database Versions
This project provides SQL scripts for both **MySQL** and **PostgreSQL** databases:

### MySQL Version (`Game_database.sql`)
- Uses `AUTO_INCREMENT` for primary key generation
- Uses `YEAR` data type for production years
- Uses `CREATE DATABASE IF NOT EXISTS` and `USE` statements

### PostgreSQL Version (`Game_database_postgres.sql`)
- Uses `SERIAL` for primary key generation
- Uses `INTEGER` data type for production years  
- Uses `CREATE DATABASE` (connect to database separately)
- All queries and data remain identical for consistent results

