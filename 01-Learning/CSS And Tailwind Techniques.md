---
created: 2025-11-04
tags: [learning, doc, programming, react, tailwind]
---

# Mastering Tailwind CSS Composition Patterns

## Key Concept

Tailwind CSS composition is about combining utility classes efficiently to avoid repetition and maintain consistency across your Next.js application. Rather than creating custom CSS classes, you leverage Tailwind's `@apply` directive and component abstraction to build reusable, maintainable UI patterns.

## Practical Example

For InfinitePay's payment forms, instead of repeating button styles:

```tsx
// ❌ Avoid repetition
<button className="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition">
  Pay Now
</button>

// ✅ Use component extraction
const PaymentButton = ({ children }) => (
  <button className="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors duration-200">
    {children}
  </button>
);
```

Or use `@apply` in your globals.css:

```css
@layer components {
  .btn-payment {
    @apply px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors duration-200;
  }
}
```

## Best Practices

1. **Extract components early** - Create React components for recurring patterns (buttons, cards, inputs) rather than applying `@apply` everywhere
2. **Use `@layer`** - Organize Tailwind directives into layers (base, components, utilities) for proper specificity
3. **Leverage TypeScript** - Type your component props to ensure consistent styling across the payment dashboard
4. **Responsive-first** - Use Tailwind's responsive prefixes (`md:`, `lg:`) for mobile-friendly payment interfaces
5. **Dark mode support** - Add `dark:` variants for InfinitePay's accessibility requirements

## Actionable Tip

Create a `components/ui/` directory with shared components (Button, Input, Card) styled with Tailwind. This centralizes styling decisions and makes theme updates seamless.

## Resource

[Tailwind CSS Official Docs: Reusing Styles](https://tailwindcss.com/docs/reusing-styles) - Deep dive into @apply, component libraries, and composition strategies.
