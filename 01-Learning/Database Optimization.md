---
created: 2025-11-22
tags: [learning, doc, programming, database, performance]
---

# Database Optimization: Query Indexing & N+1 Problem Prevention

## Key Concept

The N+1 query problem occurs when your application executes one query to fetch parent records, then N additional queries to fetch related data for each parent. This severely impacts performance and is a critical issue in payment systems like InfinitePay where transaction speed matters.

## Practical Example (Next.js/TypeScript)

**Problem - N+1 Query:**
```typescript
// ❌ Bad: Fetches 1 transaction + N queries for each user
const transactions = await db.transaction.findMany();
const enriched = await Promise.all(
  transactions.map(async (tx) => ({
    ...tx,
    user: await db.user.findUnique({ where: { id: tx.userId } })
  }))
);
```

**Solution - Using Relations/Eager Loading:**
```typescript
// ✅ Good: Single optimized query with JOIN
const transactions = await db.transaction.findMany({
  include: {
    user: true, // Eagerly load related user data
    merchant: true
  },
  take: 100
});
```

## Best Practices

1. **Use `include` or `select`** in Prisma/ORM to fetch related data in one query
2. **Add database indexes** on frequently queried columns (userId, merchantId, status)
3. **Implement query pagination** to avoid loading massive datasets
4. **Monitor query performance** using database logs and APM tools
5. **Consider denormalization** for read-heavy payment reports

## Actionable Tips

- Profile your queries in development using `console.time()` or database query analyzers
- For InfinitePay transactions, index on: `userId`, `merchantId`, `status`, `createdAt`
- Use DataLoader pattern for batching queries if using GraphQL

## Resource

**Prisma Relation Queries Guide:** https://www.prisma.io/docs/concepts/relations

This optimization is crucial for InfinitePay's transaction endpoints to maintain sub-second response times under load.
