---
created: 2025-12-15
tags: [learning, doc, programming, testing, nextjs]
---

# Testing Best Practices for Next.js Applications

## Key Concept: The Testing Pyramid

The testing pyramid is a strategic approach to test distribution: many unit tests (fast, isolated), fewer integration tests (moderate complexity), and minimal end-to-end tests (slow, comprehensive). This balance maximizes coverage while maintaining reasonable CI/CD pipeline speeds.

## Practical Example

For an InfinitePay payment component:

**Unit Test** (Jest):
```typescript
describe('PaymentProcessor', () => {
  it('should calculate correct fee', () => {
    const processor = new PaymentProcessor();
    expect(processor.calculateFee(1000, 0.02)).toBe(20);
  });
});
```

**Integration Test** (Testing Library):
```typescript
it('should submit payment form successfully', async () => {
  render(<PaymentForm />);
  await userEvent.type(screen.getByLabelText(/amount/i), '100');
  await userEvent.click(screen.getByRole('button', { name: /pay/i }));
  expect(await screen.findByText(/success/i)).toBeInTheDocument();
});
```

**E2E Test** (Playwright):
```typescript
test('complete payment flow', async ({ page }) => {
  await page.goto('/checkout');
  await page.fill('input[name="amount"]', '100');
  await page.click('button:has-text("Process Payment")');
  await expect(page).toHaveURL('/confirmation');
});
```

## Actionable Tips

1. **Aim for 70-80% coverage** on critical payment paths; 100% coverage is rarely worth the effort
2. **Test behavior, not implementation** — refactor code without breaking tests
3. **Use data builders** for complex test setup in payment scenarios
4. **Mock external APIs** (payment gateways) to avoid flaky tests
5. **Run unit tests locally** before pushing; E2E tests in CI only

## Resource

Check out **Testing Library's best practices guide**: https://testing-library.com/docs/queries/about/ — excellent for writing maintainable tests focused on user interactions rather than implementation details.
