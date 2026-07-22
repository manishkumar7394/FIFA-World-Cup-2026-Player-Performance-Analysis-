-- Section 8 — Advanced SQL

-- Q40
-- Rank players within each team based on tournament rating.
-- (Window Function)
SELECT 
	player_name,
	team,
	round(
	avg(tournament_rating)
	::numeric,2) as total_rating,
	rank()over (
	partition by team 
	order by avg(tournament_rating) desc
	) as rnk
	
FROM fifa_player
group by 
	player_name,
	team
ORDER BY  rnk, team


-- Q41
-- Find the second-best player from every team.
-- (Dense Rank)
with cte as (
select 
	player_name,
	team,
	sum(total_goals_tournament) as total_goals,
	round(avg(tournament_rating)::numeric,2) as avg_rating,
	dense_rank()over (partition by team 
		order by sum(total_goals_tournament) desc) as rnk
FROM fifa_player
GROUP BY player_name, team
)

select * from cte
where rnk = 2
order by team 


-- Q42
-- Find the top-rated player for every position.
with CTE as (
SELECT 
	player_name,
	team,
	position,
	
	round(
	avg(player_rating)
	::numeric,2) as avg_rating,
	
	dense_rank() over(partition by position
		order by avg(player_rating) desc)as rnk
		
FROM fifa_player
GROUP BY  player_name, team, position
)
SELECT * FROM CTE
WHERE rnk  = 1


-- Q43
-- Calculate cumulative tournament goals by match date.
-- (Running Total)
with daily_goals as (
SELECT 
	match_date,
	sum(total_goals_tournament) as daily_goals
FROM fifa_player
group by match_date
)
select 
	match_date,
	daily_goals,
	sum(daily_goals) over(order by match_date ) as totol_running
from daily_goals
ORDER BY match_date

-- Q44
-- Compare each player's rating with the previous match.
-- (LAG)
SELECT
    player_name,
    team,
    match_date,
    player_rating,

    LAG(player_rating) OVER (
        PARTITION BY player_name
        ORDER BY match_date
    ) AS previous_rating

FROM fifa_player

ORDER BY
    player_name,
    match_date;


-- Did the player improve?

SELECT
    player_name,
    match_date,
    player_rating,

    LAG(player_rating) OVER (
        PARTITION BY player_name
        ORDER BY match_date
    ) AS previous_rating,

    ROUND(
        player_rating -
        LAG(player_rating) OVER (
            PARTITION BY player_name
            ORDER BY match_date
        ),
        2
    ) AS rating_change

FROM fifa_player

-- Q45
-- Compare each player's rating with the next match.
-- (LEAD)
SELECT
    player_name,
    match_date,
    player_rating,

    LEAD(player_rating) OVER (
        PARTITION BY player_name
        ORDER BY match_date
    ) AS Next_rating,

    ROUND(
        player_rating -
        LEAD(player_rating) OVER (
            PARTITION BY player_name
            ORDER BY match_date
        ),
        2
    ) AS rating_change

FROM fifa_player;


-- Q46
-- Calculate each player's percentage contribution to team goals.

WITH player_goals AS (
    SELECT
        player_name,
        team,
        SUM(goals) AS player_goals
    FROM fifa_player
    GROUP BY player_name, team
),

team_goals AS (
    SELECT
        team,
        SUM(goals) AS team_goals
    FROM fifa_player
    GROUP BY team
)

SELECT
    p.player_name,
    p.team,
    p.player_goals,
    t.team_goals,

    ROUND(
        (p.player_goals * 100.0) / t.team_goals,
        2
    ) AS contribution_percentage

FROM player_goals p
JOIN team_goals t
ON p.team = t.team

ORDER BY
    team,
    contribution_percentage DESC;


-- Q47
-- Find players whose tournament rating is above their team's average.
WITH player_avg_rating as (
SELECT 
	player_name, 
	team,
	round(
 	AVG(tournament_rating)
	::numeric,2) as player_avg_rating

FROM fifa_player
GROUP BY  player_name, team
),

team_avg_rating as(
SELECT
	team,
	round(
	avg(tournament_rating)
	::numeric,2) as team_avg_rating

FROM  fifa_player
GROUP BY team
)
SELECT p.player_name, p.team, p.player_avg_rating, t.team_avg_rating
FROM  player_avg_rating p
JOIN team_avg_rating t ON t.team = p.team

WHERE p.player_avg_rating > t.team_avg_rating 
ORDER BY  team, p.player_avg_rating DESC
	
