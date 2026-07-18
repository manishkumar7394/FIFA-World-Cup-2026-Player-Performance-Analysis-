# ⚽ FIFA World Cup Player Performance Analysis using PostgreSQL
![fifa world cut player performance](https://github.com/manishkumar7394/FIFA-World-Cup-2026-Player-Performance-Analysis-/blob/main/FIFA%20WORLD%20CUP%202026.PNG)
## 📌 Project Overview

This project is a comprehensive SQL analysis of FIFA World Cup player performance data using **PostgreSQL**. The goal of this project is to solve real-world football analytics and business problems using SQL, while demonstrating strong analytical thinking and database querying skills.

The project contains **35+ business-oriented SQL queries** ranging from beginner to advanced level. Each query is designed to answer meaningful business questions related to player performance, team statistics, defensive analysis, goalkeeping, discipline, and tournament insights.

```SQL
CREATE TABLE fifa_player(

    player_id VARCHAR(20),
    player_name VARCHAR(100),
    age INT,
    nationality VARCHAR(100),
    team VARCHAR(100),
    jersey_number INT,
    position VARCHAR(20),
    height_cm INT,
    weight_kg INT,
    preferred_foot VARCHAR(10),
    club_name VARCHAR(100),
    market_value_eur BIGINT,

    match_id VARCHAR(30),
    match_date DATE,
    stadium VARCHAR(100),
    city VARCHAR(100),
    opponent_team VARCHAR(100),
    tournament_stage VARCHAR(50),

    match_result VARCHAR(10),
    goals_team INT,
    goals_opponent INT,

    minutes_played INT,
    goals INT,
    assists INT,
    shots INT,
    shots_on_target INT,

    expected_goals_xg NUMERIC(5,2),
    expected_assists_xa NUMERIC(5,2),

    key_passes INT,
    successful_passes INT,
    total_passes INT,
    pass_accuracy NUMERIC(5,2),

    dribbles_attempted INT,
    successful_dribbles INT,

    crosses INT,
    successful_crosses INT,

    tackles INT,
    interceptions INT,
    clearances INT,
    blocks INT,

    aerial_duels_won INT,
    aerial_duels_lost INT,

    recoveries INT,
    defensive_actions INT,

    fouls_committed INT,
    fouls_suffered INT,

    yellow_cards INT,
    red_cards INT,
    offsides INT,

    saves INT,
    save_percentage NUMERIC(5,2),
    punches INT,
    clean_sheet BOOLEAN,
    goals_conceded INT,
    penalty_saves INT,

    distance_covered_km NUMERIC(5,2),
    sprint_distance_km NUMERIC(5,2),
    top_speed_kmh NUMERIC(5,2),

    accelerations INT,
    decelerations INT,

    stamina_score NUMERIC(5,2),
    player_rating NUMERIC(4,2),
    performance_score NUMERIC(6,2),

    offensive_contribution NUMERIC(6,2),
    defensive_contribution NUMERIC(6,2),
    possession_impact NUMERIC(6,2),
    pressure_resistance NUMERIC(6,2),
    creativity_score NUMERIC(6,2),
    consistency_score NUMERIC(6,2),
    clutch_performance_score NUMERIC(6,2),

    total_goals_tournament INT,
    total_assists_tournament INT,
    total_minutes_tournament INT,

    player_of_match_awards INT,
    tournament_rating NUMERIC(4,2)
);
```

---

## 🎯 Project Objectives

- Analyze FIFA World Cup player and team performance.
- Practice solving real-world business problems using SQL.
- Strengthen PostgreSQL skills through hands-on analysis.
- Build an interview-ready SQL portfolio project.
- Demonstrate analytical thinking and query optimization techniques.

---

## 🛠️ Tools & Technologies

- **Database:** PostgreSQL
- **SQL Editor:** pgAdmin 4
- **Language:** SQL

---

## 📚 SQL Concepts Used

### Basic SQL
- SELECT
- WHERE
- ORDER BY
- LIMIT
- DISTINCT

### Aggregate Functions
- SUM()
- AVG()
- COUNT()
- MIN()
- MAX()

### Grouping
- GROUP BY
- HAVING

### Subqueries
- Scalar Subqueries
- Nested Queries

### Common Table Expressions (CTEs)
- WITH Clause

### Window Functions
- RANK()
- DENSE_RANK()
- ROW_NUMBER()

### Business KPI Calculations
- Goals per Player
- Assists
- Pass Accuracy
- Shooting Accuracy
- Expected Goals (xG)
- Defensive Contribution
- Offensive Contribution
- Clean Sheets
- Recovery Rate
- Per 90 Minutes Statistics
- Team Discipline Score

---

# 📊 Business Questions Solved

## 👤 Player Performance Analysis
- Top goal scorers
- Top assist providers
- Players with the highest key passes
- Players with the highest shooting accuracy
- Players who underperformed their Expected Goals (xG)
- Players with the highest consistency score
- Players with the most passes per 90 minutes
- Players with the highest recovery rate
- Players committing the most fouls
- Players with zero yellow cards despite playing more than 600 minutes

## 🛡️ Defensive Analysis
- Rank defenders based on defensive actions
- Top defenders based on tackles, interceptions, and clearances
- Best defensive performers in the tournament

## 🧤 Goalkeeper Analysis
- Goalkeepers with the most clean sheets

## 🌍 Team Analysis
- Highest goal-scoring teams
- Teams conceding the fewest goals
- Most disciplined teams
- Teams covering the greatest running distance

## 🏟️ Stadium Analysis
- Stadiums with the highest average goals

---

## 📈 Skills Demonstrated

- SQL Query Writing
- Business Problem Solving
- Data Aggregation
- KPI Development
- Data Analysis
- Window Functions
- Common Table Expressions (CTEs)
- Subqueries
- Analytical Thinking
- Query Optimization

---

## 📂 Project Structure

```
FIFA-World-Cup-SQL-Analysis/
│
├── Dataset/
│   └── fifa_player.csv
│
├── SQL/
│   ├── Database_Creation.sql
│   ├── Data_Import.sql
│   ├── Business_Questions.sql
│   └── Advanced_SQL_Queries.sql
│
├── README.md
│
└── Screenshots/
```

---

## 🚀 Key Learning Outcomes

Through this project, I gained practical experience in:

- Writing optimized SQL queries
- Solving real-world analytical problems
- Using PostgreSQL for data analysis
- Applying aggregate functions and window functions effectively
- Creating business KPIs from raw data
- Structuring SQL solutions for interview scenarios

---

## 💼 Why This Project?

This project was created to simulate the type of SQL analysis performed by Data Analysts in real business environments. Instead of focusing only on SQL syntax, each query answers a business question using analytical thinking and PostgreSQL best practices.

---

## ⭐ Connect With Me

If you found this project useful, please consider giving it a **⭐ Star**.

I'm continuously learning and building projects in:

- SQL (PostgreSQL)
- Python (Pandas, NumPy, Matplotlib)
- Excel
- Power BI
- Data Analysis
- Data Visualization

I’m always open to feedback, suggestions, and opportunities to learn.
