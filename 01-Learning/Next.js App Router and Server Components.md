---
created: 2025-10-14
tags: [learning, doc, dashboard, receipt, programming]
---

# Next.js App Router and Server Components

## Overview

Both the dashboard and receipt applications use Next.js 15 with the App Router and React Server Components architecture. This represents a fundamental shift in how React applications are built.

## Core Concepts

### Server Components (RSC)
- **Default behavior** - Components are Server Components by default
- **Zero bundle size** - Server logic doesn't ship to browser
- **Direct data access** - Can query databases, read files directly
- **Async components** - Can use async/await at component level

### Client Components
- Marked with `'use client'` directive
- Required for interactivity (useState, useEffect, event handlers)
- Access to browser APIs
- Can import Server Components as children

## Key Patterns

### 1. Data Fetching
```typescript
// Server Component - can directly fetch
async function ProductList() {
  const products = await fetch('/api/products')
  return <div>{/* render products */}</div>
}

// No need for useEffect or useState!
```

### 2. Server Actions
```typescript
'use server'

export async function createOrder(formData: FormData) {
  // Runs on server, called from client
  const data = await db.orders.create(...)
  revalidatePath('/orders')
}
```

### 3. Streaming and Suspense
```typescript
<Suspense fallback={<Loading />}>
  <SlowComponent />
</Suspense>
```

## Dashboard-Specific Features

### Technologies Used
- **Next.js 15.5.4** with App Router
- **React 19** with Server Components
- **next-intl** for internationalization
- **Sentry** for error tracking
- **OpenTelemetry** for observability
- **Playwright** for E2E testing
- **Biome** for linting (instead of ESLint)

### Key Patterns
- Middleware for authentication and routing
- Iron Session for cookie-based sessions
- Server-side rendering with data fetching
- API routes in `app/api/`

## Receipt-Specific Features

### Technologies Used
- **Next.js 15.4.7** with App Router
- **Sentry** for monitoring
- **Satori** for OG image generation
- **html2canvas** for receipt rendering
- **SWR** for client-side data fetching
- **Zustand** for state management

### Key Patterns
- Static generation for receipt templates
- Dynamic OG images with Satori
- Print-optimized layouts
- Client-side receipt rendering

## Learning Path

### 1. Understand the Mental Model
- Server vs Client boundary
- When to use each component type
- Data flow between server and client

### 2. Migration from Pages Router
- Compare old patterns with new patterns
- Understand routing changes
- Learn new data fetching patterns

### 3. Performance Optimization
- Streaming and progressive rendering
- Partial prerendering
- Image optimization with next/image
- Font optimization with next/font

### 4. Advanced Patterns
- Parallel routes
- Intercepting routes
- Route handlers (API routes)
- Middleware for edge logic

## Common Pitfalls

1. **Adding 'use client' too early** - Start with Server Components
2. **Fetching data in Client Components** - Use Server Components when possible
3. **Not understanding the boundary** - Server Components can't pass functions to clients
4. **Over-using useEffect** - Server Components eliminate many useEffect patterns

## Related Concepts to Study

- React Server Components architecture
- Streaming SSR
- Edge runtime vs Node runtime
- Middleware execution at the edge
- next.config.js configuration
- App Router file conventions

## Resources

- [Next.js App Router Documentation](https://nextjs.org/docs/app)
- [React Server Components RFC](https://github.com/reactjs/rfcs/blob/main/text/0188-server-components.md)
- [Next.js 15 Release Notes](https://nextjs.org/blog/next-15)
