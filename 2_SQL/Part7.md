# Advanced SQL Implementations 1

## SQL Subqueries

Subqueries (also known as inner queries or nested queries) are a tool for performing operations in multiple steps. For example, if you wanted to take the sums of several columns, then average all of those values, you'd need to do each aggregation in a distinct step. With subqueries, you can write SQL queries to combine this multiple steps and return the result.

Let's understand the syntax with a simple example by using subquery within a `FROM` clause.

```sql
SELECT sub.*
  FROM (
        SELECT *
          FROM tutorial.sf_crime_incidents_2014_01
         WHERE day_of_week = 'Friday'
       ) sub
 WHERE sub.resolution = 'NONE'
```

First, the database runs the "inner query"—the part between the parentheses. Once the inner query runs, the outer query will run using the results from the inner query as its underlying table. Subqueries are required to have names, which are added after parentheses the same way you would add an alias to a normal table. In this case, we've used the name "sub."

**Question 1:**

```sql
SELECT sub.*
    FROM (
        SELECT *
            FROM tutorial.sf_crime_incidents_2014_01
            WHERE descript = 'WARRANT ARREST'
        ) sub
WHERE sub.resolution = 'NONE'
```

### Using Subqueries to Aggregate in Multiple Stages

What if you wanted to know how many incidents happen, on average, on a Friday in December? In January? There are two steps to this process: counting the number of incidents each day (inner query), then determining the monthly average (outer query)

```sql
SELECT LEFT(sub.date, 2) AS cleaned_month,
       sub.day_of_week,
       AVG(sub.incidents) AS average_incidents
  FROM (
        SELECT day_of_week,
               date,
               COUNT(incidnt_num) AS incidents
          FROM tutorial.sf_crime_incidents_2014_01
         GROUP BY 1,2
       ) sub
 GROUP BY 1,2
 ORDER BY 1,2
```

**Question 2:** Write a query that displays the average number of monthly incidents for each category. Hint: use tutorial.sf_crime_incidents_cleandate to make your life a little easier.

```sql
SELECT sub.category, AVG(sub.incidents) AS avg_monthly_count
FROM (
  SELECT EXTRACT('month' FROM cleaned_date) AS month,
         category,
         COUNT(incidnt_num) AS incidents
  FROM tutorial.sf_crime_incidents_cleandate
  GROUP BY month, category
) sub
GROUP BY sub.category
ORDER BY avg_monthly_count DESC;
```

### Subqueries in Conditional Logic

Subqueries can be used in conditional logic (in conjunction with WHERE, JOIN/ON, or CASE). The following query returns all of the entries from the earliest date in the dataset

```sql
SELECT *
  FROM tutorial.sf_crime_incidents_2014_01
 WHERE Date = (SELECT MIN(date)
                 FROM tutorial.sf_crime_incidents_2014_01
              )
```

Most conditional logic will work with subqueries containing one-cell results. However ,`IN` is the only type of conditional logic that will work when the query contains multiple results.

```sql
SELECT *
  FROM tutorial.sf_crime_incidents_2014_01
 WHERE Date IN (SELECT date
                 FROM tutorial.sf_crime_incidents_2014_01
                ORDER BY date
                LIMIT 5
              )
```

**Note** that you should not include an alias when you write a subquery in a conditional statement. This is because the subquery is treated as an individual value (or set of values in the IN case) rather than as a table.

### Joining Subqueries

In the above example, instead of filtering with `WHERE` clause, it is a better practice to us joins and return the same result.

```sql
SELECT *
  FROM tutorial.sf_crime_incidents_2014_01 incidents
  JOIN ( SELECT date
           FROM tutorial.sf_crime_incidents_2014_01
          ORDER BY date
          LIMIT 5
       ) sub
    ON incidents.date = sub.date
```

Using it with aggregate functions can be more useful. This would add a column of incidents that day to the original table.

```sql
SELECT incidents.*,
       sub.incidents AS incidents_that_day
  FROM tutorial.sf_crime_incidents_2014_01 incidents
  JOIN ( SELECT date,
          COUNT(incidnt_num) AS incidents
           FROM tutorial.sf_crime_incidents_2014_01
          GROUP BY 1
       ) sub
    ON incidents.date = sub.date
 ORDER BY sub.incidents DESC, time
```

**Qustion 3:** Write a query that displays all rows from the three categories with the fewest incidents reported

```sql
SELECT incidents.*, sub.incidents AS total_incidents_in_category
FROM tutorial.sf_crime_incidents_2014_01 incidents
RIGHT JOIN (SELECT category, COUNT(incidnt_num) AS incidents
            FROM tutorial.sf_crime_incidents_2014_01 incidents
            GROUP BY category
            ORDER BY incidents
            LIMIT 3
           ) sub
ON incidents.category = sub.category
```

** Question 4:** Write a query that counts the number of companies founded and acquired by quarter starting in Q1 2012. Create the aggregations in two separate queries, then join them.

```sql
SELECT COALESCE(acquisitions.quarter, investments.quarter) AS quarter,
      acquisitions.companies_acquired,
      investments.companies_rec_investment
  FROM (
        SELECT acquired_quarter AS quarter,
              COUNT(DISTINCT company_permalink) AS companies_acquired
          FROM tutorial.crunchbase_acquisitions
          WHERE acquired_year >= 2012
        GROUP BY 1
      ) acquisitions

  FULL JOIN (
        SELECT funded_quarter AS quarter,
              COUNT(DISTINCT company_permalink) AS companies_rec_investment
          FROM tutorial.crunchbase_investments
          WHERE funded_year >= 2012
        GROUP BY 1
      )investments

    ON acquisitions.quarter = investments.quarter
ORDER BY 1 DESC
```

### Subqueries and UNIONs

Let's look at a straight forward example to understand this.

```sql
SELECT COUNT(*) AS total_rows
  FROM (
        SELECT *
          FROM tutorial.crunchbase_investments_part1

         UNION ALL

        SELECT *
          FROM tutorial.crunchbase_investments_part2
       ) sub
```

**Question 5:** Write a query that ranks investors from the combined dataset above by the total number of investments they have made.

```sql
SELECT investor_name, COUNT(*) AS investments
  FROM (
        SELECT *
          FROM tutorial.crunchbase_investments_part1
         UNION ALL
        SELECT *
          FROM tutorial.crunchbase_investments_part2
       ) sub
GROUP BY 1
ORDER BY 2 DESC
```

**Question 6: ** Write a query that does the same thing as in the previous problem, except only for companies that are still operating. Hint: operating status is in tutorial.crunchbase_companies.

```sql
SELECT investments.investor_name,
       COUNT(investments.*) AS investments
  FROM tutorial.crunchbase_companies companies
  JOIN (
        SELECT *
          FROM tutorial.crunchbase_investments_part1
         UNION ALL
         SELECT *
           FROM tutorial.crunchbase_investments_part2
       ) investments
    ON investments.company_permalink = companies.permalink
 WHERE companies.status = 'operating'
 GROUP BY 1
 ORDER BY 2 DESC
```
