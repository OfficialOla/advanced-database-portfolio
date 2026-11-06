\# Database Normalisation



The AEU Student Result Management System was designed using the principles of database normalisation to minimise data redundancy and maintain data integrity.



\### First Normal Form (1NF)



All database tables contain atomic values. Each column stores a single value, and each table has a primary key to uniquely identify its records. Repeating groups have been eliminated.



\### Second Normal Form (2NF)



The database satisfies 2NF because it satisfies 1NF and all non-key attributes depend on their respective primary keys.



Student information, course information and lecturer information are stored in separate tables to avoid partial dependencies and unnecessary duplication.



\### Third Normal Form (3NF)



The database satisfies 3NF because it satisfies 2NF and has no transitive dependencies among non-key attributes.



For example, department names are stored in the Department table rather than being repeatedly stored in the Student, Lecturer and Course tables. Foreign keys establish the relationships.



\### Conclusion



Normalisation improves database consistency, reduces redundancy and prevents insertion, update and deletion anomalies. The resulting relational structure supports reliable academic record management.

