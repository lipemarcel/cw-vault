---
created: 2025-11-14
tags: [learning, doc, programming, javascript, typescript]
---

# JavaScript ES2024 Features for Modern Web Development

## Key Concept: Practical ES2024 Additions

ES2024 introduces several features that enhance productivity in Next.js applications. The most impactful for InfinitePay development are:

- **Promise.withResolvers()**: Simplifies promise creation without wrapper functions
- **Array.prototype.toSorted/toReversed()**: Non-mutating array methods
- **Object.groupBy()**: Native grouping without external utilities

## Practical Example

```typescript
// Before: Manual grouping for payment transactions
const transactionsByStatus = transactions.reduce((acc, tx) => {
  if (!acc[tx.status]) acc[tx.status] = [];
  acc[tx.status].push(tx);
  return acc;
}, {});

// After: Using Object.groupBy()
const transactionsByStatus = Object.groupBy(
  transactions, 
  (tx) => tx.status
);

// Promise.withResolvers() for async operations
const { promise, resolve, reject } = Promise.withResolvers<PaymentResponse>();
processPayment(paymentData)
  .then(resolve)
  .catch(reject);
```

## Actionable Tips

1. **Use non-mutating methods** (toSorted/toReversed) in React components to avoid unintended re-renders
2. **Leverage Object.groupBy()** for payment filtering/categorization without lodash dependencies
3. **Adopt Promise.withResolvers()** for cleaner async controller logic in API routes
4. **Check browser support** before deploying—use polyfills for unsupported environments
5. **Update TypeScript** to v5.3+ for full ES2024 type support

## Best Practice

Keep your tsconfig.json target at `ES2024` or use appropriate transpilation for production safety. Test thoroughly in your target environments before relying on these features.

## Resource

[MDN: JavaScript 2024 Features](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference) – Comprehensive guide with compatibility tables for each ES2024 addition.
