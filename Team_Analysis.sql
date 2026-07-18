-- Section 6 — Team Analysis

-- Q31
-- Which national team scored the most goals?
SELECT 
	nationality ,
	team,
	sum(goals) as total_goals
	
FROM fifa_player
GROUP BY  nationality, team
ORDER BY total_goals desc

-- Q32
-- Which team conceded the fewest goals?
SELECT 
	team,
	sum(goals_conceded) as total_conceded
FROM fifa_player
Group by team
order by total_conceded 


-- Q33
-- Which team had the highest average player rating?
SELECT
 	team,
	round(
	avg(player_rating)
	::numeric,2) as avg_rating
	
FROM fifa_player
GROUP by team
order by avg_rating desc

-- Q34
-- Find the most disciplined team.
-- (Least yellow + red cards)
SELECT 
	team,
	sum(yellow_cards) as total_yellow_cards,
	sum(red_cards) as total_red_cards,
	(sum(yellow_cards)+sum(red_cards)) as total_cards
	
FROM fifa_player
group by team
order by total_cards asc;


-- Q35
-- Which team covered the greatest total running distance?
SELECT 
	team,
	count(distinct(match_id))as total_match,
	sum(distance_covered_km ) as total_distance
FROM fifa_player
GROUP BY  team
order by  total_distance desc

