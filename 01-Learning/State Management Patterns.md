---
created: 2025-12-20
tags: [learning, doc, programming, react, nextjs, statemanagement]
---

# State Management Patterns in Next.js Applications

## Key Concept

State management is critical for scalable applications. While React Context works for simple cases, production applications like InfinitePay benefit from predictable, centralized state patterns. The **reducer pattern** combined with custom hooks provides excellent separation of concerns and testability.

## Practical Example

Instead of prop drilling payment states across components, implement a payment context with useReducer:

```typescript
// paymentContext.tsx
interface PaymentState {
  amount: number;
  status: 'idle' | 'processing' | 'completed' | 'failed';
  error: string | null;
}

type PaymentAction = 
  | { type: 'START_PAYMENT'; payload: number }
  | { type: 'SUCCESS' }
  | { type: 'ERROR'; payload: string };

function paymentReducer(state: PaymentState, action: PaymentAction) {
  switch (action.type) {
    case 'START_PAYMENT':
      return { ...state, status: 'processing', amount: action.payload };
    case 'SUCCESS':
      return { ...state, status: 'completed' };
    case 'ERROR':
      return { ...state, status: 'failed', error: action.payload };
  }
}

export const usePayment = () => {
  const [state, dispatch] = useReducer(paymentReducer, initialState);
  return { state, dispatch };
};
```

## Best Practices

1. **Keep state as close as possible** to where it's used—avoid over-centralization
2. **Use TypeScript discriminated unions** for action types to ensure type safety
3. **Memoize context values** to prevent unnecessary re-renders
4. **Consider Zustand or Redux** for complex cross-cutting state (authentication, user preferences)
5. **Separate business logic** from UI components using custom hooks

## Resource

Explore [Zustand](https://github.com/pmndrs/zustand) as a lightweight alternative for InfinitePay's global state needs—it offers simpler syntax than Redux with excellent TypeScript support.
