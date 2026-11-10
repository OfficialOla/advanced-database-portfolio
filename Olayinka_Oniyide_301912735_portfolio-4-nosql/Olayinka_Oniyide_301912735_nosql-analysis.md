**Portfolio 4: NoSQL and Advanced Data Models**



**Introduction**

This practical implemented a document-oriented database using MongoDB for the AEU Student Result Management System. The database was named `aeu\_student\_db`, with a `students` collection.



**Document modelling**

Student information and academic records were stored in a single BSON document. The academic records were embedded as an array, allowing related course information to be retrieved alongside student details.



**CRUD operations**

The following MongoDB operations were demonstrated:

\- \*\*Create:\*\* Inserted student documents using `insertOne()`.

\- \*\*Read:\*\* Retrieved student information using `find()` and `findOne()`.

\- \*\*Update:\*\* Modified a student's email using `updateOne()` and `$set`.

\- \*\*Delete:\*\* Removed a temporary test document using `deleteOne()`.



**PostgreSQL and MongoDB comparison**



| Feature | PostgreSQL | MongoDB |

|---|---|---|

| Database model | Relational | Document-oriented |

| Data structure | Tables and rows | Collections and documents |

| Schema | Structured schema | Flexible document schema |

| Relationships | Foreign keys and joins | Embedding and references |

| Query language | SQL | MongoDB Query API |

| Suitable use | Structured academic records | Flexible student profiles and embedded academic records |



**Suitability**

PostgreSQL is suitable for the university's structured student, course, lecturer and enrolment relationships. MongoDB is useful for storing flexible student profiles and embedded academic records.



A hybrid architecture can use PostgreSQL as the authoritative academic database and MongoDB for selected document-oriented workloads, with appropriate synchronisation and consistency controls.



**Conclusion**

The practical demonstrated MongoDB document modelling and CRUD operations. It also highlighted differences between relational and document-oriented databases and the situations in which each model is appropriate.

