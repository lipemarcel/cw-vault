---
created: 2025-11-09
tags: [learning, doc, programming, nextjs, performance]
---

# Next.js Performance Optimization: Image Optimization & Code Splitting

## Key Concept

Next.js provides built-in performance features that significantly improve application speed. Two critical patterns are **Image Optimization** and **Code Splitting**. Image Optimization automatically serves responsive images in modern formats (WebP), while Code Splitting ensures only necessary JavaScript loads per route, reducing initial bundle size.

## Practical Example

**Image Optimization:**
```typescript
import Image from 'next/image';

export default function PaymentCard() {
  return (
    <Image
      src="/payment-logo.png"
      alt="InfinitePay Logo"
      width={200}
      height={100}
      priority // Load above-the-fold images immediately
    />
  );
}
```

**Code Splitting with Dynamic Imports:**
```typescript
import dynamic from 'next/dynamic';

const PaymentModal = dynamic(
  () => import('./PaymentModal'),
  { loading: () => <p>Loading...</p> }
);

export default function CheckoutPage() {
  return <PaymentModal />;
}
```

## Best Practices

1. **Use `next/image`** for all images—it handles lazy loading, responsive sizing, and format optimization automatically
2. **Mark above-the-fold images** with `priority` to prevent layout shift (CLS)
3. **Lazy-load heavy components** like modals, charts, or payment forms with `dynamic()` to reduce initial JavaScript bundle
4. **Analyze bundles** with `@next/bundle-analyzer` to identify large dependencies
5. **Enable compression** by verifying gzip is configured in your deployment environment

## Actionable Tips

- Run `npm run build && npm run start` locally to measure real bundle impact
- Check Network tab in DevTools—you should see images in WebP format on supported browsers
- Profile Core Web Vitals using Lighthouse; aim for LCP < 2.5s, CLS < 0.1

## Resource

**Next.js Optimization Guide:** https://nextjs.org/docs/app/building-your-application/optimizing

---
**Why This Matters:** At Cloudwalk, InfinitePay must handle high transaction volumes with fast load times. Optimized images reduce CDN bandwidth costs, while code splitting ensures users on slower connections experience responsive checkout flows.
