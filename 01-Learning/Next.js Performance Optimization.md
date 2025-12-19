---
created: 2025-12-13
tags: [learning, doc, programming, nextjs, performance]
---

# Next.js Performance Optimization: Code Splitting & Dynamic Imports

## Key Concept

Code splitting automatically breaks your bundle into smaller chunks, loading only what's needed for each page. Next.js handles route-based splitting by default, but **dynamic imports** allow component-level optimization for heavy libraries or conditionally-rendered features.

## Practical Example

In InfinitePay's payment dashboard, imagine a detailed analytics chart that loads on demand:

```typescript
// pages/dashboard.tsx
import dynamic from 'next/dynamic';
import { Suspense } from 'react';

const AnalyticsChart = dynamic(
  () => import('@/components/AnalyticsChart'),
  { loading: () => <div>Loading chart...</div> }
);

export default function Dashboard() {
  return (
    <div>
      <h1>Payment Dashboard</h1>
      <Suspense fallback={<div>Loading...</div>}>
        <AnalyticsChart />
      </Suspense>
    </div>
  );
}
```

This defers the chart library (likely heavy) until the component renders, reducing initial page load.

## Best Practices

1. **Use `dynamic()` for below-the-fold components** – delay non-critical UI
2. **Set `ssr: false` for browser-only features** – prevents hydration mismatches
3. **Monitor bundle size** with `next/bundle-analyzer` to identify bottlenecks
4. **Combine with Image optimization** – use `next/image` for responsive, optimized assets
5. **Leverage `next/script`** for third-party scripts with `strategy="lazyOnload"`

## Actionable Tip

Run `npm run build` and check the `.next/static/chunks/` folder. Pages >200KB are candidates for dynamic imports. Profile with Chrome DevTools to verify improvements.

## Resource

[Next.js Performance Documentation](https://nextjs.org/docs/app/building-your-application/optimizing/lazy-loading) – comprehensive guide with interactive examples for both Pages and App Router.
