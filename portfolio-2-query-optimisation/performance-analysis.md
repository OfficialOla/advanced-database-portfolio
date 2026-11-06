\# Portfolio 2: Query Processing and Optimization — Performance Analysis



\## Objective

The objective was to examine query execution plans and evaluate whether database indexes improve query performance in the AEU Student Result Management System.



\## Indexes created

The following indexes were created:

\- `idx\_enrollment\_offering\_id` on `enrollment(offering\_id)`.

\- `idx\_enrollment\_total\_score` on the expression `(ca\_score + exam\_score)`.



The `ANALYZE` command was also executed to update PostgreSQL table statistics.



\## Performance observations



| Measurement | Before | After |

|---|---:|---:|

| Execution time | 0.158 ms | 0.183 ms |

| Planning time | 1.463 ms | 1.500 ms |

| pgAdmin completion time | 0.086 s | 0.077 s |



The execution plans showed both index scans and sequential scans.



\## Analysis

The measured execution time increased slightly after indexing, from 0.158 ms to 0.183 ms. Planning time also increased from 1.463 ms to 1.500 ms. However, pgAdmin's displayed completion time decreased from 0.086 seconds to 0.077 seconds.



These measurements indicate that indexing did not produce a clear improvement in the execution time of this test query. The small sample dataset may explain why PostgreSQL continued to use sequential scans alongside index scans. For small tables, sequential scans can be more efficient than index access.



The experiment demonstrates that indexes should be selected based on query patterns and measured execution plans rather than assuming that every index improves performance.



\## Conclusion

The query optimisation practical demonstrated how to create indexes, update database statistics, inspect execution plans using `EXPLAIN ANALYZE`, and compare performance measurements. The results show that database optimisation must be evaluated experimentally, using realistic data volumes and actual query workloads.

