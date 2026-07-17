-- Section 5 — Goalkeeper Analysis

-- Q26
-- Best goalkeeper by save percentage.

SELECT  
	player_name,
	team,
	position,
	sum(save_percentage) as total_save_percentage
	
FROM fifa_player

WHERE position = 'Goalkeeper'

group by 
	player_name, 
	team, 
	position

order by total_save_percentage desc

-- Q27

-- Find goalkeepers with the most clean sheets.

SELECT 
	player_name,
	team,
	position,
	count(clean_sheet) as total_clean_sheet
	
FROM fifa_player

WHERE position = 'Goalkeeper' 
	  and clean_sheet = 'True'

GROUP BY player_name, team, position
order by total_clean_sheet desc


-- Q28

-- Which goalkeeper saved penalties?
SELECT 
	player_name, 
	team,
	position,
	sum(penalty_saves) as total_penlty,
	rank() over(order by sum(penalty_saves)desc)as rnk
	
FROM fifa_player

WHERE position = 'Goalkeeper' 

group by  player_name, team, position

Having sum(penalty_saves) >=1

