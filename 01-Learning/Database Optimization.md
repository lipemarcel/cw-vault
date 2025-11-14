---
created: 2025-11-13
tags: [learning, doc, programming, database, performance]
---

# Database Query Optimization in Next.js Applications

## Key Concept

**N+1 Query Problem** is a common performance issue where an application executes one query to fetch parent records, then executes N additional queries to fetch related data for each parent. This exponentially increases database load and degrades performance.

## Practical Example

```typescript
// ❌ BAD: N+1 Problem
async function getPayments() {
  const payments = await db.payment.findMany();
  // This loops creates N additional queries
  return Promise.all(
    payments.map(async (payment) => ({
      ...payment,
      user: await db.user.findUnique({ 
        where: { id: payment.userId } 
      })
    }))
  );
}

// ✅ GOOD: Using JOIN/Include
async function getPayments() {
  return await db.payment.findMany({
    include: { user: true }, // Single optimized query
  });
}
```

## Actionable Best Practices

1. **Use eager loading**: Always use `include` or `select` in Prisma to fetch related data in one query
2. **Implement query pagination**: Fetch large datasets in chunks to reduce memory usage
3. **Add database indexes**: Index frequently queried columns (`userId`, `createdAt`, etc.)
4. **Monitor with logging**: Use Prisma's `logLevel: 'query'` in development to catch inefficient queries
5. **Cache strategically**: Implement Redis caching for frequently accessed immutable data

## For InfinitePay Context

When fetching payment transactions with user details, merchant info, and status logs—always batch load relationships rather than iterating queries. This directly impacts dashboard load times and API response speed.

## Resource

**Prisma Query Optimization Guide**: https://www.prisma.io/docs/orm/prisma-client/queries/select-fields#performance
