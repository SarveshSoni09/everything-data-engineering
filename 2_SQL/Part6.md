# Advanced SQL Implementations 2

Most SQL functions are specific to certain data types, but using a particular function will often convert the data to the appropriate type. Functions like `LEFT`, `RIGHT`, and `TRIM` are used to select certain elements of strings, but they can also be applied to numbers or dates, treating them as strings for the purpose of the function.

## LEFT, RIGHT, and LENGTH Functions

### LEFT

The `LEFT` function pulls a specified number of characters from the left side of a string. The syntax is `LEFT(string, number of characters)`.

**Example:**

```sql
SELECT incidnt_num,
       date,
       LEFT(date, 10) AS cleaned_date
  FROM tutorial.sf_crime_incidents_2014_01
```

### RIGHT

The `RIGHT` function works similarly to `LEFT`, but extracts characters from the right side of a string.

**Example:**

```sql
SELECT incidnt_num,
       date,
       LEFT(date, 10) AS cleaned_date,
       RIGHT(date, 17) AS cleaned_time
  FROM tutorial.sf_crime_incidents_2014_01
```

### LENGTH

The `LENGTH` function returns the length of a string. This is particularly useful when combined with `LEFT` or `RIGHT` to extract strings of varying lengths.

**Example:**

```sql
SELECT incidnt_num,
       date,
       LEFT(date, 10) AS cleaned_date,
       RIGHT(date, LENGTH(date) - 11) AS cleaned_time
  FROM tutorial.sf_crime_incidents_2014_01
```

> **Note:** When using functions within other functions, the innermost functions are evaluated first, followed by the functions that encapsulate them.

## TRIM Function

The `TRIM` function removes characters from the beginning and/or end of a string. It takes three arguments:

1. The position to trim from: `'leading'`, `'trailing'`, or `'both'`
2. The characters to be trimmed (enclosed in single quotes)
3. The text to trim (specified with `FROM`)

**Syntax:**

```sql
TRIM([leading|trailing|both] 'characters' FROM string)
```

**Example:**

```sql
SELECT location,
       TRIM(both '()' FROM location) AS cleaned_location
  FROM tutorial.sf_crime_incidents_2014_01
```

## POSITION and STRPOS Functions

### POSITION

The `POSITION` function allows you to specify a substring and returns a numerical value equal to the character number (counting from left) where that substring first appears in the target string. The syntax is case-sensitive.

**Syntax:**

```sql
POSITION('substring' IN string)
```

**Example:**

```sql
SELECT incidnt_num,
       descript,
       POSITION('A' IN descript) AS a_position
  FROM tutorial.sf_crime_incidents_2014_01
```

### STRPOS

The `STRPOS` function achieves the same results as `POSITION`, but with slightly different syntax. Instead of using `IN`, you use a comma and switch the order of the string and substring.

**Syntax:**

```sql
STRPOS(string, 'substring')
```

**Example:**

```sql
SELECT incidnt_num,
       descript,
       STRPOS(descript, 'A') AS a_position
  FROM tutorial.sf_crime_incidents_2014_01
```

> **Important:** Both `POSITION` and `STRPOS` are case-sensitive. To search regardless of case, use `UPPER` or `LOWER` functions on the entire string.

## SUBSTR Function

While `LEFT` and `RIGHT` create substrings starting from the sides of an existing string, `SUBSTR` allows you to start from any position within the string, including the middle.

**Syntax:**

```sql
SUBSTR(string, starting_character_position, number_of_characters)
```

**Example:**

```sql
SELECT incidnt_num,
       date,
       SUBSTR(date, 4, 2) AS day
  FROM tutorial.sf_crime_incidents_2014_01
```

## CONCAT Function

The `CONCAT` function combines strings from several columns together (and with hard-coded values). Simply order the values you want to concatenate and separate them with commas. Hard-coded values should be enclosed in single quotes.

**Example:**

```sql
SELECT incidnt_num,
       day_of_week,
       LEFT(date, 10) AS cleaned_date,
       CONCAT(day_of_week, ', ', LEFT(date, 10)) AS day_and_date
  FROM tutorial.sf_crime_incidents_2014_01
```

### Alternative: Pipe Operator (||)

You can also use two pipe characters (`||`) to perform the same concatenation:

**Example:**

```sql
SELECT incidnt_num,
       day_of_week,
       LEFT(date, 10) AS cleaned_date,
       day_of_week || ', ' || LEFT(date, 10) AS day_and_date
  FROM tutorial.sf_crime_incidents_2014_01
```

## UPPER and LOWER Functions

The `UPPER` function converts all characters in a string to uppercase, while the `LOWER` function converts all characters to lowercase.

**Example:**

```sql
SELECT incidnt_num,
       address,
       UPPER(address) AS address_upper,
       LOWER(address) AS address_lower
  FROM tutorial.sf_crime_incidents_2014_01
```

> **Note:** Different databases may have subtle variations on these functions. Be sure to consult your database's documentation for specific syntax.

## Turning Strings into Dates

Dates are frequently in incorrect formats in SQL databases, often due to:

- Data manipulation in Excel that changed dates to formats like MM/DD/YYYY
- Manual data entry using inconsistent formatting conventions
- Use of text (Jan, Feb, etc.) instead of numbers for months

To take advantage of date functionality (like `INTERVAL`), you need properly formatted date fields. This often involves text manipulation followed by a `CAST`.

**Example:**

```sql
SELECT incidnt_num,
       date,
       (SUBSTR(date, 7, 4) || '-' || LEFT(date, 2) ||
        '-' || SUBSTR(date, 4, 2))::date AS cleaned_date
  FROM tutorial.sf_crime_incidents_2014_01
```

You can cast the result as `date` or `timestamp` (which includes additional precision for hours, minutes, and seconds).

## Turning Dates into More Useful Dates

Once you have a well-formatted date field, you can manipulate it in various ways.

### EXTRACT Function

The `EXTRACT` function pulls specific parts from a date field, such as year, month, day, hour, minute, second, decade, or day of week.

**Example:**

```sql
SELECT cleaned_date,
       EXTRACT('year'   FROM cleaned_date) AS year,
       EXTRACT('month'  FROM cleaned_date) AS month,
       EXTRACT('day'    FROM cleaned_date) AS day,
       EXTRACT('hour'   FROM cleaned_date) AS hour,
       EXTRACT('minute' FROM cleaned_date) AS minute,
       EXTRACT('second' FROM cleaned_date) AS second,
       EXTRACT('decade' FROM cleaned_date) AS decade,
       EXTRACT('dow'    FROM cleaned_date) AS day_of_week
  FROM tutorial.sf_crime_incidents_cleandate
```

### DATE_TRUNC Function

The `DATE_TRUNC` function rounds a date to whatever precision you specify. The value displayed is the first value in that period. For example, when you `DATE_TRUNC` by year, any value in that year will be listed as January 1st of that year.

**Example:**

```sql
SELECT cleaned_date,
       DATE_TRUNC('year'   , cleaned_date) AS year,
       DATE_TRUNC('month'  , cleaned_date) AS month,
       DATE_TRUNC('week'   , cleaned_date) AS week,
       DATE_TRUNC('day'    , cleaned_date) AS day,
       DATE_TRUNC('hour'   , cleaned_date) AS hour,
       DATE_TRUNC('minute' , cleaned_date) AS minute,
       DATE_TRUNC('second' , cleaned_date) AS second,
       DATE_TRUNC('decade' , cleaned_date) AS decade
  FROM tutorial.sf_crime_incidents_cleandate
```

### Current Date and Time Functions

You can retrieve the current date and time using various functions. These can be run without a `FROM` clause:

**Example:**

```sql
SELECT CURRENT_DATE AS date,
       CURRENT_TIME AS time,
       CURRENT_TIMESTAMP AS timestamp,
       LOCALTIME AS localtime,
       LOCALTIMESTAMP AS localtimestamp,
       NOW() AS now
```

The different options vary in precision. Note that these times are typically in Coordinated Universal Time (UTC), which is the same as GMT.

### AT TIME ZONE

You can make a time appear in a different time zone using `AT TIME ZONE`:

**Example:**

```sql
SELECT CURRENT_TIME AS time,
       CURRENT_TIME AT TIME ZONE 'PST' AS time_pst
```

> **Note:** Timestamp functionality can be complex because timestamps can be stored with or without timezone metadata. Consult your database documentation for exact syntax.

## COALESCE Function

The `COALESCE` function is used to replace null values with actual values. This is particularly useful in numerical data (where displaying nulls as 0 is often preferable) and when performing outer joins that result in some unmatched rows.

**Example:**

```sql
SELECT incidnt_num,
       descript,
       COALESCE(descript, 'No Description') AS description
  FROM tutorial.sf_crime_incidents_cleandate
 ORDER BY descript DESC
```

## Exercises

**Question 1:** Write a query that shows exactly how long ago each incident was reported. Assume that the dataset is in Pacific Standard Time (UTC - 8).

```sql
SELECT category_code,
  COUNT(CASE WHEN acquisitions.acquired_at_cleaned - companies.founded_at_clean::timestamp <= '3 years' THEN 1 ELSE NULL END) AS less_than_3_year,
  COUNT(CASE WHEN acquisitions.acquired_at_cleaned - companies.founded_at_clean::timestamp <= '5 years' THEN 1 ELSE NULL END) AS less_than_5_year,
  COUNT(CASE WHEN acquisitions.acquired_at_cleaned - companies.founded_at_clean::timestamp <= '10 years' THEN 1 ELSE NULL END) AS less_than_10_year,
  COUNT(*) AS total_companies_acquired
FROM tutorial.crunchbase_companies_clean_date companies
JOIN tutorial.crunchbase_acquisitions_clean_date acquisitions
ON acquisitions.company_permalink = companies.permalink
WHERE companies.founded_at_clean IS NOT NULL
GROUP BY category_code
ORDER BY total_companies_acquired DESC;
```

**Question 2:** Write a query that separates the `location` field into separate fields for latitude and longitude. You can compare your results against the actual `lat` and `lon` fields in the table.

```sql
SELECT location,
       TRIM(leading '(' FROM LEFT(location, POSITION(',' IN location) - 1)) AS lattitude,
       TRIM(trailing ')' FROM RIGHT(location, LENGTH(location) - POSITION(',' IN location) ) ) AS longitude
  FROM tutorial.sf_crime_incidents_2014_
```

**Question 3:** Concatenate the `lat` and `lon` fields to form a field that is equivalent to the `location` field. (Note that the answer will have a different decimal precision.)

```sql
SELECT CONCAT('(', lat, ', ', lon, ')') AS lat_lon, location
  FROM tutorial.sf_crime_incidents_2014_01
```

**Question 4:** Create the same concatenated location field, but using the `||` syntax instead of `CONCAT`.

```sql
SELECT '(' || lat || ', ' || lon || ')' AS lat_lon, location
  FROM tutorial.sf_crime_incidents_2014_01
```

**Question 5:** Write a query that creates a date column formatted YYYY-MM-DD.

```sql
SELECT incidnt_num,
       date,
       SUBSTR(date, 7, 4) || '-' || SUBSTR(date, 1, 2) || '-' || SUBSTR(date, 4, 2) AS formatted_date
  FROM tutorial.sf_crime_incidents_2014_01
```

**Question 6:** Write a query that returns the `category` field, but with the first letter capitalized and the rest of the letters in lower-case.

```sql
SELECT incidnt_num,
       category,
       LEFT(category, 1) || LOWER(SUBSTR(category, 2)) AS capitalized_category
  FROM tutorial.sf_crime_incidents_2014_01
```

**Question 7:** Write a query that creates an accurate timestamp using the `date` and `time` columns in `tutorial.sf_crime_incidents_2014_01`. Include a field that is exactly 1 week later as well.

```sql
SELECT incidnt_num, date, time,
       (SUBSTR(date, 7, 4) || '-' || LEFT(date, 2) ||
        '-' || SUBSTR(date, 4, 2) || ' ' || time || ':00')::timestamp AS timestamp,
       (SUBSTR(date, 7, 4) || '-' || LEFT(date, 2) ||
        '-' || SUBSTR(date, 4, 2) || ' ' || time || ':00')::timestamp
        + INTERVAL '1 week' AS timestamp_plus_interval
  FROM tutorial.sf_crime_incidents_2014_01
```

**Question 8:** Write a query that counts the number of incidents reported by week. Cast the week as a date to get rid of the hours/minutes/seconds.

```sql
SELECT DATE_TRUNC('week', cleaned_date)::date AS week_date,
COUNT(*) AS weekly_incidnt_count
FROM tutorial.sf_crime_incidents_cleandate
GROUP BY week_date
ORDER BY week_date;
```

**Question 9:** Write a query that shows exactly how long ago each incident was reported. Assume that the dataset is in Pacific Standard Time (UTC - 8).

```sql
SELECT incidnt_num,
       cleaned_date,
       NOW() AT TIME ZONE 'PST' AS now,
       NOW() AT TIME ZONE 'PST' - cleaned_date AS time_ago
  FROM tutorial.sf_crime_incidents_cleandate
```
