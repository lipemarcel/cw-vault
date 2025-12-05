---
created: 2025-12-05
tags: [learning, doc, programming, accessibility, react]
---

# Web Accessibility Standards: WCAG 2.1 Compliance

## Key Concept

Web Content Accessibility Guidelines (WCAG) 2.1 are the international standard for making web applications usable by everyone, including people with disabilities. The framework is organized around four principles: **Perceivable, Operable, Understandable, and Robust (POUR)**.

For InfinitePay, ensuring accessibility isn't just ethical—it's crucial for payment systems that serve diverse users globally.

## Practical Example in Next.js/React

```tsx
// ❌ Poor accessibility
<button onClick={handlePayment}>Pay</button>

// ✅ Accessible implementation
<button 
  onClick={handlePayment}
  aria-label="Proceed to payment of $99.99"
  aria-describedby="payment-terms"
>
  Pay $99.99
  <span id="payment-terms" className="sr-only">
    Terms apply. See details below.
  </span>
</button>

// Screen reader text utility
const srOnly: CSSProperties = {
  position: 'absolute',
  width: '1px',
  height: '1px',
  overflow: 'hidden'
};
```

## Actionable Best Practices

1. **Semantic HTML**: Use proper heading hierarchy (`<h1>`, `<h2>`), form labels, and landmark elements (`<nav>`, `<main>`, `<footer>`)

2. **Color Contrast**: Maintain minimum 4.5:1 contrast ratio for normal text (WCAG AA standard)

3. **Keyboard Navigation**: Ensure all interactive elements are keyboard accessible with visible focus indicators

4. **Form Accessibility**: Always associate labels with inputs using `htmlFor` attribute and provide clear error messages

5. **ARIA Attributes**: Use `aria-label`, `aria-describedby`, `aria-live` for dynamic content updates (especially important for payment confirmations)

6. **Testing**: Integrate accessibility testing into your pipeline using tools like ESLint plugins and automated testing

## Quick Tips

- Use TypeScript's strict typing to catch missing accessibility attributes
- Test with screen readers (NVDA, JAWS) during development
- Implement focus management when payment modals appear

## Resource for Deeper Learning

**WebAIM's WCAG 2.1 Quick Reference**: https://webaim.org/articles/wcag2/

Start with Level A compliance, then work toward AA (standard industry requirement).
