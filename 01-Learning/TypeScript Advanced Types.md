---
created: 2025-12-06
tags: [learning, doc, programming, typescript, advanced]
---

# TypeScript Advanced Types: Utility Types & Generics

## Key Concept

TypeScript's advanced type system enables type-safe, reusable code through **Utility Types** and **Generics**. These allow you to transform, constrain, and compose types dynamically, reducing boilerplate and catching errors at compile-time rather than runtime.

## Practical Example for InfinitePay

In payment processing, you often need flexible API response handlers:

```typescript
// Generic type for API responses
type ApiResponse<T> = {
  status: 'success' | 'error';
  data?: T;
  error?: string;
};

// Payment-specific response
type PaymentData = {
  transactionId: string;
  amount: number;
  currency: string;
};

// Using Partial to make optional updates
type PaymentUpdate = Partial<PaymentData>;

// Using Pick to extract specific fields
type PaymentPreview = Pick<PaymentData, 'amount' | 'currency'>;

// Handler function with type safety
const handlePaymentResponse = (response: ApiResponse<PaymentData>) => {
  if (response.status === 'success' && response.data) {
    console.log(`Processed ${response.data.transactionId}`);
  }
};
```

## Best Practices

1. **Use Generics for reusability**: Create generic types for common patterns (API calls, state management)
2. **Prefer Utility Types**: `Partial`, `Pick`, `Omit`, `Record` reduce repetition
3. **Constrain generics**: Use `extends` to ensure type safety: `<T extends PaymentData>`
4. **Avoid `any`**: Always specify types explicitly to maintain type safety throughout your application
5. **Document constraints**: Comment complex generic constraints for team clarity

## Actionable Tip

For Next.js API routes handling payments, create a reusable handler wrapper:

```typescript
type Handler<T> = (data: T) => Promise<ApiResponse<any>>;
const createHandler = <T,>(handler: Handler<T>) => handler;
```

## Resource

**TypeScript Handbook - Utility Types**: https://www.typescriptlang.org/docs/handbook/utility-types.html

Master these patterns to write safer, more maintainable payment processing logic in InfinitePay.
