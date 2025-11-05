# Database Keys, Normalization, and Dependencies

## 1. Types of Database Keys

Keys are attributes or sets of attributes that uniquely identify data in a table.

- **Super Key:** Any attribute or set of attributes that can uniquely identify a row (a tuple) in a table. A super key may contain redundant attributes.

  - _Example:_ In a `Student` table with `(StudentID, StudentEmail, Name)`, the sets `{StudentID}`, `{StudentEmail}`, `{StudentID, Name}`, and `{StudentID, StudentEmail, Name}` are all super keys.

- **Candidate Key:** A _minimal_ super key. This is a super key that has no redundant attributes (i.m., if you removed any attribute from the key, it would no longer be a unique identifier). A table can have multiple candidate keys.

  - _Example:_ From the super keys above, `{StudentID}` and `{StudentEmail}` are candidate keys. `{StudentID, Name}` is not, because `Name` is redundant.

- **Primary Key:** The _one_ candidate key chosen by the database designer to be the main unique identifier for the table. It cannot contain NULL values.

  - _Example:_ The designer _chooses_ `{StudentID}` as the primary key.

- **Secondary Key (or Alternate Key):** Any candidate key that was _not_ chosen to be the primary key.

  - _Example:_ Since `{StudentID}` was chosen as primary, `{StudentEmail}` becomes a secondary key.

- **Composite Key:** A key (primary, candidate, or super) that is composed of **more than one attribute**.

  - _Example:_ In an `Enrollment` table, the primary key might be `{StudentID, CourseID}`. This is a composite key.

- **Prime Attribute:** An attribute that is part of _any_ candidate key.

  - _Example:_ In the `Enrollment` table, both `StudentID` and `CourseID` are prime attributes.

- **Non-Prime Attribute:** An attribute that is _not_ part of _any_ candidate key.
  - _Example:_ In an `Enrollment` table with `{StudentID, CourseID, Grade}`, the `Grade` attribute is a non-prime attribute.

---

## 2. Database Normalization and Dependencies

### Functional Dependency (FD)

This is the core concept. A functional dependency, written as **`A -> B`**, means "A determines B". If you know the value of `A`, you can uniquely find the value of `B`.

- **`A`** is called the **determinant**.
- **`B`** is called the **dependent**.

_Example:_ In a `Student` table, `StudentID -> StudentName`.

### What is Normalization?

**Normalization** is the process of organizing data in a database to reduce data redundancy and eliminate undesirable anomalies (Insertion, Update, and Deletion anomalies).

- **Insertion Anomaly:** You can't add new data because you're missing some other unrelated data.
- **Update Anomaly:** You have to update the same piece of data in multiple rows, risking inconsistency.
- **Deletion Anomaly:** Deleting a row accidentally removes the only copy of some other important, unrelated data.

Normalization involves decomposing large, problematic tables into smaller, well-structured tables.

---

## 3. First Normal Form (1NF)

> **Rule:** All attribute values must be **atomic**.

This means:

1.  No multi-valued attributes (like a "Courses" column with 'DB, OS').
2.  No repeating groups of attributes (like 'Course1', 'Course2').

---

### Example: Not in 1NF (0NF)

| StudentID | Name  | Courses    |
| :-------- | :---- | :--------- |
| 1         | Alice | 'DB', 'OS' |
| 2         | Bob   | 'Network'  |

This violates 1NF because the `Courses` column contains multiple values.

### Solution: 1NF

We fix this by creating a separate row for each value.

| StudentID | Name  | Course  |
| :-------- | :---- | :------ |
| 1         | Alice | DB      |
| 1         | Alice | OS      |
| 2         | Bob   | Network |

This table is now in 1NF. However, it still has redundancy (Alice's name is repeated) and anomalies.

---

## 4. Second Normal Form (2NF)

> **Rule:** Must be in 1NF **AND** have **no partial dependencies**.

A **partial dependency** occurs when a non-prime attribute depends on _only a part_ of a composite primary key. This rule only applies to tables with composite primary keys.

---

### Example: Not in 2NF

Let's use the 1NF table above. The primary key is the composite key `{StudentID, Course}`.

| StudentID | Name  | Course  |
| :-------- | :---- | :------ |
| 1         | Alice | DB      |
| 1         | Alice | OS      |
| 2         | Bob   | Network |

- **Problem:** The `Name` attribute is a non-prime attribute. It depends _only_ on `StudentID`, not the full `{StudentID, Course}` key. This is a partial dependency.
- **Anomalies:**
  - **Update:** To change "Alice" to "Alyson", you must update multiple rows.
  - **Insert:** You can't add a new student (e.g., Student 3, 'Charlie') until they enroll in at least one course.

### Solution: 2NF

Decompose the table into two:

**`Student` Table:**
| StudentID | Name |
| :--- | :--- |
| 1 | Alice |
| 2 | Bob |

**`Enrollment` Table:**
| StudentID | Course |
| :--- | :--- |
| 1 | DB |
| 1 | OS |
| 2 | Network |

Now, there are no partial dependencies.

---

## 5. Third Normal Form (3NF)

> **Rule:** Must be in 2NF **AND** have **no transitive dependencies**.

A **transitive dependency** occurs when a non-prime attribute depends on _another non-prime attribute_ (which, in turn, is dependent on the primary key).

The chain looks like this: **`Primary Key -> Non-Prime Attribute A -> Non-Prime Attribute B`**

---

### Example: Not in 3NF

Let's build on our `Student` table. The primary key is `{StudentID}`.

| StudentID | Name    | Dept_ID | Dept_Name |
| :-------- | :------ | :------ | :-------- |
| 1         | Alice   | D10     | Physics   |
| 2         | Bob     | D20     | CS        |
| 3         | Charlie | D10     | Physics   |

- **Dependencies:**
  - `StudentID -> Dept_ID`
  - `Dept_ID -> Dept_Name`
- **Problem:** `Dept_Name` (a non-prime attribute) depends on `Dept_ID` (another non-prime attribute). This is a transitive dependency.
- **Anomalies:**
  - **Update:** If the 'Physics' department is renamed to 'Astrophysics', you must update it in multiple places (for Alice and Charlie).
  - **Insert:** You can't add a new department (e.g., D30, 'Math') until at least one student is in it.

### Solution: 3NF

Decompose the table:

**`Student` Table:**
| StudentID | Name | Dept_ID |
| :--- | :--- | :--- |
| 1 | Alice | D10 |
| 2 | Bob | D20 |
| 3 | Charlie | D10 |

**`Department` Table:**
| Dept_ID | Dept_Name |
| :--- | :--- |
| D10 | Physics |
| D20 | CS |

Now, all non-prime attributes depend _only_ on the primary key.

---

## 6. Boyce-Codd Normal Form (BCNF)

> **Rule:** Must be in 3NF **AND** for every non-trivial functional dependency **`X -> Y`**, the determinant **`X`** must be a **super key**.

BCNF is a stricter version of 3NF. It handles rare anomalies that 3NF misses, typically those involving multiple overlapping candidate keys.

---

### Example: Not in BCNF

Consider this table of student enrollments with professors.

- **Rules:**
  1.  A student can take multiple subjects.
  2.  A professor teaches only _one_ subject.
  3.  A student has one professor for each subject.

| Student | Subject | Professor |
| :------ | :------ | :-------- |
| Alice   | Physics | Dr. A     |
| Alice   | CS      | Dr. B     |
| Bob     | Physics | Dr. A     |

- **Dependencies:**
  1.  `{Student, Subject} -> Professor`
  2.  `Professor -> Subject`
- **Candidate Keys:** `{Student, Subject}` and `{Student, Professor}`.
- **Problem:**
  - FD 1: `{Student, Subject} -> Professor`. The determinant `{Student, Subject}` **is a super key**. This is fine.
  - FD 2: `Professor -> Subject`. The determinant `Professor` **is NOT a super key**. This violates BCNF.

### Solution: BCNF

Decompose the table based on the violating dependency:

**`Enrollment` Table:**
| Student | Professor |
| :--- | :--- |
| Alice | Dr. A |
| Alice | Dr. B |
| Bob | Dr. A |

**`Teaching` Table:**
| Professor | Subject |
| :--- | :--- |
| Dr. A | Physics |
| Dr. B | CS |

---

## 7. Fourth Normal Form (4NF)

> **Rule:** Must be in BCNF **AND** have **no multi-valued dependencies (MVDs)**.

A **multi-valued dependency** (`A ->> B`) exists when one attribute `A` determines a _set_ of values for attribute `B`, and this relationship is independent of any other attributes.

This problem occurs when a table tries to store two independent one-to-many relationships in a single table.

---

### Example: Not in 4NF

Consider an `Employee` table that stores their skills and the languages they speak.

- **Rules:**
  1.  An employee can have multiple skills.
  2.  An employee can speak multiple languages.
  3.  **Crucially:** Skills and languages are independent.

| Employee | Skill  | Language |
| :------- | :----- | :------- |
| E1       | Python | English  |
| E1       | Python | French   |
| E1       | SQL    | English  |
| E1       | SQL    | French   |

- **Problem:** This table is in BCNF (the only key is `{Employee, Skill, Language}`). However, it has MVDs:
  - `Employee ->> Skill`
  - `Employee ->> Language`
- **Anomalies:**
  - **Insert:** If E1 learns 'Java', you must add _two_ new rows: `(E1, Java, English)` and `(E1, Java, French)`. This is a massive update anomaly.

### Solution: 4NF

Decompose the table to separate the independent relationships:

**`Skills` Table:**
| Employee | Skill |
| :--- | :--- |
| E1 | Python |
| E1 | SQL |

**`Languages` Table:**
| Employee | Language |
| :--- | :--- |
| E1 | English |
| E1 | French |

---

## 8. Fifth Normal Form (5NF)

> **Rule:** Must be in 4NF **AND** have **no join dependencies**.

Also known as **Project-Join Normal Form (PJNF)**, 5NF is the highest level of normalization and deals with very rare anomalies.

A **join dependency** exists when a table can be decomposed into three or more smaller tables, which can then be joined back together to recreate the original table _without any loss of data_. If a table _can_ be decomposed this way, but is _not_, it is not in 5NF.

---

### Example: Not in 5NF

This is the classic "Agents, Companies, Products" example.

- **Rule:** Agents work for companies, companies make products, and agents sell products. A _constraint_ exists that an agent only sells products made by a company they work for.

| Agent | Company | Product |
| :---- | :------ | :------ |
| Smith | Ford    | Focus   |
| Smith | GM      | Volt    |
| Jones | Ford    | Focus   |

- **Problem:** This table is in 4NF. However, it can be decomposed into three tables:
  - `R1 (Agent, Company)` - (Smith, Ford), (Smith, GM), (Jones, Ford)
  - `R2 (Company, Product)` - (Ford, Focus), (GM, Volt)
  - `R3 (Agent, Product)` - (Smith, Focus), (Smith, Volt), (Jones, Focus)
- If you join `R1`, `R2`, and `R3`, you get the original table back _perfectly_.
- Because the original table _can_ be losslessly decomposed, it is not in 5NF.

### Solution: 5NF

The 5NF solution _is_ the decomposed set of tables: `R1(Agent, Company)`, `R2(Company, Product)`, and `R3(Agent, Product)`.

This prevents a very subtle anomaly where, if the business rules were slightly different, joining the tables could create data that wasn't in the original. 5NF ensures that all semantic relationships are stored in their smallest, most irreducible form.
