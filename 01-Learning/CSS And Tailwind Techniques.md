---
created: 2025-12-09
tags: [learning, doc, programming, react, tailwind]
---

# CSS and Tailwind Techniques for Modern UI Development

## Key Concept: Utility-First CSS with Tailwind

Tailwind CSS shifts from traditional component-based styling to a **utility-first approach**, where you compose styles directly in your markup using predefined utility classes. This reduces context-switching and accelerates development while maintaining consistency.

## Practical Example in Next.js/React

Instead of writing custom CSS:
```tsx
// ❌ Traditional approach
// styles.css
.payment-card {
  background: white;
  border-radius: 8px;
  box-shadow: 0 4px 6px rgba(0,0,0,0.1);
  padding: 1.5rem;
}

// ✅ Tailwind approach
export function PaymentCard({ children }) {
  return (
    <div className="bg-white rounded-lg shadow-md p-6">
      {children}
    </div>
  );
}
```

## Advanced Techniques for InfinitePay

1. **Responsive Design**: Stack payment forms on mobile using `flex-col md:flex-row`
2. **Dark Mode**: Add `dark:` prefix for theme variants: `bg-white dark:bg-slate-900`
3. **Custom Config**: Extend `tailwind.config.js` for brand colors matching Cloudwalk's design system
4. **CSS Layers**: Use `@layer` directives for organizing utilities and components without specificity issues

## Best Practices

- Use `@apply` sparingly; prefer composing utility classes directly
- Leverage Tailwind's arbitrary values: `rounded-[8px]` for non-standard sizes
- Optimize bundle size with PurgeCSS by ensuring all template paths are in `content` config
- Maintain consistency using design tokens in `tailwind.config.js` for spacing, colors, and typography

## Resource

**[Tailwind CSS Documentation - Customization](https://tailwindcss.com/docs/configuration)** – Master config-driven theming for payment UIs requiring brand consistency.
