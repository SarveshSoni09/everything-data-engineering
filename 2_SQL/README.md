# SQL Tutorial

## What is SQL?

SQL, or Structured Query Language, is a language designed to allow both technical and non-technical users to query, manipulate, and transform data from a relational database. Due to its simplicity, SQL databases provide safe and scalable storage for millions of websites and mobile applications.

SQL databases represent a collection of related (two-dimensional) tables. Each table is similar to an Excel spreadsheet, with a fixed number of named columns (the attributes or properties of the table) and any number of rows of data.

## Structure

Learning of SQL is divided into **9 parts**, organized into three progressive levels:

### Basic SQL (Parts 1-3)

**Part 1: SELECT Queries and Filtering**

- Introduction to `SELECT` statements for retrieving data
- Using `WHERE` clause with numerical and string data
- Filtering and sorting query results with `DISTINCT`, `ORDER BY`, `LIMIT`, and `OFFSET`
- Practice exercises with real-world examples

**Part 2: Table Joins**

- `INNER JOIN` and `JOIN` operations for combining data from multiple tables
- `LEFT JOIN`, `RIGHT JOIN`, and `FULL JOIN` for handling asymmetric data
- Dealing with `NULL` values in queries
- Practical exercises demonstrating different join types

**Part 3: Expressions and Aggregations**

- Using expressions and mathematical operations in queries
- Column aliases with `AS` clause
- Aggregate functions: `COUNT`, `MIN`, `MAX`, `AVG`, `SUM`
- `GROUP BY` clause for grouped aggregations
- `HAVING` clause for filtering grouped results

### Intermediate SQL (Parts 4-6)

**Part 4: Query Execution Order**

- Understanding the order of execution in SQL queries
- How `FROM`, `JOIN`, `WHERE`, `GROUP BY`, `HAVING`, `SELECT`, `DISTINCT`, `ORDER BY`, and `LIMIT/OFFSET` are processed
- Practical implications of execution order on query performance

**Part 5: CASE Statements**

- Conditional logic with `CASE` statements (if/then/else)
- Using `CASE` with aggregate functions
- Pivoting data using `CASE` statements
- Advanced conditional queries and data transformation

**Part 6: String and Date Functions**

- String manipulation functions: `LEFT`, `RIGHT`, `LENGTH`, `TRIM`, `POSITION`, `STRPOS`, `SUBSTR`, `CONCAT`
- String case functions: `UPPER`, `LOWER`
- Date and time functions: `EXTRACT`, `DATE_TRUNC`, `CURRENT_DATE`, `CURRENT_TIME`, `NOW()`
- Time zone handling with `AT TIME ZONE`
- `COALESCE` function for handling NULL values
- Converting between string and date formats

### Advanced SQL (Parts 7-9)

**Part 7: Subqueries**

- Introduction to subqueries (inner/nested queries)
- Subqueries in `FROM` clause
- Using subqueries for multi-stage aggregations
- Subqueries in conditional logic (`WHERE`, `JOIN/ON`, `CASE`)
- Joining subqueries for complex data analysis
- Combining subqueries with `UNION` operations

**Part 8: Window Functions**

- Understanding window functions vs aggregate functions
- `OVER`, `PARTITION BY`, and `ORDER BY` clauses
- Window aggregate functions: `SUM`, `COUNT`, `AVG` over windows
- Ranking functions: `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`
- `NTILE()` for percentiles and quartiles
- `LAG()` and `LEAD()` for accessing previous/next row values
- Window aliases for cleaner queries

**Part 9: Performance Tuning and Data Pivoting**

- SQL performance tuning strategies
- Reducing table size and optimizing joins
- Using `EXPLAIN` to analyze query plans
- Pivoting rows to columns using `CASE` statements
- Pivoting columns to rows using `CROSS JOIN`
- Best practices for query optimization

## Content Credits

This tutorial content has been adapted and compiled from the following excellent resources:

1. **[SQLBolt](https://sqlbolt.com/lesson/)** - Interactive SQL lessons and exercises that provide a hands-on approach to learning SQL fundamentals.

2. **[Mode SQL Tutorial](https://mode.com/sql-tutorial)** - Comprehensive SQL tutorial covering basic to advanced topics with practical examples and exercises.

We are grateful to these platforms for providing high-quality educational content that has helped structure this comprehensive SQL learning resource.

---

**Note:** This tutorial follows the common SQL language standard, which is supported by popular SQL databases including SQLite, MySQL, Postgres, Oracle, and Microsoft SQL Server. Some syntax may vary slightly between database implementations.
