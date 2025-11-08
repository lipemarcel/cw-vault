---
created: 2025-11-08
tags: [learning, doc, programming, react, typescript, state-management]
---

# State Management Patterns in React Applications

## Key Concept

**Lifting State Up** is a fundamental pattern where shared state is moved to the nearest common ancestor component, allowing multiple child components to access and modify the same data. This prevents prop drilling and keeps your component tree predictable and maintainable.

## Practical Example for InfinitePay

Consider a payment form where both `PaymentAmount` and `PaymentSummary` components need to access transaction state:

```typescript
// ❌ Avoid: Prop drilling
<PaymentForm amount={amount} onAmountChange={setAmount} />
<PaymentSummary amount={amount} fee={calculateFee(amount)} />

// ✅ Better: Lift state to parent
export const PaymentContainer: React.FC = () => {
  const [amount, setAmount] = useState<number>(0);
  
  return (
    <>
      <PaymentForm value={amount} onChange={setAmount} />
      <PaymentSummary amount={amount} />
    </>
  );
};
```

## Actionable Tips

1. **Identify shared state early**: Ask "which components need this data?" If it's more than one, consider lifting state up.

2. **Use TypeScript for safety**: Define proper interfaces for your state callbacks:
```typescript
interface PaymentContextType {
  amount: number;
  setAmount: (value: number) => void;
}
```

3. **Know when to use Context**: For deeply nested components, use React Context to avoid excessive prop drilling while keeping components reusable.

4. **Consider Zustand for complex state**: For InfinitePay's transaction flows, a lightweight state management library can be more scalable than Context alone.

## Best Practice

Keep state as close to where it's needed as possible. Lifting too high creates unnecessary re-renders; lifting too low causes prop drilling. Strike a balance.

## Resource

**React Documentation: Lifting State Up** - https://react.dev/learn/sharing-state-between-components
Excellent interactive examples showing state patterns in practice.
