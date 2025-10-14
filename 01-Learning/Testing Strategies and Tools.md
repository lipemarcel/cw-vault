---
created: 2025-10-14
tags: [learning, doc, programming]
---

# Testing Strategies and Tools

## Overview

InfinitePay projects use a comprehensive testing strategy covering unit, integration, and end-to-end tests. Understanding these tools is essential for maintaining code quality.

## Testing Stack

### Unit and Integration Testing
- **Jest** - Test runner and assertion library
- **Testing Library** - Component testing utilities
- **@testing-library/react** - React-specific helpers
- **@testing-library/user-event** - User interaction simulation

### End-to-End Testing
- **Playwright** - Modern E2E testing framework
- Used in dashboard and receipt applications
- Cross-browser testing (Chromium, Firefox, WebKit)

### Code Quality
- **Biome** (Dashboard) - Fast linter/formatter (replaces ESLint + Prettier)
- **ESLint** (Design System) - Traditional linting
- **Stylelint** - CSS linting
- **Knip** - Find unused exports and dependencies

## Testing Patterns

### 1. Component Testing with Testing Library

```typescript
import { render, screen } from '@testing-library/react'
import userEvent from '@testing-library/user-event'

test('button click triggers callback', async () => {
  const handleClick = jest.fn()
  render(<Button onClick={handleClick}>Click me</Button>)

  await userEvent.click(screen.getByText('Click me'))
  expect(handleClick).toHaveBeenCalledTimes(1)
})
```

**Key Principles:**
- Test behavior, not implementation
- Query by accessibility attributes
- Simulate real user interactions

### 2. Snapshot Testing

```typescript
test('renders correctly', () => {
  const { container } = render(<Component />)
  expect(container).toMatchSnapshot()
})
```

**Use Cases:**
- Component structure validation
- Detecting unintended changes
- Generated markup verification

### 3. Mocking

```typescript
// Mock API calls
jest.mock('wretch', () => ({
  default: jest.fn(() => ({
    get: jest.fn(),
    post: jest.fn(),
  }))
}))

// Mock Next.js router
jest.mock('next/navigation', () => ({
  useRouter: () => ({
    push: jest.fn(),
    pathname: '/',
  })
}))
```

### 4. E2E Testing with Playwright

```typescript
import { test, expect } from '@playwright/test'

test('user can complete checkout', async ({ page }) => {
  await page.goto('/checkout')
  await page.fill('[name="email"]', 'user@example.com')
  await page.click('button[type="submit"]')
  await expect(page).toHaveURL('/success')
})
```

## Test Commands by Repository

### CNP Monorepo
```bash
bun test                    # All tests
bun test:watch              # Watch mode
bun test:coverage           # With coverage
bun test:playwright         # E2E tests
```

### Dashboard
```bash
pnpm test                   # Unit tests (silent)
pnpm test:watch             # Watch mode
pnpm test:ci                # CI with Jest JUnit reporter
pnpm test:coverage          # Full coverage report
pnpm test:playwright        # E2E tests
pnpm test:dev:playwright    # E2E in dev mode
pnpm test:ci:playwright     # E2E in CI
```

### Design System
```bash
pnpm test                   # Tests with icon generation
pnpm test:ci                # CI mode
pnpm coverage               # Coverage only
```

### Receipt
```bash
pnpm test                   # Unit tests (UTC timezone)
pnpm test:ci                # CI mode
pnpm test:playwright        # E2E tests
pnpm test:playwright:ui     # Playwright UI mode
pnpm test:no-coverage       # Fast mode
```

## Jest Configuration Highlights

### Dashboard jest.config.js
```javascript
{
  testEnvironment: 'jsdom',
  setupFilesAfterEnv: ['<rootDir>/jest.setup.js'],
  moduleNameMapper: {
    '^@/(.*)$': '<rootDir>/src/$1',
    '\\.(css|scss)$': 'identity-obj-proxy'
  },
  collectCoverageFrom: [
    'src/**/*.{ts,tsx}',
    '!src/**/*.stories.tsx'
  ]
}
```

### Key Settings
- **testEnvironment: 'jsdom'** - Browser-like environment
- **setupFilesAfterEnv** - Global test setup (mocks, extensions)
- **moduleNameMapper** - Path aliases and static asset mocks
- **collectCoverageFrom** - Coverage inclusion/exclusion

## Playwright Configuration

### playwright.config.ts
```typescript
{
  testDir: './tests/e2e',
  use: {
    baseURL: 'http://localhost:3000',
    trace: 'on-first-retry',
    screenshot: 'only-on-failure'
  },
  projects: [
    { name: 'chromium', use: { ...devices['Desktop Chrome'] } },
    { name: 'firefox', use: { ...devices['Desktop Firefox'] } },
    { name: 'webkit', use: { ...devices['Desktop Safari'] } }
  ]
}
```

### Features
- Multi-browser testing
- Trace viewer for debugging
- Screenshots on failure
- Video recording
- Mobile device emulation

## Learning Path

### 1. Master Testing Library
- Learn querying methods (getBy, findBy, queryBy)
- Understand user-event vs fireEvent
- Study accessibility queries
- Practice writing maintainable tests

### 2. Understand Jest
- Mocking strategies (modules, functions, timers)
- Async testing patterns
- Snapshot testing best practices
- Coverage configuration

### 3. Learn Playwright
- Page object patterns
- Selector strategies
- Test isolation and fixtures
- Debugging tools (trace viewer, inspector)

### 4. Testing Best Practices
- AAA pattern (Arrange, Act, Assert)
- Test independence
- Meaningful test descriptions
- Avoid implementation details
- Balance test types (pyramid)

## Testing Pyramid

```
         /\
        /E2E\        Few, slow, expensive
       /------\
      /  Int  \      More, moderate speed
     /--------\
    /   Unit   \     Many, fast, cheap
   /------------\
```

**Balance:**
- **Unit tests** - Core logic, utilities, pure functions
- **Integration tests** - Component interactions, API calls
- **E2E tests** - Critical user flows, smoke tests

## Common Testing Patterns

### 1. Custom Render with Providers
```typescript
const customRender = (ui: React.ReactElement) => {
  return render(
    <IntlProvider>
      <QueryProvider>
        {ui}
      </QueryProvider>
    </IntlProvider>
  )
}
```

### 2. Waiting for Async Updates
```typescript
await waitFor(() => {
  expect(screen.getByText('Loaded')).toBeInTheDocument()
})
```

### 3. Testing Hooks
```typescript
import { renderHook } from '@testing-library/react'

test('useDebounce', () => {
  const { result, rerender } = renderHook(
    ({ value }) => useDebounce(value, 500),
    { initialProps: { value: 'initial' } }
  )

  expect(result.current).toBe('initial')
})
```

## Tools to Master

1. **Jest** - Test runner and mocking
2. **Testing Library** - Component testing
3. **Playwright** - E2E automation
4. **Biome** - Fast linting/formatting
5. **Coverage tools** - Istanbul/NYC

## Related Concepts

- Test-driven development (TDD)
- Behavior-driven development (BDD)
- Continuous integration testing
- Test coverage metrics
- Mutation testing
- Visual regression testing

## Resources

- [Testing Library Docs](https://testing-library.com/)
- [Jest Documentation](https://jestjs.io/)
- [Playwright Documentation](https://playwright.dev/)
- [Testing JavaScript](https://testingjavascript.com/)
- [Kent C. Dodds Testing Blog](https://kentcdodds.com/blog)
