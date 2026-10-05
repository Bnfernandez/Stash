---
name: efcore-sqlserver
description: Use when changing Project A persistence, EF Core entities/configuration/migrations, SQL Server queries, transactions, or database-related batch behavior.
---

# EF Core + SQL Server

- Inspect entity configuration, relationships, indexes, query patterns, and migrations before changing persistence code.
- Consider existing production rows and backward compatibility.
- Prefer explicit, readable LINQ and follow established tracking/no-tracking conventions.
- Watch for N+1 queries, accidental client evaluation, large materialization, and unnecessary database round trips.
- Preserve transaction boundaries and concurrency behavior unless explicitly changing them.
- For schema changes, make the migration/data transition safe for already-deployed versions and understand rollback implications.
- Never invent database object names; inspect the repository or database scripts.

For batch operations, consider partial failure, retries, idempotency, transaction scope, and whether external calls occur inside a database transaction.
