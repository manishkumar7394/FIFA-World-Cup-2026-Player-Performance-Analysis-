-- Section 4 — Defensive Analysis

-- Q21

-- Top defenders based on tackles + interceptions + clearances.
SELECT 
	player_name,
	team,
	position,
	sum(tackles) as total_tackles,
	sum(interceptions) as total_interceptions,
	sum(clearances) as total_clearances,
	sum(tackles +interceptions +clearances) as total_defensive
FROM fifa_player
WHERE position = 'Defender'
GROUP BY 
	player_name,
	position,
	team
	
ORDER BY total_defensive desc
	

-- Q22

-- Find players with zero yellow cards despite playing more than 600 minutes.

SELECT 
	player_id, 
	player_name,
	team,
	sum(yellow_cards) as total_cards, 
	sum(minutes_played)as total_minutes_played
	
FROM Fifa_player

GROUP BY Player_id, player_name, team

HAVING sum(minutes_played) >600 and sum(yellow_cards) = 0

ORDER BY total_minutes_played desc;



-- Q23
-- Which players committed the most fouls?
SELECT 
	player_name,
	team,
	sum(fouls_committed) as total_fouls
FROM fifa_player

GROUP BY player_name,team

ORDER BY total_fouls desc

-- Q24

-- Find players with the highest recovery rate.

SELECT 
	player_name,
	team, 
	sum(recoveries) as total_recoveries,
	sum(minutes_played)as totaL_min_played,
	round(
	sum(recoveries)*90.0/nullif(sum(minutes_played),0)
	::numeric,2) as highest_recovery
	
FROM FIFA_PLAYER

GROUP BY player_name, team

ORDER BY highest_recovery desc

-- 25  Rank defenders based on defensive actions.
SELECT 
	player_name,
	team,
	position,
	sum(defensive_actions),
	rank() over(order by sum(defensive_actions) desc) as rnk
	
FROM fifa_player

WHERE position = 'Defender'

GROUP BY
	player_name, 
	position,
	team
