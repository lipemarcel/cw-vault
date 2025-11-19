---
created: 2025-11-19
tags: [learning, doc, programming, react, tailwind]
---

# Mastering Tailwind CSS Composition Patterns

## Key Concept

Tailwind CSS shines when you leverage **composition over repetition**. Instead of scattering utility classes throughout components, use `@apply` directives and component abstractions to create reusable style patterns. This becomes crucial in payment UI systems like InfinitePay where consistency matters.

## Practical Example

For InfinitePay's form inputs, create a reusable component instead of repeating classes:

```typescript
// components/PaymentInput.tsx
export function PaymentInput({ label, ...props }: InputProps) {
  return (
    <div className="space-y-2">
      <label className="block text-sm font-medium text-gray-700">
        {label}
      </label>
      <input
        className="w-full px-4 py-2 border border-gray-300 rounded-lg 
                   focus:ring-2 focus:ring-blue-500 focus:border-transparent 
                   transition-all duration-200"
        {...props}
      />
    </div>
  );
}
```

Then use consistently across payment forms:

```typescript
<PaymentInput label="Card Number" placeholder="•••• •••• •••• ••••" />
```

## Best Practices

1. **Extract component-level styles** – Create wrapper components for repeated patterns rather than duplicating classes
2. **Use CSS modules for complex layouts** – Combine Tailwind with `@apply` for component-specific styles
3. **Organize utility order** – Position responsive prefixes first: `md:`, `lg:`, then dark mode: `dark:`
4. **Leverage Tailwind config** – Define custom colors/spacing matching InfinitePay's brand in `tailwind.config.js`

```typescript
// tailwind.config.js
theme: {
  extend: {
    colors: {
      infinitepay: '#0066FF',
    }
  }
}
```

## Actionable Tip

Audit your codebase for repeated class strings. If you see the same utility combination 3+ times, it's a candidate for a component wrapper.

**Resource:** [Tailwind CSS Documentation on Reusable Components](https://tailwindcss.com/docs/reusing-styles)
