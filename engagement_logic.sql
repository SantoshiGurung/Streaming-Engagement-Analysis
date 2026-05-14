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
