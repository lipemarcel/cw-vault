---
created: 2025-12-31
tags: [learning, doc, programming, javascript, typescript]
---

# JavaScript ES2024 Features: Promise.withResolvers()

## Key Concept

`Promise.withResolvers()` is a new ES2024 utility that simplifies promise creation by returning an object containing the promise itself plus its `resolve` and `reject` functions. This eliminates the need for the traditional Promise constructor pattern and makes code more readable and maintainable.

## Problem It Solves

Traditionally, working with promise resolvers required wrapping logic inside the constructor:

```typescript
// Old approach - verbose
const promise = new Promise<string>((resolve, reject) => {
  // logic here
  resolve('value');
});
```

## Practical Example (Next.js/React Context)

```typescript
// InfinitePay payment handler
export function usePaymentProcess() {
  const [promiseState, setPromiseState] = useState<{
    promise: Promise<PaymentResult>;
    resolve: (value: PaymentResult) => void;
    reject: (reason?: any) => void;
  } | null>(null);

  const initPayment = async () => {
    const { promise, resolve, reject } = Promise.withResolvers<PaymentResult>();
    setPromiseState({ promise, resolve, reject });
    
    // Later, when payment webhook arrives:
    // promiseState?.resolve({ status: 'success', transactionId: '123' });
  };

  return { initPayment, promise: promiseState?.promise };
}
```

## Actionable Best Practices

1. **Use for async flows**: Perfect for payment processing, webhooks, or event-driven architectures
2. **Avoid over-usage**: Only use when you need external resolve/reject control—simple async operations don't need this
3. **Type safety**: Always provide generic type parameter `Promise<T>` for TypeScript type checking
4. **Error handling**: Remember to call `reject()` for error scenarios to prevent unhandled promise rejections

## Resource for Deeper Learning

[MDN Web Docs: Promise.withResolvers()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/withResolvers)
