---
created: 2025-12-18
tags: [learning, doc, programming, database, performance]
---

# Database Optimization: Query Efficiency & Connection Pooling

## Key Concept

Database optimization focuses on reducing query execution time and resource consumption. Two critical patterns are **query optimization** (selecting only needed data) and **connection pooling** (reusing connections instead of creating new ones for each request).

## Practical Example for InfinitePay

In a Next.js API route handling payment transactions, inefficient queries can cause timeout issues:

```typescript
// ❌ Bad: N+1 query problem & fetching unnecessary data
export async function GET(req: Request) {
  const transactions = await db.query(
    'SELECT * FROM transactions'
  );
  for (let t of transactions) {
    const user = await db.query(
      'SELECT * FROM users WHERE id = ?', [t.user_id]
    );
  }
  return Response.json(transactions);
}

// ✅ Good: Single JOIN query with specific columns
export async function GET(req: Request) {
  const transactions = await db.query(
    `SELECT t.id, t.amount, t.status, u.name 
     FROM transactions t
     JOIN users u ON t.user_id = u.id
     WHERE t.created_at > NOW() - INTERVAL 24 HOUR`
  );
  return Response.json(transactions);
}
```

## Best Practices

1. **Use indexes** on frequently queried columns (user_id, payment_status)
2. **Implement connection pooling** with libraries like `pg` (PostgreSQL) or `mysql2/promise`
3. **Add pagination** for large datasets to reduce memory usage
4. **Cache repetitive queries** using Redis for merchant/user data
5. **Monitor slow queries** with database logs and APM tools

## Actionable Tips

- Profile your database queries during load testing
- Use `EXPLAIN` to analyze query execution plans
- Set up alerts for queries exceeding 1000ms
- Batch operations when processing multiple transactions

## Resource

[PostgreSQL Query Performance Insights](https://www.postgresql.org/docs/current/sql-explain.html) — Learn to read EXPLAIN plans and optimize execution strategies.
