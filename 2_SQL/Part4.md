## Order of execution of a SQL Query

1. `FROM` and `JOIN`s

   - The `FROM` clause, and subsequent `JOIN` clauses are first executed to determine the total working set of data that is being queried.

   - This includes subqueries in thi clause, and can cause temporary tables to be created under the hood containing all the columns and rows of the tales being joined.

2. `WHERE`

   - Once we have the total working set of data, the first-pass `WHERE` constraints are applied to individual rows, an rows that do not satisfy the constraint are discarded.

   - Each of the constraints can only access columns directly from the tables requested in the `FROM` clause.

   - Aliases in `SELECT` part of he query are not accessible in the `WHERE` clause since it is yet to be executed.

3. `GROUP BY`

   - The remaining rows after the `WHERE` constraints are applied are then grouped based on common values in the columns specified in the `GROUP BY` clause.

   - Since it selects only distinct values from the column, it should be used only when there are aggregate functions in the query.

4. `HAVING`

   - If the query has a `GROUP BY` clause, then the constraints of `HAVING` are applied to the grouped rows, discarding the grouped rows that do not satisfy the constraints.

5. `SELECT`

   - Any expressions in the `SELECT` part of te query like aliases, aggregate functions, etc., are now computed.

6. `DISTINCT`

   - Of the remaining rows, rows with duplicate values in the column marked as `DISTINCT` will be discarded.

7. `ORDER BY`

   - If an order is specified by the `ORDER BY` clause, the rows are then sorted by the specified dat in either ascending or descending order.

   - Since all the expressions in the `SELECT` part of the query have been computed, aliases can be referenced in this clause.

8. `LIMIT / OFFSET`

   - Finally, the rows that fall outside the range specified by `LIMIT` and `OFFSET` are discarded.

### Exercise

**Question 1:** Find the number of movies each director has directed

```sql
SELECT director, COUNT(*) AS total_movies
FROM movies
GROUP BY director;
```

**Question 2:** Find the total domestic an international sales that can be attributed to each director

```sql
SELECT director,
    SUM(domestic_sales) AS total_domestic_sales,
    SUM(international_sales) AS total_international_sales,
    SUM(domestic_sales + international_sales) AS total_sales
FROM movies
LEFT JOIN boxoffice
ON movie_id = id
GROUP BY director
```
