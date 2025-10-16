---
created: 2025-10-15
tags: [learning, doc, programming, nextjs, performance]
---

# Image Optimization in Next.js 13+

Next.js provides built-in Image Optimization through the `next/image` component, which is crucial for performance and Core Web Vitals. However, many developers don't fully utilize its capabilities.

## Key Concept
The `next/image` component automatically handles:
- Lazy loading
- Image resizing
- Format optimization (WebP/AVIF)
- Preventing Cumulative Layout Shift (CLS)

## Practical Example
```typescript
import Image from 'next/image';

function ProductCard({ product }: { product: Product }) {
  return (
    <div className="card">
      <Image
        src={product.imageUrl}
        alt={product.name}
        width={300}
        height={200}
        placeholder="blur"
        blurDataURL={product.thumbnailUrl}
        priority={product.isHero}
      />
    </div>
  );
}
```

## Best Practices
1. Always specify `width` and `height` to prevent layout shifts
2. Use `priority` prop for above-the-fold images
3. Implement `placeholder="blur"` for better perceived performance
4. Use proper `alt` texts for accessibility
5. Consider using the `sizes` prop for responsive images

## Optimization Tips
- Set appropriate `quality` (default is 75)
- Use the `unoptimized` prop for already optimized images
- Configure domains in `next.config.js` for external images

## Further Learning
Check out the comprehensive guide on Image Optimization in Next.js documentation:
https://nextjs.org/docs/app/building-your-application/optimizing/images

Remember that proper image optimization can significantly improve your InfinitePay application's loading performance and user experience.
