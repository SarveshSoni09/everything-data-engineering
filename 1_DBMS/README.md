# DBMS

## Overview

This folder contains documentation covering Database Management System (DBMS) concepts, from foundational principles to advanced database design. A Database Management System is software that allows the creation, definition, and manipulation of databases, enabling users to store, process, and analyze data easily.

## Contents

The documentation is organized into **4 parts**, progressing from foundational concepts to advanced database design principles:

### Part 1: Introduction to DBMS (`01_Intro.md`)

Covers the fundamentals of Database Management Systems:

- Core definitions: Data, Database, and DBMS
- Characteristics of DBMS: data stored in tables, reduced redundancy, data consistency, concurrent access support
- Advantages and disadvantages of using DBMS
- DBMS components: Procedures, Database Access Language, and Users
- DBMS architecture types: 1-tier, 2-tier, and 3-tier architectures
- Overview of database models:
  - Hierarchical Model
  - Network Model
  - Entity-Relationship Model
  - Relational Model
  - Object-oriented Model
  - NoSQL Model
  - Graph Model

### Part 2: Entity-Relationship (ER) Model (`02_ER_Model.md`)

Covers the design and representation of database relationships:

- Components of ER Model:
  - Entities and Entity Sets
  - Attributes: Simple, Composite, Derived, Single-valued, and Multi-valued
  - Keys: Super Key, Candidate Key, Primary Key
  - Relationships and their degrees
- ER Diagram Components:
  - Entity representation
  - Relationship representation
  - Weak entities
  - Attribute representation (Key, Derived, Multivalued, Composite attributes)
- Relationship Types:
  - Binary relationships (One-to-One, One-to-Many, Many-to-One, Many-to-Many)
  - Recursive relationships
  - Ternary relationships
- Enhanced ER Model:
  - Generalization (bottom-up approach)
  - Specialization (top-down approach)
  - Aggregation

### Part 3: Relational Database Management System (`03_RDBMS.md`)

Covers the relational model and query fundamentals:

- Core concepts of RDBMS:
  - Tables, Tuples, Attributes, and Attribute Domains
  - Relational Schema
- Relational Integrity Constraints:
  - Key Constraints
  - Domain Constraints
  - Referential Integrity Constraints
- Relational Algebra operations:
  - Select Operation (σ)
  - Project Operation (π)
  - Union Operation (∪)
  - Set Difference (-)
  - Cartesian Product (×)
  - Rename Operation (ρ)

### Part 4: Database Normalization and Keys (`04_DB_Normalization.md`)

Covers database design and data organization:

- Types of Database Keys:
  - Super Key
  - Candidate Key
  - Primary Key
  - Secondary Key (Alternate Key)
  - Composite Key
  - Prime and Non-Prime Attributes
- Functional Dependencies (FD)
- Database Normalization Concepts:
  - Purpose: Reducing redundancy and eliminating anomalies
  - Types of anomalies: Insertion, Update, and Deletion
- Normal Forms:
  - **First Normal Form (1NF):** Atomic attribute values
  - **Second Normal Form (2NF):** Eliminating partial dependencies
  - **Third Normal Form (3NF):** Eliminating transitive dependencies
  - **Boyce-Codd Normal Form (BCNF):** Stricter version of 3NF
  - **Fourth Normal Form (4NF):** Eliminating multi-valued dependencies
  - **Fifth Normal Form (5NF):** Eliminating join dependencies (Project-Join Normal Form)

## Organization

The content progresses logically from basic concepts to advanced topics:

- **Part 1** provides the foundation with DBMS definitions, characteristics, architectures, and database models
- **Part 2** focuses on database design using the Entity-Relationship model
- **Part 3** covers the relational model implementation and relational algebra
- **Part 4** details database normalization techniques and key concepts

Each part builds upon previous concepts, covering database management systems from theory to practical design principles.

---

**Note:** The documentation covers fundamental database concepts that apply across various DBMS implementations including MySQL, PostgreSQL, Oracle, SQL Server, and others. While some examples may reference specific systems, the core principles are universal to relational database management.
