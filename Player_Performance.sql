-- Section 2 — Player Performance


-- Q6- Find the top 10 goal scorers.
select player_name, sum(goals) as total_goals
from fifa_player
group by player_name
order by total_goals desc
limit 10
-- or
with top_goals as (
select
	player_name ,
	sum(goals) as total_goals,
	rank() over( order by sum(goals) desc) as rnk
from fifa_player
group by player_name
) 
select * from top_goals
where rnk <= 10

-- Q7
-- Find the top 10 assist providers.
with top_assists as(
SELECT 
	player_name,
	sum(assists) as total_assist,
	rank() over( order by sum(assists) desc ) as rnk
FROM fifa_player
GROUP BY  player_name
)
select * from top_assists
where rnk <=10


-- Q8
-- Which players created the highest number of key passes?
select player_name, sum(key_passes) as highest_keyPasses
from fifa_player
group by player_name
order by highest_keyPasses desc
limit 5

-- Q9
-- Find players who scored more goals than their expected goals (xG).
select 
	player_name,
	sum(goals) as total_goals,
	sum(expected_goals_xg) as total_xg
from fifa_player
group by player_name
order by total_goals desc, total_xg desc
select * from fifa_player
-- Q10
-- Find players who underperformed their xG by the largest margin.
select 		
	player_name,
	sum(expected_goals_xg) as total_xg,
	sum(goals) as total_goals, 
	(sum(goals))-(sum(expected_goals_xg)) as difference 
	
from fifa_player
group by player_name
having (sum(goals))-(sum(expected_goals_xg))<=0
order by total_xg desc , total_goals desc


-- Q11
-- Which players had the highest shooting accuracy?
-- (Shots on target / shots)
select 
	player_name,
	sum(shots) as total_shots,
	sum(shots_on_target) as shots_target,
	round(
	sum(shots_on_target)*100.0/nullif(sum(shots),0)
	::numeric,2) as accuracy
from fifa_player
group by player_name
having sum(shots)>0 
order by accuracy desc


-- Q12
-- Find players who played at least 200 minutes and maintained a rating above 8.
SELECT  
	player_name,
	SUM(minutes_played)as total_minutes,
	player_rating
FROM fifa_player
WHERE player_rating >=8
GROUP BY  player_name, player_rating
HAVING SUM(minutes_played) >=200
ORDER BY  total_minutes DESC

-- Q13
-- Find the most consistent players using the consistency score.
select 
	player_id,
	player_name,  
	team,
	round(
	avg(consistency_score)::numeric,2) as avg_score
from fifa_player
group by player_name, player_id, team
order by avg_score desc

-- Q14

-- Which player received the most Player of the Match awards?
select 
	player_name,
	team,
	sum(player_of_match_awards) as total_awards	
from fifa_player
group by team , player_name
order by total_awards desc

-- Q15

-- Find players who contributed both offensively and defensively.

-- (Hint: offensive_contribution + defensive_contribution)

select 
	player_name,
	round(
	avg(offensive_contribution)
	::numeric,2) as total_off,
	round(
	avg(defensive_contribution)
	::numeric,2) as total_def,
	round(
	(avg(offensive_contribution)+ avg(defensive_contribution))
	::numeric,2) as both_contributed
	
From fifa_player
group by player_name
order by both_contributed desc
