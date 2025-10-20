---
created: 2025-10-20
tags: [learning, doc, programming, typescript, react]
---

# Advanced TypeScript Utility Types in React Components

Understanding and effectively using TypeScript's utility types can significantly improve type safety and code maintainability in React applications, particularly for InfinitePay's component architecture.

## Key Concept: Pick and Omit Utility Types

TypeScript's `Pick` and `Omit` utility types are powerful tools for creating new types based on existing ones:

- `Pick<T, K>`: Constructs a type by selecting specific properties from T
- `Omit<T, K>`: Constructs a type by excluding specific properties from T

## Practical Example

```typescript
interface Transaction {
  id: string;
  amount: number;
  currency: string;
  status: 'pending' | 'completed' | 'failed';
  timestamp: Date;
  merchantId: string;
}

// Create a simplified type for transaction display
type TransactionDisplayProps = Pick<Transaction, 'amount' | 'status' | 'timestamp'>;

// Create a form submission type excluding readonly fields
type TransactionFormData = Omit<Transaction, 'id' | 'timestamp'>;

const TransactionDisplay: React.FC<TransactionDisplayProps> = ({
  amount,
  status,
  timestamp
}) => {
  // Component implementation
};
```

## Best Practices

1. Use `Pick` when you need a subset of properties for a specific component
2. Use `Omit` when excluding properties that shouldn't be modified
3. Combine utility types to create precise component interfaces
4. Document complex type manipulations with comments

## Recommended Resource

TypeScript Handbook chapter on Utility Types:
https://www.typescriptlang.org/docs/handbook/utility-types.html

This reference provides comprehensive examples and explanations of all built-in utility types in TypeScript.
