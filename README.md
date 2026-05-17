-- STREAMING PLATFORM ENGAGEMENT STUDY
-- Purpose: Analyzing user watch behavior across different subscription tiers and movie genres.

-- INSIGHT 1: TOP PREMIUM VIEWERS
-- Traces watch history specifically for Premium members to find highest engagement.
SELECT 
    users.user_name, 
    SUM(watch_log.minutes_watched) AS total_minutes_watched
FROM users
JOIN watch_log 
    ON users.user_id = watch_log.user_id
WHERE users.subscription_plan = 'Premium'
GROUP BY users.user_name
ORDER BY total_minutes_watched DESC;


-- INSIGHT 2: USER PREFERENCE BY GENRE
-- A 3-table connection mapping user profiles to specific movie content themes.
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


-- INSIGHT 3: ROMANCE SUPER USERS
-- Filtering for heavy viewers within the Romance category using aggregate conditions.
SELECT 
    users.user_name, 
    SUM(watch_log.minutes_watched) AS total_romance_minutes
FROM users
JOIN watch_log 
    ON users.user_id = watch_log.user_id
JOIN movies 
    ON watch_log.movie_id = movies.movie_id
WHERE movies.genre = 'Romance'
GROUP BY users.user_name
HAVING SUM(watch_log.minutes_watched) > 120;


-- INSIGHT 4: UPSELL OPPORTUNITIES
-- Identifying basic tier members with high watch volume for targeted marketing.
SELECT 
    users.user_name, 
    users.subscription_plan, 
    CASE 
        WHEN users.subscription_plan = 'Premium' THEN 'VIP Access' 
        WHEN users.subscription_plan = 'Basic' AND watch_log.minutes_watched > 100 THEN 'Upsell Candidate' 
        ELSE 'Standard User' 
    END AS marketing_action  
FROM users 
JOIN watch_log 
    ON users.user_id = watch_log.user_id;
