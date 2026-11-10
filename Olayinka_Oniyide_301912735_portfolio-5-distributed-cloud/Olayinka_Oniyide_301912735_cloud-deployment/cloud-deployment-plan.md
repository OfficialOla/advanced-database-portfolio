**AEU Cloud Database Deployment Plan**



\## 1. Introduction

Cloud database deployment allows AEU to host its database infrastructure on managed cloud services rather than maintaining all database servers locally.



\## 2. Proposed cloud platform

Amazon Relational Database Service (Amazon RDS) for PostgreSQL is proposed for hosting the university's relational database.



\## 3. Proposed configuration

\- Database engine: PostgreSQL.

\- Primary database: Stores authoritative student, course and result records.

\- Availability: Multi-AZ deployment can provide a standby database in another Availability Zone.

\- Backups: Automated backups and point-in-time recovery.

\- Security: Network access restrictions, database authentication and encryption.

\- Monitoring: Database performance and availability monitoring.



\## 4. Deployment procedure

1\. Create an AWS account and configure appropriate access controls.

2\. Open Amazon RDS.

3\. Select PostgreSQL as the database engine.

4\. Configure the database instance and network settings.

5\. Configure backups, encryption and availability options.

6\. Connect an authorised client to the database.

7\. Test connectivity, backups and recovery procedures.



\## 5. Benefits

Cloud deployment reduces the need to maintain physical database infrastructure. Managed services provide backup, monitoring and availability features, depending on the selected configuration.



\## 6. Limitations

Cloud deployment introduces service costs, network dependency, security responsibilities and possible vendor dependency.



\## 7. Practical implementation status

A cloud deployment plan was prepared for the AEU database. A live Amazon RDS instance was not created as part of this practical, and no cloud deployment is claimed.

