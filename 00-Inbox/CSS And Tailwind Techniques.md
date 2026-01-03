---
created: 2026-01-03
tags: [learning, doc, programming, react, tailwind]
---

# Mastering Tailwind CSS Composition Patterns

## Key Concept

Tailwind CSS composition is about creating reusable, maintainable styles without fighting the utility-first philosophy. Rather than creating custom CSS classes, leverage **component composition** and **Tailwind's @apply directive** strategically to keep your codebase DRY while maintaining clarity.

## Practical Example

For InfinitePay's payment form components, instead of scattered inline classes:

```tsx
// ❌ Repetitive and hard to maintain
<input className="px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" />

// ✅ Better: Component composition
const PaymentInput: React.FC<InputProps> = (props) => (
  <input 
    className="px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 transition-all"
    {...props}
  />
);

// ✅ Or use @apply in CSS for larger patterns
/* styles.css */
@layer components {
  @apply px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500;
}
```

## Best Practices

1. **Component > CSS**: Create React components for repeated style patterns rather than extracting to CSS classes
2. **Conditional Classes**: Use `clsx` or `classnames` for dynamic styles:
```tsx
className={clsx(
  "base-styles",
  isActive && "active-styles",
  variant === "primary" && "primary-styles"
)}
```
3. **Custom Config**: Extend `tailwind.config.js` with brand colors/spacing for InfinitePay consistency
4. **Avoid Over-nesting**: Keep utility classes readable (3-5 per line max)

## Resource

- **Tailwind CSS Best Practices**: https://tailwindcss.com/docs/reusing-styles
