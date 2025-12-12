---
created: 2025-12-11
tags: [learning, doc, programming, nextjs, performance]
---

# Next.js Performance Optimization: Image Optimization & Code Splitting

## Key Concept

Next.js provides built-in performance features that significantly reduce bundle size and improve Core Web Vitals. Two critical patterns are **Image Optimization** via the `Image` component and **automatic code splitting** with dynamic imports.

The `Image` component automatically serves optimized, responsive images in modern formats (WebP/AVIF), while dynamic imports ensure JavaScript chunks load only when needed—crucial for InfinitePay's payment flows where every millisecond matters.

## Practical Example

```tsx
// ✅ Good: Optimized image with Next.js Image component
import Image from 'next/image';

export default function PaymentCard() {
  return (
    <Image
      src="/payment-logo.png"
      alt="Payment logo"
      width={200}
      height={100}
      priority // Load immediately for LCP optimization
    />
  );
}

// ✅ Good: Code splitting with dynamic imports
import dynamic from 'next/dynamic';

const PaymentModal = dynamic(() => import('./PaymentModal'), {
  loading: () => <LoadingSpinner />,
  ssr: false, // Disable SSR for client-only components
});

export default function CheckoutPage() {
  return <PaymentModal />;
}
```

## Actionable Best Practices

1. **Use `Image` component** instead of `<img>` tags—automatic lazy-loading, responsive sizing, and format optimization
2. **Set `priority={true}`** only for above-the-fold images (reduces Largest Contentful Paint)
3. **Implement dynamic imports** for modals, payment gateways, and heavy libraries to reduce initial bundle
4. **Monitor with Lighthouse** and Web Vitals to track improvements
5. **Profile with DevTools** to identify slow components before deployment

## Resource

[Next.js Image Optimization Documentation](https://nextjs.org/docs/app/building-your-application/optimizing/images) - Comprehensive guide on responsive images, lazy loading, and performance metrics.
