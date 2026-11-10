\# Portfolio 5: Distributed Databases and Cloud Deployment



\## 1. Introduction

The AEU Student Result Management System requires a database architecture capable of supporting multiple users, increasing data volumes and reliable access to academic records. This practical examines partitioning, replication, sharding and cloud deployment.



\## 2. Database partitioning

PostgreSQL range partitioning was implemented using `student\_id` as the partition key.



Two partitions were created:

\- Partition 1: student IDs below 1000.

\- Partition 2: student IDs from 1000 upwards.



Existing student records were copied into the partitioned table. Queries and execution plans were examined to demonstrate partition pruning.



\## 3. Database replication

Replication maintains copies of database data on separate database servers.



For AEU, a PostgreSQL primary server can handle write operations while one or more standby servers maintain replicated copies.



PostgreSQL streaming replication can transmit changes through its write-ahead log (WAL). Asynchronous replication can introduce replication lag, while synchronous replication can provide stronger commit durability at the cost of additional write latency.



A standby server can be promoted during a primary-server failure, subject to an appropriate failover procedure.



\## 4. Database sharding

Sharding distributes data across multiple database servers.



For AEU, student records could be distributed using matriculation-number ranges or a hash of the student identifier.



For example:

\- Shard 1: students with matriculation numbers in one allocated range.

\- Shard 2: students in another allocated range.



Sharding can distribute storage and workload, but requires routing queries to the correct shard and managing cross-shard operations.



PostgreSQL table partitioning demonstrated in this practical is not itself multi-server sharding; it divides data within a PostgreSQL database.



\## 5. Availability and consistency

Replication can improve availability by providing standby database servers. However, a failover mechanism is required to switch applications to a standby server.



Asynchronous replication may result in recently committed transactions not yet reaching a replica. Synchronous replication reduces this risk but can increase response times.



Database monitoring, backups and tested recovery procedures are important for maintaining service reliability.



\## 6. Cloud deployment

A possible deployment option is Amazon RDS for PostgreSQL, a managed relational database service.



A cloud deployment could use:

\- A primary PostgreSQL database instance.

\- A standby or read replica, depending on the availability design.

\- Automated backups.

\- Access controls and encrypted connections.

\- Monitoring and recovery procedures.



This cloud architecture is a proposed design; a live cloud deployment was not performed as part of this local practical.



\## 7. Conclusion

The practical demonstrated PostgreSQL range partitioning and examined distributed database concepts. Replication, sharding and managed cloud deployment were evaluated as approaches for improving scalability, availability and reliability in the AEU Student Result Management System.

