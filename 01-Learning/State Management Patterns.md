---
created: 2025-11-15
tags: [learning, doc, programming, react, state-management]
---

# State Management Patterns in React Applications

## Key Concept

State management patterns define how data flows through your application. The three primary approaches are:

1. **Local State** - Managed within a single component using `useState`
2. **Lifted State** - Shared between sibling components via a common parent
3. **Global State** - Accessible across the entire application using Context API or external libraries

For payment systems like InfinitePay, choosing the right pattern prevents prop drilling and ensures predictable data flow.

## Practical Example

Consider managing user payment status across multiple components:

```typescript
// ✗ Anti-pattern: Prop drilling
<Dashboard user={user} onStatusChange={handleStatusChange} />
  <PaymentCard user={user} onStatusChange={handleStatusChange} />
    <StatusBadge user={user} />

// ✓ Better: Context API
const PaymentContext = createContext<PaymentContextType | undefined>(undefined);

export const PaymentProvider: React.FC<{children: ReactNode}> = ({children}) => {
  const [status, setStatus] = useState('pending');
  
  return (
    <PaymentContext.Provider value={{status, setStatus}}>
      {children}
    </PaymentContext.Provider>
  );
};

// Use in any component
const StatusBadge = () => {
  const {status} = useContext(PaymentContext);
  return <span>{status}</span>;
};
```

## Best Practices

- **Use Context API** for moderate complexity (auth, theme, user preferences)
- **Consider libraries** (Zustand, Redux) for complex state with many interdependencies
- **Keep state as local as possible** to improve performance and maintainability
- **Avoid Context for frequently changing data** - it triggers unnecessary re-renders
- **Combine patterns**: use local state for UI, Context for shared business logic

## Actionable Tips

1. Profile your app with React DevTools to identify unnecessary re-renders
2. Use `useMemo` and `useCallback` with Context to optimize performance
3. Separate business logic state from UI state for clarity

## Resource

**"Taming State in React"** by Kent C. Dodds - Comprehensive guide on when to use each pattern with practical examples: https://kentcdodds.com/blog/application-state-management-with-react
