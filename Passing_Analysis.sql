-- Section 3 — Passing Analysis

-- Q16
-- Which team had the highest average passing accuracy?
select 
	team, 
	round(
	avg(pass_accuracy)
	::numeric,2) as avg_pass_accuracy
from fifa_player
group by team
order by avg_pass_accuracy desc


-- Q17
-- Find players with more than 500 successful passes.
select 
	player_name,
	sum(successful_passes) as total_passes
From fifa_player
group by player_name
having sum(successful_passes) >500
order by  total_passes desc

-- Q18
-- Who completed the highest number of passes per 90 minutes?
select 
	player_id,
	player_name,
	team,
	sum(successful_passes) as total_passes,
	sum(minutes_played)as total_minutes_play,
	round(
	sum(successful_passes) *90.0/ nullif(sum(minutes_played),0)
	::numeric,2) as per_90_minuts
From fifa_player
group by player_name,player_id, team
order by per_90_minuts desc

-- Q19
-- Find midfielders with pass accuracy above tournament average.
select 
	player_name,
	position,
	pass_accuracy
from fifa_player
where position  = 'Midfielder' AND pass_accuracy >=(
select avg(pass_accuracy) as avg_pass	
From fifa_player)
order by pass_accuracy desc


-- Q20
-- Which player attempted the most passes but had below-average accuracy?
select 
	player_name,
	team,
	sum(total_passes) as  total_pass,
	round(
	avg(pass_accuracy)
	::numeric,2) as avg_pass_accuracy
from fifa_player
group by player_name, team
having avg(pass_accuracy) <(
select avg(pass_accuracy)
from fifa_player
)
order by total_pass desc
