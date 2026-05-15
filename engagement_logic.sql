-- ==================================================
-- STREAMING ENGAGEMENT ANALYSIS
-- Goal: Connect user profiles to watch history to find top viewers.
-- ==================================================

-- QUERY 1: USER WATCH TIME RANKING
-- Joins user data with watch logs to calculate total engagement per person.

SELECT 
    u.user_name, 
    SUM(w.minutes_watched) AS total_minutes_watched
FROM users AS u
JOIN watch_log AS w 
    ON u.user_id = w.user_id
GROUP BY u.user_name
ORDER BY total_minutes_watched DESC;

-- QUERY 2: GENRE PREFERENCE BY USER
-- Goal: See which genres each user spends the most time on.

SELECT 
    users.user_name, 
    movies.genre, 
    SUM(watch_log.minutes_watched) AS total_min_watched
FROM users
JOIN watch_log 
    ON users.user_id = watch_log.user_id
JOIN movies 
    ON watch_log.movie_id = movies.movie_id
GROUP BY users.user_name, movies.genre
ORDER BY total_min_watched DESC;
