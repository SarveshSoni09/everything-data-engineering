## Queries with Expressions

Expressions can be used to write more complex logic on column values in a query. These expressions can use mathematical and string functions along with basic arithmetic to transform values when query is executed.

For Example:

```sql
SELECT particle_speed / 2.0 AS half_particle_speed
FROM physics_data
WHERE ABS(particle_position) * 10.0 > 500;
```

Here alias also plays an important part which is used not only for expression but also for table names while joining. This can be achieved through `AS` clause.

### Syntax

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
