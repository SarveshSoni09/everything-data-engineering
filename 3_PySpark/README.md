# PySpark

## Overview

This folder contains documentation and practical notebooks covering PySpark, the Python API for Apache Spark. Apache Spark is a distributed computing engine that allows processing of large-scale data across clusters of computers. PySpark enables Python developers to leverage Spark's distributed processing capabilities for big data analytics, data transformation, and machine learning tasks.

## Contents

The documentation is organized into **6 parts**, progressing from Spark fundamentals to advanced data transformations and file operations:

### Part 1: Introduction (`01_Introduction.md`)

Covers the fundamentals of Apache Spark:

- **What is Apache Spark:** Distributed computing engine for processing large datasets
- **Features:** In-memory processing, unified engine for SQL, streaming, ML, and graph processing
- **Spark Architecture:**
  - RDD (Resilient Distributed Dataset) concepts
  - DAG (Directed Acyclic Graph) for execution planning
  - Components: Driver Program, Cluster Manager, Worker Nodes, Executors
  - Workflow from code to execution
- **Spark Components:**
  - Spark Core (the engine)
  - Spark SQL (DataFrames and SQL queries)
  - Spark Streaming (real-time processing)
  - MLlib (machine learning)
  - GraphX (graph processing)
- **Lazy Evaluation:** How Spark optimizes transformations before execution
- **Spark Jobs, Stages, and Tasks:** Understanding execution units and data movement (shuffles)

### Part 2: Reading Files (`02_Reading_Files.ipynb`)

Covers reading data from various file formats:

- Reading JSON files using `spark.read.json()`
- Reading CSV files using `spark.read.csv()`
- File reading options: `header`, `inferSchema`
- Defining custom schemas using DDL (Data Definition Language) method
- Schema validation and data type specifications

### Part 3: Basic Transformations (`03_Basic_Transformations.ipynb`)

Covers fundamental DataFrame operations:

- **LIMIT:** Restricting the number of rows returned
- **SELECT:** Selecting specific columns from DataFrames
  - Direct column name selection
  - Using `col()` function
- **ALIAS:** Renaming columns using `.alias()`
- **FILTER / WHERE:** Filtering data based on conditions
  - Single condition filtering
  - Multiple conditions with logical operators (`&`, `|`)
  - Handling NULL values with `isNull()` and `isNotNull()`
  - Using `isin()` for multiple value matching
- **withColumn:** Adding new columns or modifying existing ones
  - Creating columns with default values
  - Creating calculated columns
  - Replacing values in columns
- **SORT / ORDER BY:** Sorting DataFrames
  - Ascending and descending order
  - Multiple column sorting
- **DROP:** Removing columns from DataFrames

### Part 4: Intermediate Transformations (`04_Intermediate_Transformations.ipynb`)

Covers more complex data transformation operations:

- **dropDuplicates() / drop_duplicates():** Removing duplicate rows
  - Removing all duplicates
  - Removing duplicates based on specific columns
- **UNION and UNION BY NAME:** Combining DataFrames
  - Standard union operations
  - Union by column name (handling schema differences)
- **Date Functions:**
  - `current_date()`, `current_timestamp()`
  - `date_add()`, `date_sub()`
  - `date_diff()` for date arithmetic
  - `date_format()` for date formatting
- **Handling Null Values:**
  - `dropna()` with options: `'all'`, `'any'`, and subset columns
  - `fillna()` for replacing NULL values with default values
- **String Operations:**
  - `split()` for splitting strings into arrays
  - Array indexing to extract specific elements
- **Explode:** Converting array columns into multiple rows
- **String Matching:**
  - `contains()` for substring matching
  - `like()` for pattern matching with wildcards
- **GroupBy and Aggregations:**
  - Single and multiple column grouping
  - Aggregate functions: `sum()`, `avg()`, `count()`, etc.
  - Sorting aggregated results

### Part 5: Advanced Transformations (`05_Advanced_Transformations.ipynb`)

Covers advanced DataFrame operations and techniques:

- **PIVOT:** Reshaping data by converting rows to columns
  - Creating pivot tables with aggregations
- **When-Otherwise:** Conditional logic for column creation
  - Simple conditional expressions
  - Multiple conditional chains (if-else-if logic)
- **JOINs:** Combining data from multiple DataFrames
  - Inner Join
  - Left Join / Left Outer Join
  - Right Join / Right Outer Join
  - Full Outer Join
  - Join conditions and join keys
- **Window Functions:**
  - Creating window specifications with `Window.partitionBy()` and `Window.orderBy()`
  - Window aggregate functions (sum, avg, count over windows)
  - Window frame specifications (`rowsBetween`, `rangeBetween`)
  - Cumulative calculations
- **User Defined Functions (UDFs):**
  - Creating custom Python functions
  - Converting Python functions to Spark UDFs
  - Using UDFs in transformations
  - Performance considerations with UDFs

### Part 6: Writing Files (`06_Writing_Files.ipynb`)

Covers saving transformed data to various formats:

- **Writing CSV files:**
  - Using `write.csv()` method
  - Options: `header`, file organization
  - Understanding output directory structure
- **Write Modes:**
  - **Append Mode:** Adding data to existing files/directories
  - **Overwrite Mode:** Replacing existing data
  - **Error / ErrorIfExists Mode:** Failing if target already exists
  - **Ignore Mode:** Skipping write if target exists

## Organization

The content progresses logically from foundational concepts to practical data operations:

- **Part 1** provides the theoretical foundation explaining what Spark is, how it works, and its architecture
- **Part 2** covers the essential skill of reading data from files
- **Part 3** introduces basic transformations for filtering, selecting, and modifying data
- **Part 4** expands to intermediate operations including aggregations, date handling, and string operations
- **Part 5** covers advanced techniques like joins, pivots, window functions, and custom functions
- **Part 6** completes the workflow by demonstrating how to write transformed data back to storage

Each part builds upon previous concepts, providing a comprehensive guide to working with PySpark from basic operations to complex data engineering tasks.

---

**Note:** The notebooks are designed to work with Databricks Spark environment, but the core PySpark concepts and APIs apply to any Spark deployment (local, standalone cluster, YARN, Kubernetes, etc.). Some file paths and specific features may reference Databricks, but the transformation techniques are universal to PySpark.
