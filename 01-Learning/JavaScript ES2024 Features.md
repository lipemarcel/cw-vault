---
created: 2025-11-29
tags: [learning, doc, programming, javascript, typescript]
---

# JavaScript ES2024 Features for Modern Web Development

## Key Concept

ES2024 introduces several powerful features that enhance JavaScript's expressiveness and developer experience. The most impactful for InfinitePay's React/Next.js stack are **Promise.withResolvers()**, **Array grouping methods**, and **RegExp improvements**.

**Promise.withResolvers()** simplifies Promise creation by returning an object with `{promise, resolve, reject}`, eliminating the need for wrapper functions—particularly useful for complex async payment flows.

## Practical Example

```typescript
// Before ES2024
function createPaymentPromise() {
  let resolve, reject;
  const promise = new Promise((res, rej) => {
    resolve = res;
    reject = rej;
  });
  return { promise, resolve, reject };
}

// ES2024 - Much cleaner
const { promise, resolve, reject } = Promise.withResolvers();

// Real-world InfinitePay usage
async function processPayment(transactionId: string) {
  const { promise, resolve, reject } = Promise.withResolvers<PaymentResult>();
  
  paymentService.on('complete', (result) => resolve(result));
  paymentService.on('error', (error) => reject(error));
  
  return promise;
}
```

## Array Grouping Pattern

```typescript
const transactions = [...]; // Array of payment transactions
const grouped = Object.groupBy(transactions, (tx) => tx.status);
// Result: { completed: [...], pending: [...], failed: [...] }
```

## Actionable Tips

1. **Use Promise.withResolvers()** for event-based async operations in payment handlers
2. **Leverage Array.groupBy()** when organizing transaction data for dashboards
3. **Update TypeScript** to 5.2+ to get full ES2024 type support
4. **Test polyfills** for legacy browser support—check Can I Use before deploying

## Resource

Mozilla MDN Web Docs: [ES2024 Features](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/withResolvers) provides comprehensive documentation with browser compatibility matrices.
