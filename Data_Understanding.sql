--  Data Understanding

-- Q1-  How many unique players participated in the tournament?
SELECT 
	distinct(player_name ) as unique_player
FROM fifa_player
-- or
select count(distinct(player_name))
from fifa_player

-- Q2- How many matches were played?
SELECT 
	COUNT(*) AS total_match
FROM fifa_player

-- Q3- How many different national teams participated?
SELECT nationality, count(team) AS  total_teams
FROM  fifa_player
group by  nationality
order by total_teams DESC

-- Q4- How many players played in each position?
SELECT position, count(*) as total_player
FROM fifa_player
GROUP BY position

-- Q5- Which clubs contributed the most players to the World Cup squad?
SELECT club_name, COUNT(*) AS total_player
FROM fifa_player
GROUP BY  club_name
ORDER BY  total_player DESC
