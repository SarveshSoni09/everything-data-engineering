## Queries with Expressions

Expressions can be used to write more complex logic on column values in a query. These expressions can use mathematical and string functions along with basic arithmetic to transform values when query is executed.

For Example:

```sql
SELECT particle_speed / 2.0 AS half_particle_speed
FROM physics_data
WHERE ABS(particle_position) * 10.0 > 500;
```

Here alias also plays an important part which is used not only for expression but also for table names while joining. This can be achieved through `AS` clause.

**Syntax**

```sql
SELECT col_expression AS expr_description, …
FROM mytable;
```

```sql
SELECT column AS better_column_name, …
FROM a_long_widgets_table_name AS mywidgets
INNER JOIN widget_sales
  ON mywidgets.id = widget_sales.widget_id;
```

### Exercise

**Question 1:** List all the movies and their combined sales in _millions_ of dollars

```sql
SELECT title, (domestic_sales + international_sales)/1000000 AS sales_in_millions
FROM movies
LEFT JOIN boxoffice
ON movie_id = id;
```

**Question 2:** List all movies and their ratings in _percent_

```sql
SELECT title, rating * 10 AS percent_rating
FROM movies
LEFT JOIN boxoffice
ON movie_id = id;
```

**Question 3:** List all movies that were released on even number year

```sql
SELECT title, year
FROM movies
WHERE year % 2 = 0;
```

## Queries with Aggregates

SQL has **aggregte expressions** that allow to summarize information about a group of rows of data. This helps us answer questions like _"How many movies has Pixar produced?"_ or _"What is the highest grossing Pixar film each year?"_

Common Aggregate functions:

- `COUNT(*), COUNT(col)`: Count number of rows, Count number of `non-NULL` values in a column
- `MIN(col)`: Find smallest value in specified column
- `MAX(col)`: Find largest value in specified column
- `AVG(col)`: Find average numerical value in specified column
- `SUM(col)`: Find sum of all values in specified column

**Syntax**

```sql
SELECT AGG_FUNC(column_or_expression) AS aggregate_description, …
FROM mytable
WHERE constraint_expression;
```

### Grouped Aggregate Functions

Aggregate unctions can be implemented on specific groups of data by using the `GROUP BY` clause. It works by grouping rows that have same value in the column specified. For example in a `movies` table, we can add `GROUP BY` clause on column `genre` with aggregate function of `AVG` on `sales` to calculate genre-wise sales.

**Syntax**

```sql
SELECT AGG_FUNC(column_or_expression) AS aggregate_description, …
FROM mytable
WHERE constraint_expression
GROUP BY column;
```

### Exercise

**Question 1:** Find the longest time that an employee has been at the studio

```sql
SELECT MAX(years_employed) AS longest_time
FROM employees;
```

**Question 2:** For each role, find the average number of years employed by employees in that role

```sql
SELECT role, AVG(years_employed) AS avg_years_by_role
FROM employees
GROUP BY role;
```

**Question 3:** Find the total number of employee years worked in each building

```sql
SELECT building, SUM(years_employed) AS building_years
FROM employees
GROUP BY building;
```

## `HAVING` Clause

When `WHERE` clause would be used in `SELECT` queries, it filters rows post select execution.  
But, when we implement `WHERE` clause along with `GROUP BY` clause, what the `WHERE` clause does is it filters the rows before grouping them based on the `GROUP BY` clause.  
That's where **_`HAVING`_** comes in, to filter the result post `GROUP BY` execution.

**Syntax**

```sql
SELECT group_by_column, AGG_FUNC(column_expression) AS aggregate_result_alias, …
FROM mytable
WHERE condition
GROUP BY column
HAVING group_condition;
```

### Exercise

**Question 1:** Find th number of Artists in the studio (Without `HAVING` clause)

```sql
SELECT COUNT(*) AS count_of_artists
FROM employees
WHERE role = "Artist";
```

**Question 2:** Find the number of Employees of each role in the studio

```sql
SELECT role, COUNT(*) AS employee_count
FROM employees
GROUP BY role;
```

**Question 3:** Find the total number of years employed by all engineers

```sql
SELECT role, SUM(years_employed) AS total_years
FROM employees
GROUP BY role
HAVING role = "Engineer";
```
