# PySpark Applications

## Overview

This folder contains practical implementations and applications of PySpark concepts for real-world data engineering scenarios. These notebooks demonstrate common data engineering patterns, including data ingestion, transformation, change data capture, and dimensional modeling using PySpark, Delta Lake, and Delta Live Tables.

## Contents

The folder contains **5 application notebooks**, each focusing on a specific data engineering pattern or use case:

### Application 1: Upserts (`01_Upserts.ipynb`)

**Implementing Update + Insert Operations with Delta Lake**

- **Concept:** Upsert operations that combine update and insert in a single atomic process
- **Use Cases:** Incremental ETL/ELT, Change Data Capture (CDC), Slowly Changing Dimensions (SCD Type 1), Kafka pipelines, API data ingestion
- **Implementation:**
  - Using `DeltaTable.merge()` for upsert operations
  - Handling existing vs. new records with `whenMatchedUpdateAll()` and `whenNotMatchedInsertAll()`
  - Adding guard-rails for target table existence
  - Implementing update conditions to prevent overwriting newer data with older records
  - Initializing Delta tables when they don't exist
- **Key Learnings:** Delta Lake MERGE operations, handling late-arriving data, maintaining data currency without duplicates

### Application 2: Spark Structured Streaming (`02_Spark_Streaming.ipynb`)

**File-based Incremental Data Ingestion**

- **Concept:** Using Spark Structured Streaming for automatic detection and processing of newly arrived files
- **Use Case:** Daily incremental loads from cloud storage without reprocessing entire historical datasets
- **Implementation:**
  - Setting up streaming reads from file-based sources (CSV)
  - Defining explicit schemas for streaming data
  - Configuring checkpoint locations for exactly-once semantics
  - Writing streaming data to Delta format
  - Using `trigger(once=True)` for incremental batch-like processing
  - Handling schema evolution with `mergeSchema`
- **Key Learnings:** Structured Streaming API, checkpoint management, file-based streaming patterns, avoiding duplicate processing through checkpoint tracking

### Application 3: JSON Flattening (`03_JSON_Flattening.ipynb`)

**Flattening Nested JSON Structures into Tabular Format**

- **Concept:** Converting complex nested JSON structures into flat, tabular DataFrames for analytics
- **Use Case:** Processing e-commerce order data with nested customer details, arrays of items, and delivery updates
- **Implementation:**
  - Reading multi-line JSON files with proper configuration
  - Accessing nested fields using dot notation (`customer.location.city`)
  - Using `explode_outer()` to convert array columns into multiple rows
  - Flattening struct types into top-level columns
  - Handling nested structures within arrays (items within orders)
  - Preserving arrays vs. exploding based on analytical needs
- **Key Learnings:** JSON data processing, nested schema navigation, array explosion strategies, creating fact tables from nested data

### Application 4: SCD Type 2 (`04_SCD_Type_2.ipynb`)

**Slowly Changing Dimension Type 2 Implementation**

- **Concept:** Maintaining full historical versions of dimension records while tracking changes over time
- **Use Case:** Retail item dimension table that preserves historical accuracy for reporting and analytics
- **Implementation:**
  - Initializing dimension tables with SCD Type 2 structure (`start_time`, `end_time`, `is_active`)
  - Using Delta Lake MERGE operations for SCD Type 2 logic
  - Expiring old records when attributes change (setting `end_time`, marking `is_active = 'N'`)
  - Inserting new versions of changed records
  - Handling brand-new items vs. updates to existing items
  - Deduplicating source data before processing
  - Validating dimension state (one active record per key)
- **Key Learnings:** SCD Type 2 patterns, Delta MERGE for historical tracking, dimensional modeling, handling attribute changes while preserving history

### Application 5: DLT Pipeline (`05_DLT_Pipeline.ipynb`)

**Delta Live Tables Pipeline with Auto CDC and SCD Type 2**

- **Concept:** Building automated data pipelines using Delta Live Tables (DLT) with Change Data Capture
- **Use Case:** Automated inventory dimension pipeline with Bronze-Silver-Gold architecture and auto CDC
- **Implementation:**
  - **Bronze Layer:** Raw ingestion from source tables
  - **Silver Layer:** Data cleaning, enrichment, and deduplication using window functions
  - **Gold/Dimension Layer:** SCD Type 2 dimension table maintained automatically
  - Using `@dlt.table()` decorators for batch tables
  - Using `dlt.create_streaming_table()` for streaming tables
  - Implementing `dlt.create_auto_cdc_flow()` for automatic change data capture
  - Configuring SCD Type 2 with `stored_as_scd_type=2`
  - Using `sequence_by` parameter for change ordering
  - Pipeline DAG visualization and validation
- **Key Learnings:** Delta Live Tables framework, medallion architecture (Bronze-Silver-Gold), auto CDC capabilities, automated SCD Type 2 maintenance, pipeline orchestration

## Organization

The applications progress from individual operations to complete pipeline patterns:

- **Application 1** demonstrates fundamental upsert operations using Delta Lake
- **Application 2** covers streaming patterns for incremental data ingestion
- **Application 3** handles complex data transformation (nested JSON flattening)
- **Application 4** implements a complete dimensional modeling pattern (SCD Type 2)
- **Application 5** combines multiple concepts into a production-ready automated pipeline

Each notebook includes:
- Real-world scenarios and use cases
- Step-by-step implementation details
- Code examples with explanations
- Best practices and common pitfalls
- Validation and verification steps

Together, these applications provide practical examples of how to apply PySpark, Delta Lake, and Delta Live Tables to common data engineering challenges.

---

**Note:** These notebooks are designed for Databricks environments with Unity Catalog and Delta Lake. The core concepts and patterns apply to any Spark environment, though some specific APIs (like DLT) are Databricks-specific. The transformation techniques and architectural patterns demonstrated are widely applicable across different data platforms.

