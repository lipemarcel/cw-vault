---
created: 2025-12-25
tags: [learning, doc, programming, react, nextjs]
---

# React Server Components Patterns

## Key Concept

React Server Components (RSCs) enable you to render components exclusively on the server, reducing JavaScript sent to the client. This pattern is foundational in Next.js 13+ App Router, where components are server-side by default unless marked with `'use client'`.

## How It Works

Server Components can directly access databases, APIs, and sensitive credentials without exposing them to the browser. They're ideal for data-fetching layers and reducing bundle size.

```typescript
// app/products/page.tsx (Server Component by default)
async function ProductList() {
  const products = await fetch('https://api.example.com/products', {
    headers: { Authorization: `Bearer ${process.env.API_KEY}` }
  }).then(res => res.json());
  
  return (
    <ul>
      {products.map(p => <ProductCard key={p.id} product={p} />)}
    </ul>
  );
}

// Client Component for interactivity
'use client';
function ProductCard({ product }) {
  const [liked, setLiked] = useState(false);
  return <div onClick={() => setLiked(!liked)}>{product.name}</div>;
}
```

## Best Practices

1. **Keep Server Components at the top level** — Fetch data as high as possible to minimize client-side dependencies
2. **Compose strategically** — Use Server Components for data fetching; pass data to Client Components for interactivity
3. **Avoid passing functions to Client Components** — Server-side functions can't serialize; use Server Actions instead
4. **Use Server Actions for mutations** — Wrap database writes with `'use server'` directives for type-safe form handling

## Actionable Tip

When building InfinitePay features, identify data dependencies early. If a component needs real-time interactivity, wrap only that portion in `'use client'` while keeping parent fetching logic server-side.

## Resource

[Next.js Server Components Deep Dive](https://nextjs.org/docs/app/building-your-application/rendering/server-components) — Official documentation with interactive examples and migration strategies.
