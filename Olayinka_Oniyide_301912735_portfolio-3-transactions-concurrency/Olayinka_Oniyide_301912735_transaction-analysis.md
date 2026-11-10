\# Portfolio 3: Transactions and Concurrency Analysis



**Transaction management**

COMMIT was tested by updating a student's email and verifying that the change persisted. ROLLBACK was tested by making a temporary email update and reversing it. The previously committed email was successfully restored.



**## ACID properties**

\- \*\*Atomicity:\*\* Changes within a transaction are committed together or rolled back.

\- \*\*Consistency:\*\* Database constraints preserve valid data.

\- \*\*Isolation:\*\* Transaction isolation levels control the visibility of concurrent changes.

\- \*\*Durability:\*\* Committed changes persist.



**## Isolation levels**

PostgreSQL's READ COMMITTED, REPEATABLE READ and SERIALIZABLE isolation levels were tested. The concurrency experiment was used to examine how transactions observe changes made by other sessions.



**## Concurrency and locking**

Two pgAdmin sessions were used to demonstrate concurrent access. A SELECT FOR UPDATE statement acquired a row-level lock, causing a conflicting update in the second session to wait until the first transaction completed.



**## Conclusion**

The practical demonstrated transaction control, rollback, isolation and row-level locking in PostgreSQL. These mechanisms help maintain database consistency when multiple users access or modify student records.

