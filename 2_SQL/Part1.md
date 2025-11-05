## SELECT Query

This is a very simple query where we need to write `SELECT` statements to retrieve data from a SQL Database

### Syntax

```SQL
SELECT column, another_column, ...
FROM mytable;
```

### Exercise

**Problem 1:** Find the `title` of each film

```sql
SELECT title FROM movies;
```

**Problem 2:** Find the `director` of each film

```sql
SELECT director FROM movies;
```

**Problem 3:** Find the `title` and `director` of each film

```sql
SELECT title, director FROM movies;
```

**Problem 4:** Find the `title` and `year` of each film

```sql
SELECT title, year FROM movies;
```

**Problem 5:** Find `all` the information about each film

```sql
SELECT * FROM movies;
```

## Queries With Constraints

In order to filter certain results from being returned through `SELECT` query, we use `WHERE` clause in the query. `WHERE` clause can become more powerful with `AND` or `OR` clause.

### Syntax

```sql
SELECT column, another_column, …
FROM mytable
WHERE condition
    AND/OR another_condition
    AND/OR …;
```

### `WHERE` Query in Numerical Data

- `=, !=, <, <=, >, >=` are Standard Numerical Operators
- `BETWEEN ___ AND ___` return values within range of two values
- `NOT BETWEEN ___ AND ___` return values not within range of two values
- `IN (___)` returns values that exist in a list
- `NOT IN (___)` returns values that do not exist in a list

### Exercise

**Problem 1:** Find the movie with row `id` of 6

```sql
SELECT * FROM movies WHERE id = 6;
```

**Problem 2:** Find the movies released in `years` between 2000 and 2010

```sql
SELECT * FROM movies
WHERE year BETWEEN 2000 and 2010;
```

**Problem 3:** Find the movies not released in `years` between 2000 and 2010

```sql
SELECT * FROM movies
WHERE year NOT BETWEEN 2000 and 2010;
```

**Problem 4:** Find the first 5 Pixar movies and their release `year`

```sql
SELECT title, year FROM movies
WHERE id <= 5
```

### `WHERE` Query in String Data

- `=, != or <>` are case sensitive comparison operators
- `LIKE, NOT LIKE` are case insensitive comparison operators
- `%` Used anywhere in a string to match a sequence of zero or more characters (only with LIKE or NOT LIKE)
- `_` Used anywhere in a string to match a single character (only with LIKE or NOT LIKE)
- `IN (___)` returns values that exist in a list
- `NOT IN (___)` returns values that do not exist in a list

### Exercise

**Problem 1:** Find all the Toy Story movies

```sql
SELECT * FROM movies
WHERE title LIKE "Toy Story%;
```

**Problem 2:** Find all the movies directed by John Lasseter

```sql
SELECT title FROM movies
WHERE director = "John Lasseter";
```

**Problem 3:** Find all the movies (and director) not directed by John Lasseter

```sql
SELECT title, director FROM movies
WHERE director <> "John Lasseter";
```

**Problem 4:** Find all the WALL-\* movies

```sql
SELECT * FROM movies
WHERE title LIKE "WALL-_"
```

## Filtering and Sorting Query results

We can discard duplicate values using `DISTINCT` clause.  
Further, we can also sort results using `ORDER BY` clause with `ASC` or `DESC`.  
Next, we have `LIMIT` clause to display only certain number of rows.  
Finally we can use `OFFSET` clause with limit to specify from where should `LIMIT` be effective

### Syntax

```sql
SELECT DISTINCT column, another_column, …
FROM mytable
WHERE condition(s);
```

```sql
SELECT column, another_column, …
FROM mytable
WHERE condition(s)
ORDER BY column ASC/DESC;
```

```sql
SELECT column, another_column, …
FROM mytable
WHERE condition(s)
ORDER BY column ASC/DESC
LIMIT num_limit OFFSET num_offset;
```

### Exercise

**Question 1:** List all directors of Pixar movies (alphabetically), without duplicates

```sql
SELECT DISTINCT director from movies
ORDER BY director;
```

**Question 2:** List the last 4 Pixar movies released (ordered from most recent to least)

```sql
SELECT * FROM movies
ORDER BY year DESC
LIMIT 4;
```

**Question 3:** List the first five Pixar movies sorted alphabetically

```sql
SELECT * FROM movies
ORDER BY title
LIMIT 5;
```

**Question 4:** List the next five Pixar movies sorted alphabetically

```sql
SELECT * FROM movies
ORDER BY title
LIMIT 5 OFFSET 5;
```

## Practice More

### Exercise

**Question 1:** List all the Canadian cities and their populations

```sql
SELECT city, population FROM north_american_cities
WHERE country = "Canada";
```

**Question 2:** Order all the cities in the United States by their latitude from north to south

```sql
SELECT city FROM north_american_cities
WHERE country = "United States"
ORDER BY latitude DESC;
```

**Question 1:** List all the cities west of Chicago, ordered from west to east

```sql
SELECT * FROM north_american_cities
WHERE longitude < -87.629798
ORDER BY longitude;
```

**Question 1:** List the two largest cities in Mexico by population

```sql
SELECT * FROM north_american_cities
WHERE country = "Mexico"
ORDER BY population DESC
LIMIT 2;
```

**Question 1:** List the third and fourth largest cities by population in he United States and their population

```sql
SELECT * FROM north_american_cities
WHERE country = "United States"
ORDER BY population DESC
LIMIT 2 OFFSET 2;
```
