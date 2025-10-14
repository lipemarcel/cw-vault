---
created: 2025-10-14
tags: [learning, doc, design-system, programming]
---

# Design System Architecture (infinitepay-ds-web)

## Overview

The InfinitePay Design System is a comprehensive component library built with React, TypeScript, and Tailwind CSS. It provides reusable UI components used across all InfinitePay applications.

## Architecture

### Component Organization
- **atoms/** - Basic building blocks (Button, Input, Icon)
- **molecules/** - Combinations of atoms (FormField, Card)
- **templates/** - Page-level layouts
- **hooks/** - Reusable React hooks
- **util/** - Utility functions
- **calendar/** - Calendar-specific components
- **dataviz/** - Data visualization components (Recharts)

### Technology Stack
- **React 19** - Component library
- **TypeScript** - Type safety
- **Tailwind CSS** - Utility-first styling
- **Vite** - Build tool
- **Storybook** - Component documentation and testing
- **Jest** - Unit testing

## Key Concepts

### 1. Modular Exports
```typescript
// Import from specific modules
import { Button } from '@cloudwalk/infinitepay-ds-web/atoms'
import { FormField } from '@cloudwalk/infinitepay-ds-web/molecules'
import { useDebounce } from '@cloudwalk/infinitepay-ds-web/hooks'
```

Benefits:
- Tree-shaking friendly
- Smaller bundle sizes
- Clear dependency boundaries

### 2. Icon System
```bash
# Generate icons from SVGs
pnpm generate-icons
pnpm generate:dynamic-icons
```

- Mono icons in `/src/assets/icons`
- Dynamic icon generation script
- Type-safe icon names

### 3. Storybook Integration
```bash
pnpm storybook              # Dev server
pnpm build-storybook        # Production build
pnpm chromatic              # Visual regression testing
```

- Component documentation
- Interactive playground
- Visual testing with Chromatic

## Development Workflow

### Building the Library
```bash
pnpm build                  # Build for production
pnpm build:watch            # Watch mode for development
```

### Testing
```bash
pnpm test                   # Run tests
pnpm test:ci                # CI mode with coverage
pnpm coverage               # Coverage report
```

### Code Quality
```bash
pnpm lint                   # ESLint
pnpm lint:fix               # Auto-fix issues
pnpm format                 # Prettier
pnpm stylelint              # CSS linting
pnpm typecheck              # TypeScript check
```

## Consuming the Design System

### In Dashboard
```typescript
import { Button, Input } from '@cloudwalk/infinitepay-ds-web'
import { useDebounce } from '@cloudwalk/infinitepay-ds-web/hooks'

// Version: 6.2.16 (dashboard uses)
```

### In Receipt
```typescript
// Version: 3.20.0 (receipt uses older version)
```

**Note:** Different applications may use different versions of the design system.

## Learning Path

### 1. Understand Component Patterns
- Atomic Design methodology
- Composition over inheritance
- Component APIs and props design
- Controlled vs uncontrolled components

### 2. Study Build Configuration
- Vite configuration for library mode
- Multiple entry points for modular exports
- Type generation with `vite-plugin-dts`
- CSS extraction and optimization

### 3. Styling Approach
- Tailwind CSS utility classes
- Custom Tailwind configuration
- PostCSS plugins
- CSS Modules for scoped styles

### 4. Testing Strategy
- Unit tests with Jest and Testing Library
- Visual regression with Storybook + Chromatic
- Accessibility testing
- Component API testing

### 5. Publishing and Versioning
- Semantic versioning with semantic-release
- GitHub Packages registry
- Changelog generation
- Breaking change management

## Best Practices

1. **Keep components simple** - Single responsibility
2. **Document with Storybook** - Every component should have stories
3. **Type everything** - Comprehensive TypeScript types
4. **Test thoroughly** - Unit tests + visual tests
5. **Follow accessibility guidelines** - ARIA attributes, keyboard navigation
6. **Use semantic HTML** - Proper element choice
7. **Optimize bundle size** - Tree-shakeable exports

## Common Patterns

### Compound Components
```typescript
<Select>
  <Select.Trigger />
  <Select.Content>
    <Select.Item />
  </Select.Content>
</Select>
```

### Render Props
```typescript
<DataTable
  renderRow={(item) => <CustomRow data={item} />}
/>
```

### Hook-based Logic
```typescript
// Extract complex logic into hooks
const { value, onChange } = useControlledState(props)
```

## Related Concepts to Study

- Atomic Design methodology
- Component library architecture
- CSS-in-JS vs utility-first CSS
- Design tokens and theming
- Accessibility (a11y) standards
- Visual regression testing
- Package publishing strategies

## Resources

- [Storybook Documentation](https://storybook.js.org/)
- [Atomic Design](https://atomicdesign.bradfrost.com/)
- [Vite Library Mode](https://vitejs.dev/guide/build.html#library-mode)
- [Tailwind CSS](https://tailwindcss.com/)
- DS Web Storybook (internal deployment)
