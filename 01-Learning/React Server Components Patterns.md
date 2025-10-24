---
created: 2025-10-18
tags: [learning, doc, programming, react, nextjs]
---

# Understanding React Server Components Patterns

React Server Components (RSC) represent a fundamental shift in how we build React applications, particularly in Next.js 13+. Today's focus is on effective patterns for using RSCs in InfinitePay projects.

## Key Concept
Server Components run exclusively on the server and never ship to the client, reducing bundle size and enabling direct database/API access without client-side APIs.

## Practical Example
```typescript
// app/payments/page.tsx
async function PaymentsPage() {
  // Direct database query - only runs on server
  const payments = await prisma.payments.findMany({
    where: { merchantId: 'xyz' }
  });

  return (
    <div>
      <h1>Payments</h1>
      <PaymentsList payments={payments} />
      <ClientSideSearch /> {/* Use "use client" */}
    </div>
  );
}
```

## Best Practices
1. Keep data fetching in Server Components when possible
2. Use the "use client" directive only when needed (interactive components)
3. Pass server data as props to Client Components
4. Leverage streaming with Suspense for progressive loading

## Tips for InfinitePay
- Place authentication/authorization logic in Server Components
- Use Server Components for static merchant information displays
- Keep form handling and interactive elements as Client Components

## Deeper Learning
Check out "Server Components Patterns" in the official Next.js documentation:
https://nextjs.org/docs/getting-started/react-essentials

Remember: Server Components are about finding the right balance between server and client rendering for optimal performance and developer experience.
