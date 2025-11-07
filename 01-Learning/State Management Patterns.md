---
created: 2025-11-03
tags: [learning, doc, programming, react, state-management]
---

# State Management Patterns in React Applications

## Key Concept

State management patterns define how data flows through your application. The choice between local state, context, and external libraries depends on complexity and scope. For InfinitePay's payment processing features, understanding when to use each pattern prevents prop drilling and maintains scalability.

## Pattern Hierarchy

1. **Local State (useState)**: Single component concerns
2. **Context API**: Shared state across component trees (auth, theme)
3. **External Libraries (Zustand, Jotai)**: Complex, frequently-changing state

## Practical Example

For a payment form with validation state, discount application, and submission status:

```typescript
// ✅ Context for global payment context
const PaymentContext = createContext<PaymentContextType | null>(null);

export function PaymentProvider({ children }) {
  const [discount, setDiscount] = useState(0);
  const [isProcessing, setIsProcessing] = useState(false);
  
  return (
    <PaymentContext.Provider value={{ discount, setDiscount, isProcessing }}>
      {children}
    </PaymentContext.Provider>
  );
}

// ✅ Local state for form-specific data
function PaymentForm() {
  const [formData, setFormData] = useState({ amount: '', email: '' });
  const { discount, isProcessing } = useContext(PaymentContext);
  
  // Component logic
}
```

## Best Practices

- **Keep it simple**: Start with useState; migrate only when necessary
- **Avoid context for frequently-changing data**: Use Zustand for high-frequency updates
- **Provider structure**: Wrap providers at appropriate levels (Payment, Auth, Theme)
- **TypeScript**: Always type your context to catch errors early
- **Memoization**: Use useMemo for derived values in context to prevent unnecessary re-renders

## Actionable Tips

1. Profile state updates using React DevTools Profiler
2. Keep context consumers close to their data needs
3. Separate concerns: one context per domain (auth, payments, ui)
4. Use Zustand for payment transaction states with complex side effects

## Resource

[React Context vs State Management Libraries](https://tkdodo.eu/blog/react-query) - TK Dodo's comprehensive guide on choosing patterns
