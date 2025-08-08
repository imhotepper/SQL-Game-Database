-- PostgreSQL version of the Game Database
-- CREATE DATABASE (Connect to PostgreSQL server first, then run this)
CREATE DATABASE games_db;
-- \c games_db; -- Uncomment this line when running interactively to connect to the database

-- CREATE TABLE: games
CREATE TABLE IF NOT EXISTS games (
    id SERIAL PRIMARY KEY,                  
    title VARCHAR(100) NOT NULL,           
    company VARCHAR(100) NOT NULL,         
    genre VARCHAR(50),                      
    production_year INTEGER,               
    system_used VARCHAR(50),               
    production_cost DECIMAL(15,2),         
    revenue DECIMAL(15,2),                 
    rating DECIMAL(3,1) CHECK (rating BETWEEN 0 AND 10)  
);

-- INSERTING DATA
INSERT INTO games (title, company, genre, production_year, system_used, production_cost, revenue, rating) 
VALUES 
('Mario Kart', 'Nintendo', 'Racing', 1992, 'Super Nintendo', 1000000.00, 50000000.00, 9.5),
('The Legend of Zelda', 'Nintendo', 'Adventure', 1986, 'Nintendo', 500000.00, 20000000.00, 9.8),
('Call of Duty', 'Activision', 'Shooter', 2003, 'PlayStation', 20000000.00, 100000000.00, 8.7),
('Minecraft', 'Mojang', 'Sandbox', 2011, 'PC', 2500000.00, 2000000000.00, 9.2),
('Grand Theft Auto V', 'Rockstar Games', 'Action', 2013, 'PlayStation', 270000000.00, 7000000000.00, 9.7),
('FIFA 22', 'EA Sports', 'Sports', 2021, 'PlayStation', 150000000.00, 2500000000.00, 8.3),
('The Witcher 3', 'CD Projekt', 'RPG', 2015, 'PC', 81000000.00, 500000000.00, 9.6),
('Super Mario Odyssey', 'Nintendo', 'Platformer', 2017, 'Nintendo Switch', 30000000.00, 800000000.00, 9.4),
('Cyberpunk 2077', 'CD Projekt', 'RPG', 2020, 'PC', 330000000.00, 600000000.00, 7.8),
('Red Dead Redemption 2', 'Rockstar Games', 'Action', 2018, 'PlayStation', 540000000.00, 2000000000.00, 9.8);

-- DISPLAY ALL DATA
SELECT * FROM games;

-- AVERAGE PRODUCTION COST FOR GAMES CREATED BETWEEN 2011-2014 AND RATING > 7
SELECT AVG(production_cost) AS avg_cost
FROM games
WHERE production_year BETWEEN 2011 AND 2014
AND rating > 7;

-- GAME STATISTICS GROUPED BY PRODUCTION YEAR
SELECT production_year, 
       COUNT(*) AS total_games, 
       AVG(production_cost) AS avg_cost, 
       AVG(revenue) AS avg_revenue
FROM games
GROUP BY production_year
ORDER BY production_year ASC;

-- FIND THE MOST PROFITABLE GAME
SELECT title, (revenue - production_cost) AS profit 
FROM games 
ORDER BY profit DESC 
LIMIT 1;

-- SHOW ALL GAMES SORTED BY RATING (DESCENDING)
SELECT title, company, rating
FROM games
ORDER BY rating DESC;

-- FIND THE OLDEST AND NEWEST GAME
SELECT title, production_year 
FROM games
ORDER BY production_year ASC 
LIMIT 1;  -- Oldest game

SELECT title, production_year 
FROM games
ORDER BY production_year DESC 
LIMIT 1;  -- Newest game

-- AVERAGE RATING FOR EACH COMPANY
SELECT company, AVG(rating) AS avg_rating
FROM games
GROUP BY company
ORDER BY avg_rating DESC;

-- LIST ALL GAMES RELEASED AFTER 2000 SORTED BY REVENUE
SELECT title, production_year, revenue 
FROM games
WHERE production_year > 2000
ORDER BY revenue DESC;

-- FIND GAMES WHERE REVENUE IS AT LEAST 10X THE PRODUCTION COST
SELECT title, production_cost, revenue, 
       (revenue / production_cost) AS revenue_ratio
FROM games
WHERE revenue >= production_cost * 10
ORDER BY revenue_ratio DESC;

-- TOTAL NUMBER OF GAMES PER SYSTEM
SELECT system_used, COUNT(*) AS total_games
FROM games
GROUP BY system_used
ORDER BY total_games DESC;

-- IDENTIFY GAMES WITH A RATING ABOVE THE AVERAGE
SELECT title, rating
FROM games
WHERE rating > (SELECT AVG(rating) FROM games)
ORDER BY rating DESC;

-- FIND THE MOST COMMON GENRE
SELECT genre, COUNT(*) AS count
FROM games
GROUP BY genre
ORDER BY count DESC
LIMIT 1;

-- RANK GAMES BY REVENUE USING A WINDOW FUNCTION
SELECT title, revenue, 
       RANK() OVER (ORDER BY revenue DESC) AS revenue_rank
FROM games;
