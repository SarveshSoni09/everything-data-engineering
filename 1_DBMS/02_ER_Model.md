# DBMS ER Model

The ER (Entity-Relationship) model is used for the design and representation of relationships between data.

## Components of ER Model

Consider an example of School Management Software where we have to store Student information, Teacher information, classes, subjects, etc.

- **Entity:** It is generally a real-world object that has characteristics and holds relationships in a DBMS. In the above example, Student, Teacher, Class, and Subject are entities.
- **Entity set:** It is the complete set of all objects of one entity. If Student is an entity, then the complete set of all students will be the Entity set.
- **Attributes:** These are the properties of an individual entity. For a Student entity, roll number, name, age, gender, etc., will be its attributes.
  - **Simple attribute:** The attributes with values that are atomic and cannot be broken down further. Eg: student's age.
  - **Composite attribute:** It is made up of more than one simple attribute. Eg: student's address, made up of house no, street name, pin/zip code.
  - **Derived attribute:** It is not present in the whole database but can be derived using other attributes. Eg: average age of students in a class.
  - **Single and Multi-valued attributes:** Self-explanatory.
  - **Keys:** This is an attribute or a set of attributes that uniquely identify an object of the entity. Eg: student id or roll-number.
    - Super Key
    - Candidate Key
    - Primary Key
- **Relationships:** When an entity is related to another entity, they are said to have a relationship. Eg: A Class _has_ students, and thus Class and Student entities have a relationship. Can have degree 2 (binary relationship) or degree 3 (ternary relationship).

## Components of ER Diagram

- **Entity:** Simple rectangular diagram.
- **Relationships:** Rhombus to show relationships. A double rhombus is used for a weak relationship.
- **Weak entity:** A double rectangle represents it and is connected to another entity.

  >

- **Attributes:** An ellipse represents attributes of an entity and is connected to the entity.

  >

  - **Key Attribute:** Represented by an ellipse with underlined text.
  - **Derived Attribute:** Represented by a dashed ellipse.
  - **Multivalued Attribute:** Represented by a double ellipse.
  - **Composite Attribute:** Represented by an ellipse connected to other simple attribute ellipses.

## Relationship Types

- **Binary Relationship Types**

  - One to One
  - One to Many
  - Many to One
  - Many to Many

  >

- **Recursive Relationship**

  >

- **Ternary Relationship**

  >

## Enhanced ER Model

- **Generalization:** It is a bottom-up approach in which two lower-level entities combine to form a higher-level entity. The higher-level entity can also combine with other lower-level entities to make a further higher-level entity.

  >

- **Specialization:** It is the opposite of generalization. It is a top-down approach in which one higher-level entity can be broken down into two lower-level entities. A higher-level entity may not have any lower-level entity sets; it's possible.

  >

- **Aggregation:** It is a process where the relation between two entities is treated as a single entity. In the example below, the relationship between Center and Course together is acting as an entity, which is in a relationship with another entity, Visitor. A visitor may not enquire about the center or course independently, but rather together.

  >
