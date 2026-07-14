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
	(sum(goals))-(sum(expected_goals_xg)) as underperformed 
from fifa_player
group by player_name
having (sum(goals))-(sum(expected_goals_xg))<=0
order by total_xg desc , total_goals desc

