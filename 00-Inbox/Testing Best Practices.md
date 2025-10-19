---
created: 2025-10-19
tags: [learning, doc, programming, testing, react]
---

# Component Testing Best Practices with React Testing Library

React Testing Library has become the standard for testing React components, promoting more maintainable and user-centric tests. Today's focus is on writing better component tests.

## Key Concept: Testing User Behavior, Not Implementation

Instead of testing implementation details (like component state), focus on testing how users interact with your component. This makes tests more resilient to refactoring and better reflects real user experiences.

## Practical Example:

```typescript
// PaymentForm.test.tsx
import { render, screen, fireEvent } from '@testing-library/react'
import { PaymentForm } from './PaymentForm'

describe('PaymentForm', () => {
  test('submits payment with valid card details', async () => {
    render(<PaymentForm />)
    
    // Find elements by role and text (preferred over testId)
    fireEvent.change(screen.getByLabelText(/card number/i), {
      target: { value: '4111111111111111' }
    })
    
    fireEvent.change(screen.getByLabelText(/expiry/i), {
      target: { value: '12/25' }
    })
    
    fireEvent.click(screen.getByRole('button', { name: /pay/i }))
    
    // Assert the success message appears
    expect(await screen.findByText(/payment successful/i)).toBeInTheDocument()
  })
})
```

## Best Practices:
1. Use semantic queries (getByRole, getByLabelText) over testId
2. Test component behavior from user perspective
3. Write tests that tolerate implementation changes
4. Include accessibility considerations in tests

## Recommended Resource:
"Common Mistakes with React Testing Library" by Kent C. Dodds
https://kentcdodds.com/blog/common-mistakes-with-react-testing-library

This guide covers advanced patterns and common pitfalls when testing React components.
