# Intermediate SQL Implementations 1

## `CASE` Statement

The ` CASE` statement is the SQL's way of handling if/then/else logic.  
The `CASE` statement is followed by at least one pair of `WHEN` and `THEN` clauses.  
Every `CASE` must end with `END` statement.  
The `ELSE` statement is optional, and provides a way to capture values not specified in the `WHEN`/`THEN` statements

**Syntax:**

```sql
SELECT col_name1,
       col_name2,
       CASE WHEN col_name2 = value1 THEN data1
            WHEN col_name2 = value2 THEN data2
            ELSE NULL END AS col_name_new
FROM mytable
```

`CASE` also lets you combine multiple conditions together using `AND` or `OR`.

```sql
SELECT col1_name,
       col2_name,
       CASE WHEN col1_name = value1
            AND col2_name = value2
            THEN data1
            ELSE NULL
       END AS col_name_new
FROM mytable
```

### Using `CASE` with aggregate functions

`CASE` can be substantially more useful when it is paired with aggregate functions.

```sql
SELECT CASE WHEN col1 = val1 Then data1
            ELSE data2 END AS new_col,
            COUNT(1) AS count
FROM mytable
GROUP BY new_col
```

### Using `CASE` inside of aggregate functions

This technique can be used to pivot tables like in Excel and is called _pivoting_

```sql
SELECT COUNT(CASE WHEN col1 = val1 THEN 1 ELSE NULL END) AS val1_count,
SELECT COUNT(CASE WHEN col1 = val2 THEN 1 ELSE NULL END) AS val2_count,
SELECT COUNT(CASE WHEN col1 = val3 THEN 1 ELSE NULL END) AS val3_count
FROM mytable
```

### Exercise

**Question 1:** Write a query that includes a column that is flagged "yes" when a player is from California, and sort the results with those players first

```sql
SELECT player_name,
   CASE WHEN state = 'CA'
   THEN 'yes' ELSE 'no'
   END AS from_california
FROM pachiko.benn_college_football_players
ORDER BY from_california DESC
LIMIT 100;
```

**Question 2:** Write a query that includes players' names and a column that classifies them into four categories based on height.

```sql
SELECT player_name, height,
CASE WHEN height < 55 THEN 'below 55'
    WHEN height < 65 THEN '55-65'
    WHEN height < 75 THEN '65-75'
    ELSE 'over 75'
    END AS height_category
FROM pachiko.benn_college_football_players
LIMIT 100;
```

**Question 3:** Write a query that selects all columns from benn.college_football_players and adds an additional column that displays the player's name if that player is a junior or senior.

```sql
SELECT *,
CASE WHEN year IN ('JR', 'SR')
     THEN player_name ELSE NULL
     END AS jr_sr_player
FROM pachiko.benn_college_football_players;
```

**Question 4:** Write a query that counts the number of 300lb+ players for each of the following regions: West Coast (CA, OR, WA), Texas, and Other (everywhere else).

```sql
SELECT
  CASE
    WHEN state IN ('CA', 'OR', 'WA') THEN 'West Coast'
    WHEN state = 'TX' THEN 'Texas'
    ELSE 'Other'
    END AS player_region,
  COUNT(*)
FROM pachiko.benn_college_football_players
WHERE weight > 300
GROUP BY player_region;
```

**Question 5:** Write a query that calculates the combined weight of all underclass players (FR/SO) in California as well as the combined weight of all upperclass players (JR/SR) in California.

```sql
SELECT
  CASE
    WHEN year in ('FR', 'SO') THEN 'underclass'
    WHEN year in ('JR', 'SR') THEN 'upperclass'
    ELSE NULL
    END AS player_class,
  SUM(weight) AS combined_weight
FROM pachiko.benn_college_football_players
WHERE state = 'CA'
GROUP BY player_class;
```

**Question 6:** Write a query that displays the number of players in each state, with FR, SO, JR, and SR players in separate columns and another column for the total number of players. Order results such that states with the most players come first.

```sql
SELECT
  state,
  COUNT(CASE WHEN year = 'FR' THEN 1 ELSE NULL END) AS fr_count,
  COUNT(CASE WHEN year = 'SO' THEN 1 ELSE NULL END) AS so_count,
  COUNT(CASE WHEN year = 'JR' THEN 1 ELSE NULL END) AS jr_count,
  COUNT(CASE WHEN year = 'SR' THEN 1 ELSE NULL END) AS sr_count,
  COUNT(*) AS total_count
FROM pachiko.benn_college_football_players
GROUP BY state
ORDER BY total_count DESC
```

**Question 7:** Write a query that shows the number of players at schools with names that start with A through M, and the number at schools with names starting with N - Z.

```sql
SELECT CASE WHEN LEFT(school_name, 1) BETWEEN 'A' AND 'M' THEN 'schools_a-m'
            WHEN LEFT(school_name, 1) BETWEEN 'N' AND 'Z' THEN 'schools_n-z'
            ELSE NULL END AS school_name_group,
  COUNT(*)
FROM pachiko.benn_college_football_players
GROUP BY school_name_group;
```

OR

```sql
SELECT CASE WHEN school_name < 'n' THEN 'A-M'
            WHEN school_name >= 'n' THEN 'N-Z'
            ELSE NULL END AS school_name_group,
       COUNT(1) AS players
  FROM benn.college_football_players
 GROUP BY 1
```
