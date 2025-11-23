---
created: 2025-11-23
tags: [learning, doc, programming, testing, react]
---

# Testing Best Practices for React Components

## Key Concept

The **Testing Pyramid** principle advocates writing more unit tests, fewer integration tests, and minimal end-to-end tests. This approach balances test coverage with execution speed and maintenance burden—critical for payment systems like InfinitePay where reliability is paramount.

## Practical Example

For a payment form component in InfinitePay, structure your tests like this:

```typescript
// Unit test: Input validation
test('validates card number format', () => {
  render(<CardInput />);
  const input = screen.getByRole('textbox');
  fireEvent.change(input, { target: { value: 'invalid' } });
  expect(screen.getByText(/invalid card/i)).toBeInTheDocument();
});

// Integration test: Form submission flow
test('submits payment data correctly', async () => {
  render(<PaymentForm />);
  fireEvent.change(screen.getByPlaceholderText(/card number/i), {
    target: { value: '4111111111111111' }
  });
  fireEvent.click(screen.getByRole('button', { name: /pay/i }));
  await waitFor(() => {
    expect(mockApi).toHaveBeenCalledWith(expectedPayload);
  });
});
```

## Actionable Tips

1. **Mock external APIs** to isolate component logic—use `jest.mock()` for payment gateway calls
2. **Test user behavior**, not implementation details—query by accessible roles, not classNames
3. **Keep tests focused**—one assertion per test when possible for clarity
4. **Use TypeScript** with testing libraries for type safety in test code
5. **Prioritize critical paths**—payment processing, validation, and error handling deserve thorough coverage

## Best Practices

- Use `@testing-library/react` over Enzyme for React 18+ compatibility
- Avoid snapshot tests for dynamic content; they create brittle tests
- Test accessibility alongside functionality with `screen.getByRole()`
- Run tests in CI/CD pipelines before deployment

## Resource

[Testing Library Documentation](https://testing-library.com/docs/react-testing-library/intro) - Comprehensive guide with examples for modern React testing patterns.
