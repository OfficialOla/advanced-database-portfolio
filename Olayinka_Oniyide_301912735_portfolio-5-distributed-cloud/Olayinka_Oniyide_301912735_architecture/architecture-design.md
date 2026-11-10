**AEU Distributed Database Architecture**



\## 1. Overview

The proposed AEU distributed database architecture supports student portals, lecturer portals and administrative applications across multiple university campuses.



\## 2. Architecture components

\- Application layer: Student, lecturer and administrator portals.

\- Primary database: PostgreSQL instance responsible for authoritative academic records and write operations.

\- Read replicas: Separate PostgreSQL standby instances that can serve eligible read workloads.

\- Backup system: Scheduled backups and transaction-log retention for recovery.

\- Monitoring: Database availability, replication lag, storage and performance monitoring.



\## 3. Data flow

Applications send write requests to the primary PostgreSQL database. Read requests may be directed to suitable replicas. Changes are transmitted to standby servers through PostgreSQL replication.



\## 4. Architecture considerations

The application must distinguish between authoritative reads and replica reads. Important operations, such as publishing examination results, should use the primary database to avoid reading stale replica data.



\## 5. Conclusion

This architecture is a proposed design for a scalable university database environment. It was documented as a design exercise; multiple database servers were not deployed in this practical.

