# Relational Database Management System

It is a Database Management System based on the relational model, where data is stored in relations (tables) and is represented in the form of tuples (rows).

- **Table:** It is a collection of data elements organized in terms of rows and columns. It is considered a convenient representation of relations. (Note: Tables can have duplicates, relations cannot).
- **Tuple:** A single entry in the table is called a tuple or record/row. It represents a set of related data.
- **Attribute:** A table consists of several records; each record can be broken down into smaller parts of data known as Attributes.
- **Attribute domain:** An attribute is defined to hold only a certain type of values, which is known as its attribute domain.
- **Relational Schema:** It describes the structure of the relation, with the name of the relation, its attributes, and their names and type.

## Relational Integrity Constraints

Every relation in a relational DBMS should follow a few constraints to be a valid relation. These constraints are called Relational Integrity Constraints.

1.  **Key Constraints:** It specifies that there should be an attribute or more than one attribute in a relation, which can be used to fetch data for any tuple/row. It should never be NULL or be the same for more than one row.
2.  **Domain Constraints:** It refers to the rules defined for the values that can be stored for a certain attribute. Eg: "Address" cannot be stored in "Name"; "MobileNumber" must not exceed 10 digits.
3.  **Referential Integrity Constraint:** If a table references some data from another table, then that table and that data should be present for the referential integrity constraint to hold true.

## Relational Algebra

It is a procedural query language used to query the database tables to access data in different ways.

### Select Operation ($\sigma$)

- It is used to fetch rows from a table that satisfy a given condition.
- **Syntax:** $\sigma_p (r)$
  - $\sigma$ represents the Select operation.
  - p is the logic/conditions to select.
  - r is the name of the relation.
- Logic can have unary or binary operators like $>, <, =$, etc.
- **Eg:** $\sigma_{age > 17} (Student)$
- **Eg:** $\sigma_{age > 18 \text{ and } gender = \text{'male'}} (Student)$

### Project Operation ($\pi$)

- It is used to project only certain attributes of a relation.
- **Syntax:** $\pi_{A1, A2...} (r)$
  - $\pi$ is the Project operation.
  - A1 and A2 are attribute names.
  - r is the relation.
- **Eg:** $\pi_{Name, Age} (Student)$

### Union Operation ($\cup$)

- It is used to fetch data from two relations. To work, relations (tables) should have the same number of attributes and the same attribute domains.
- Duplicates are eliminated automatically.
- **Syntax:** $A \cup B$
  - A and B are relations.
  - $\cup$ is the union operation.
- **Eg:** $\pi_{Student} (RegularClass) \cup \pi_{Student} (ExtraClass)$

### Set Difference ($-$)

- It is used to find data present in one relation and not present in the second relation.
- **Syntax:** $A - B$
  - A and B are relations.
  - $-$ is the set difference operation.
- **Eg:** $\pi_{Student} (RegularClass) - \pi_{Student} (ExtraClass)$

### Cartesian Product ($\times$)

- It is used to combine data from two different relations into one and fetch data from the combined relation.
- **Syntax:** $A \times B$
  - A and B are relations.
  - $\times$ is the cartesian product operation.
- **Eg:** $\sigma_{Time = \text{'morning'}} (RegularClass \times ExtraClass)$

### Rename Operation ($\rho$)

- **Syntax:** $\rho (RelationNew, RelationOld)$
