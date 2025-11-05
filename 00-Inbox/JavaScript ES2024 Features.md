---
created: 2025-11-05
tags: [learning, doc, programming, javascript, typescript]
---

# JavaScript ES2024 Features: Practical Applications for InfinitePay

## Key Concepts

ES2024 introduces several powerful features that enhance code readability and performance. The most impactful for modern web development are:

1. **Promise.withResolvers()** - Simplifies promise creation by returning resolve/reject functions
2. **Array.prototype.toSorted/toReversed()** - Non-mutating alternatives to sort/reverse
3. **Object.groupBy()** - Native grouping without external libraries

## Practical Example: Payment Transaction Grouping

```typescript
// Instead of manual reduce operations:
const transactions = [
  { id: 1, status: 'completed', amount: 100 },
  { id: 2, status: 'pending', amount: 50 },
  { id: 3, status: 'completed', amount: 75 }
];

// ES2024 - Clean and efficient
const groupedByStatus = Object.groupBy(transactions, (tx) => tx.status);
// Result: { completed: [...], pending: [...] }
```

This pattern is perfect for InfinitePay dashboards displaying payment statuses without external lodash dependencies.

## Best Practices

- **Use Promise.withResolvers()** when wrapping callbacks (e.g., WebSocket connections)
- **Prefer toSorted/toReversed()** to avoid accidental mutations in React state
- **Leverage Object.groupBy()** for transaction categorization in analytics modules
- Keep TypeScript strict mode enabled to catch compatibility issues early

## ActionableSteps

1. Update your tsconfig.json to target ES2024: `"target": "ES2024"`
2. Replace manual Array.reduce() grouping with Object.groupBy()
3. Audit Promise implementations for withResolvers() opportunities
4. Test thoroughly on supported browsers (check caniuse.com)

## Resource

**[JavaScript 2024 Features - MDN Documentation](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference)** - Comprehensive reference with browser compatibility tables and interactive examples.
