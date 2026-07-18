

-- Section 7 — Stadium Analysis


-- Q36
-- Which stadium hosted the most matches?
SELECT 
	stadium,
	count(distinct(match_id)) as total_count
from fifa_player
GROUP BY stadium
order by total_count desc


-- Q37
-- Which stadium had the highest average goals?
SELECT 
	stadium,
	round(
	avg(goals)::numeric,2) as avg_goals
	
FROM fifa_player
GROUP BY stadium
ORDER by avg_goals desc
