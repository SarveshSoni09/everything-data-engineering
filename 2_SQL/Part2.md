# Basic SQL - Part 2

## JOIN or INNER JOIN Query

This queries are used to join two or more tables to get complex and more informative data that was normalized for Database efficiency. First we will look into `JOIN` or `INNER JOIN` which are both technically same in `SQL` but we can mention them separately just to make it more easy to understand. What this `JOIN / INNER JOIN` will do is it will merge he rows from two tables based upon the equality of a common Attribute `(Primary Key)`.

### Syntax

```sql
SELECT column, another_table_column, …
FROM mytable
INNER JOIN another_table
    ON mytable.id = another_table.id
WHERE condition(s)
ORDER BY column, … ASC/DESC
LIMIT num_limit OFFSET num_offset;
```

### Exercise

**Question 1:** Find the domestic and international sales for each movie

```sql
SELECT id, title, domestic_sales, international_sales
FROM movies
INNER JOIN boxoffice
ON movies.id = boxoffice.movie_id;
```

**Question 2:** Show the sales numbers for each movie that did better internationally than domestically

```sql
SELECT id, title, domestic_sales, international_sales
FROM movies
INNER JOIN boxoffice
ON movies.id = boxoffice.movie_id
WHERE international_sales > domestic_sales;
```

**Question 3:** List all the movies by their ratings in descending order

```sql
SELECT id, title, rating
FROM movies
INNER JOIN boxoffice
ON movies.id = boxoffice.movie_id
ORDER BY rating DESC;
```

## LEFT, RIGHT and FULL JOIN Query

These joins are used whn tables have asymmetric data and we need all the data from one of the table without losing any rows while still joined to another table.  
While joining table `A` to table `B`, a `LEFT JOIN` simply includes all rows from `A`, regardless of whether a matching row is found in `B`.  
A `RIGHT JOIN` does the same while keeping all the rows from `B`.  
And finally, a `FULL JOIN` keeps the rows from both tables `A` and `B`. The rows with unmatched data in all these tables are filled with `NULL`values

### Syntax

```sql
SELECT column, another_column, …
FROM mytable
INNER/LEFT/RIGHT/FULL JOIN another_table
    ON mytable.id = another_table.matching_id
WHERE condition(s)
ORDER BY column, … ASC/DESC
LIMIT num_limit OFFSET num_offset;
```

### Exercise

**Question 1:** Find the list of all buildings that have employees

```sql
SELECT DISTINCT building FROM employees;
```

**Question 2:** Find the list of all buildings and their capacity

```sql
SELECT * FROM buildings;
```

**Question 3:** List all the buildings and distinct employee roles in each building (including empty buildings)

```sql
SELECT DISTINCT building_name, role
FROM buildings
LEFT JOIN employees
ON building_name = building;
```

## Dealing with NULL values

It is always good to reduce `NULL` values in the databases because they require special attention when constructing queries, constraints, etc.  
An alternate to `NULL` values in the database is to have **data-type appropriate default values** like 0 for numeric data, "" for string data, etc.  
If it is not possible to avoid `NULL`, we need to deal with it through `WHERE` clause using `IS NULL` or `IS NOT NULL` clauses.

### Syntax

```sql
SELECT column, another_column, …
FROM mytable
WHERE column IS/IS NOT NULL
AND/OR another_condition
AND/OR …;
```

### Exercise

**Question 1:** Find the name and role of all employees who have not been assigned to a building

```sql
SELECT name, role FROM employees
WHERE building IS NULL;
```

**Question 2:** Find the names of the buildings that hold no employees

```sql
SELECT DISTINCT building_name FROM buildings
LEFT JOIN employees
ON building_name = building
WHERE building IS NULL;
```
