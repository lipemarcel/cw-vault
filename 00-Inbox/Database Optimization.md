---
created: 2025-11-21
tags: [learning, doc, programming, database, performance]
---

# Database Optimization: Query Efficiency and Connection Pooling

## Key Concept

Database optimization focuses on minimizing query execution time and resource consumption. Two critical patterns are **query efficiency** (selecting only needed columns, using indexes) and **connection pooling** (reusing database connections instead of creating new ones for each request).

## Practical Example for InfinitePay

In a Next.js API route handling payment transactions:

```typescript
// ❌ Inefficient: Multiple round-trips, N+1 problem
const transactions = await db.query(
  'SELECT * FROM transactions WHERE user_id = $1',
  [userId]
);
for (const tx of transactions) {
  const merchant = await db.query(
    'SELECT * FROM merchants WHERE id = $1',
    [tx.merchant_id]
  );
}

// ✅ Optimized: Single query with JOIN, selected columns
const transactions = await db.query(
  `SELECT t.id, t.amount, t.status, m.name, m.category 
   FROM transactions t
   LEFT JOIN merchants m ON t.merchant_id = m.id
   WHERE t.user_id = $1`,
  [userId]
);
```

## Actionable Best Practices

1. **Use Connection Pooling**: Configure `pg` (PostgreSQL) or your ORM with pooling (min: 2, max: 10 connections)
2. **Add Database Indexes**: Index frequently queried columns like `user_id`, `transaction_id`, `created_at`
3. **Avoid SELECT ***: Explicitly select needed columns to reduce payload
4. **Implement Caching**: Use Redis for frequently accessed merchant or rate data (5-10min TTL)
5. **Monitor Slow Queries**: Enable query logging to identify bottlenecks

## Resource

[Postgres Query Performance Tips](https://www.postgresql.org/docs/current/sql-explain.html) - Master EXPLAIN ANALYZE to understand query execution plans and optimize accordingly.
