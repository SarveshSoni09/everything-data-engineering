# Advanced SQL Implementations

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
