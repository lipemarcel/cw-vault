---
created: 2025-12-24
tags: [learning, doc, programming, database, performance]
---

# Database Optimization: Query Efficiency and Connection Pooling

## Key Concept

Database optimization involves reducing query execution time and resource consumption through efficient querying, indexing, and connection management. For payment systems like InfinitePay, slow queries directly impact user experience and transaction throughput.

Two critical patterns are **N+1 query prevention** and **connection pooling**. N+1 occurs when you fetch a parent record, then query the database once per child record. Connection pooling maintains reusable database connections instead of creating new ones for each request.

## Practical Example

**Problem:** Fetching users with their transactions (N+1 anti-pattern):
```typescript
// ❌ Bad: N+1 queries
const users = await db.user.findMany();
const userTransactions = await Promise.all(
  users.map(user => db.transaction.findMany({ where: { userId: user.id } }))
);
```

**Solution:** Use eager loading with Prisma relations:
```typescript
// ✅ Good: Single optimized query
const users = await db.user.findMany({
  include: { transactions: true },
  take: 50, // Pagination
});
```

For connection pooling in Next.js, use environment variables and singleton pattern:
```typescript
// lib/db.ts
const prisma = global.prisma || new PrismaClient();
if (process.env.NODE_ENV !== 'production') global.prisma = prisma;
export default prisma;
```

## Actionable Tips

1. **Index strategically**: Index frequently queried fields (userId, transactionId)
2. **Use pagination**: Avoid fetching entire datasets; implement cursor-based pagination
3. **Monitor queries**: Enable Prisma query logging in development
4. **Cache strategically**: Use Redis for frequently accessed payment data
5. **Batch operations**: Group inserts/updates to reduce round trips

## Resource

[Prisma Query Optimization Guide](https://www.prisma.io/docs/guides/performance-and-optimization/query-optimization-performance)
