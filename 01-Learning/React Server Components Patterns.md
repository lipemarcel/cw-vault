---
created: 2025-12-27
tags: [learning, doc, programming, react, nextjs]
---

# React Server Components Patterns

## Key Concept

React Server Components (RSCs) are components that render exclusively on the server, enabling you to access databases and secrets directly without exposing them to the client. This pattern reduces JavaScript sent to browsers and improves security by keeping sensitive logic server-side.

## Practical Example

In a Next.js 13+ app directory, create a server component to fetch payment data:

```typescript
// app/dashboard/payments/page.tsx
export default async function PaymentsPage() {
  const payments = await fetch('your-api-endpoint', {
    headers: { Authorization: `Bearer ${process.env.API_SECRET}` }
  });
  
  const data = await payments.json();
  
  return (
    <div>
      <h1>Payment History</h1>
      <PaymentsList payments={data} />
    </div>
  );
}

// This is a Server Component - no 'use client' directive
```

For interactive elements, use the `'use client'` directive:

```typescript
// app/dashboard/payments/client-filter.tsx
'use client';

export function PaymentFilter({ payments }: { payments: Payment[] }) {
  const [filter, setFilter] = useState('');
  
  return (
    <input 
      value={filter} 
      onChange={(e) => setFilter(e.target.value)}
    />
  );
}
```

## Best Practices

1. **Keep server components by default** — Only add `'use client'` when you need interactivity
2. **Pass serializable data** — Server components can pass objects to client components, but avoid functions
3. **Avoid passing server secrets** to client components
4. **Use streaming** with `<Suspense>` for better UX while data loads
5. **Leverage async/await** directly in server components without loading states

## Actionable Tips

- Profile your bundle size reduction using Next.js analytics
- Gradually migrate existing pages to RSCs rather than a full rewrite
- Use TypeScript generics for type-safe data passing between server and client components

## Resource

[Next.js Server Components Documentation](https://nextjs.org/docs/app/building-your-application/rendering/server-components) — Comprehensive guide with patterns and limitations.
