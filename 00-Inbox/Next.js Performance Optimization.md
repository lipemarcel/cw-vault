---
created: 2025-11-30
tags: [learning, doc, programming, nextjs, performance]
---

# Next.js Performance Optimization: Image Optimization & Code Splitting

## Key Concept

Next.js provides built-in performance optimization tools that significantly reduce bundle size and improve Core Web Vitals. The two most impactful patterns are **automatic image optimization** via the `Image` component and **automatic code splitting** through route-based bundling.

## Practical Example

Instead of using standard HTML images in your InfinitePay payment dashboard:

```tsx
// ❌ Inefficient
<img src="/payment-icon.png" alt="Payment" width="100" height="100" />

// ✅ Optimized with Next.js Image
import Image from 'next/image';

<Image 
  src="/payment-icon.png" 
  alt="Payment"
  width={100}
  height={100}
  priority // Use for above-fold images
  placeholder="blur" // Shows blurred placeholder while loading
/>
```

Code splitting happens automatically—Next.js creates separate bundles for each route, so your `/checkout` page doesn't load code for the `/dashboard`.

## Actionable Best Practices

1. **Use `next/image`** for all images to enable automatic optimization (WebP conversion, responsive sizing, lazy loading)
2. **Leverage `priority` prop** for critical images above the fold to prevent Largest Contentful Paint (LCP) delays
3. **Implement dynamic imports** for heavy components:
   ```tsx
   const PaymentModal = dynamic(() => import('@/components/PaymentModal'), 
     { loading: () => <div>Loading...</div> }
   );
   ```
4. **Monitor Core Web Vitals** using Next.js Analytics or PageSpeed Insights
5. **Use `next/font`** for optimized font loading to prevent layout shift

## Resource for Deeper Learning

**Next.js Official Documentation on Performance**: https://nextjs.org/docs/app/building-your-application/optimizing/overview

This covers image optimization, font loading, script optimization, and bundle analysis tools essential for production-grade applications like InfinitePay.
