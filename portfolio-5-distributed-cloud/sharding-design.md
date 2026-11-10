**Distributed Database Sharding Design**



\## 1. Introduction

Sharding is a technique for distributing records across multiple database servers. Each server stores a portion of the overall dataset.



\## 2. Proposed AEU sharding strategy

The AEU system could distribute student records across three database shards using a hash of the student identifier.



\- Shard 1: Students assigned to hash partition 0.

\- Shard 2: Students assigned to hash partition 1.

\- Shard 3: Students assigned to hash partition 2.



The application or database routing layer would direct requests to the appropriate shard.



\## 3. Benefits

\- Distributes storage requirements.

\- Supports horizontal scaling.

\- Can distribute query workloads across servers.

\- Reduces the amount of data managed by an individual shard.



\## 4. Challenges

\- Cross-shard queries are more complex.

\- Transactions involving multiple shards require coordination.

\- Uneven data distribution can create hotspots.

\- Rebalancing and shard failure require careful management.



\## 5. Difference between partitioning and sharding

Partitioning divides a table into smaller parts within a PostgreSQL database. Sharding distributes data across multiple database instances or servers.



The project implemented local PostgreSQL range partitioning using student\_id. Multi-server sharding was documented as a proposed design and was not deployed.



\## 6. Conclusion

Sharding could support AEU as student numbers and transaction volumes increase. A suitable shard key and routing mechanism would be essential for maintaining performance and consistency.

