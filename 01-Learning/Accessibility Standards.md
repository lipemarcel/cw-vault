---
created: 2025-11-25
tags: [learning, doc, programming, react, accessibility]
---

# Web Accessibility Standards: WCAG 2.1 and Beyond

## Key Concept

Web Content Accessibility Guidelines (WCAG) 2.1 is the international standard ensuring digital products are usable by everyone, including people with disabilities. It follows four principles: **Perceivable, Operable, Understandable, and Robust** (POUR). For InfinitePay's payment interface, accessibility isn't optional—it's critical for financial inclusion.

## Practical Example in React/Next.js

```typescript
// ❌ Poor accessibility
<button onClick={handlePayment}>Pay Now</button>

// ✅ WCAG compliant
<button 
  onClick={handlePayment}
  aria-label="Complete payment of $99.99"
  aria-describedby="payment-terms"
  disabled={isProcessing}
>
  Pay Now
</button>
<span id="payment-terms" className="sr-only">
  By clicking, you agree to our terms
</span>
```

Key improvements:
- **aria-label** provides context for screen readers
- **sr-only** class hides text visually but keeps it accessible
- Proper button state management with `disabled`
- Semantic HTML structure

## Actionable Best Practices

1. **Color contrast**: Ensure 4.5:1 ratio for normal text (WCAG AA standard)
2. **Keyboard navigation**: All interactive elements must be keyboard accessible
3. **Form labels**: Always link `<label>` to inputs using `htmlFor`
4. **Alt text**: Describe images meaningfully for payment-related visuals
5. **Focus management**: Use `useRef` and `focus()` for modal dialogs
6. **Test regularly**: Use axe DevTools or Wave browser extensions

## Automation Tip

Integrate accessibility testing in CI/CD:
```bash
npm install --save-dev @axe-core/react jest-axe
```

This catches violations before production—crucial for financial applications handling sensitive transactions.

## Resource

**[WCAG 2.1 Guidelines](https://www.w3.org/WAI/WCAG21/quickref/)** - Official W3C reference with examples and success criteria for each level (A, AA, AAA).
