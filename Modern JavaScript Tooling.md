---
created: 2025-10-14
tags: [learning, doc, programming]
---

# Modern JavaScript Tooling

## Overview

InfinitePay projects use cutting-edge JavaScript tooling for performance, developer experience, and code quality. Understanding these tools is essential for effective development.

## Package Managers

### Bun (CNP Monorepo)
```json
"packageManager": "bun@1.2.20"
```

**Why Bun:**
- 🚀 **Speed** - 25x faster than npm
- ⚡ **All-in-one** - Runtime, bundler, package manager, test runner
- 🔧 **Drop-in replacement** - Compatible with npm packages
- 📦 **Workspaces** - Built-in monorepo support

**Key Commands:**
```bash
bun install                 # Install dependencies
bun add <package>           # Add dependency
bun run dev                 # Run script
bun test                    # Run tests
```

### pnpm (Dashboard, Design System, Receipt)
```json
"packageManager": "pnpm@10.15.1"
```

**Why pnpm:**
- 💾 **Disk efficiency** - Hard-linked node_modules
- ⚡ **Fast** - Parallel installation
- 🔒 **Strict** - No phantom dependencies
- 🌳 **Monorepo** - Excellent workspace support

**Key Commands:**
```bash
pnpm install                # Install dependencies
pnpm add <package>          # Add dependency
pnpm -r run build           # Run in all workspaces
```

## Build Tools

### Turborepo (CNP Monorepo)
**Purpose:** Monorepo build orchestration

**Key Features:**
- Task caching across packages
- Parallel execution
- Remote caching for teams
- Dependency-aware scheduling

**Configuration (turbo.json):**
```json
{
  "pipeline": {
    "build": {
      "dependsOn": ["^build"],
      "outputs": ["dist/**"]
    },
    "test": {
      "dependsOn": ["build"]
    }
  }
}
```

### Vite (Design System)
**Purpose:** Frontend build tool and dev server

**Why Vite:**
- ⚡ Instant dev server start (no bundling)
- 🔥 Hot Module Replacement (HMR)
- 📦 Optimized production builds
- 🎯 Native ESM support

**Key Features:**
- Library mode for package building
- Plugin ecosystem
- TypeScript support out-of-the-box
- CSS preprocessing

### Webpack (Via Next.js)
**Purpose:** Bundling (abstracted by Next.js)

**Custom Plugins Used:**
- `@codecov/nextjs-webpack-plugin` - Code coverage
- Image optimization
- Source map generation

## Code Quality Tools

### Biome (Dashboard)
**Purpose:** Fast linter + formatter (ESLint + Prettier replacement)

```bash
pnpm biome                  # Check code
pnpm biome:fix              # Fix issues
pnpm ci:check               # CI mode
```

**Why Biome:**
- 🚀 **10-100x faster** than ESLint + Prettier
- 🔧 **Single tool** - Linting and formatting
- ⚡ **Instant** - Written in Rust
- 🎯 **Zero config** - Sensible defaults

**Configuration (biome.json):**
```json
{
  "linter": {
    "enabled": true,
    "rules": {
      "recommended": true
    }
  },
  "formatter": {
    "enabled": true
  }
}
```

### ESLint (Design System, older projects)
**Purpose:** Code linting

**Plugins Used:**
- `@typescript-eslint` - TypeScript support
- `eslint-plugin-react` - React rules
- `eslint-plugin-react-hooks` - Hooks rules
- `eslint-plugin-prettier` - Prettier integration

### Knip (Dashboard)
**Purpose:** Find unused files, exports, and dependencies

```bash
pnpm knip                   # Full analysis
pnpm ci:knip                # CI mode (stricter)
```

**Finds:**
- Unused exports
- Unused dependencies
- Unused files
- Duplicate exports
- Enum members

## TypeScript

### Version Differences
- **Dashboard:** TypeScript 5.4.5
- **Design System:** TypeScript 5.9.2
- **Receipt:** TypeScript 5.9.3

### Key tsconfig.json Settings

```json
{
  "compilerOptions": {
    "target": "ES2022",
    "lib": ["ES2022", "DOM"],
    "jsx": "preserve",              // For Next.js
    "module": "ESNext",
    "moduleResolution": "bundler",  // Modern resolution
    "strict": true,                 // All strict checks
    "paths": {                      // Path aliases
      "@/*": ["./src/*"]
    }
  }
}
```

### Type Checking
```bash
pnpm typecheck              # Check types without emitting
```

## Development Tools

### Husky
**Purpose:** Git hooks

**Common Hooks:**
- `pre-commit` - Lint staged files
- `commit-msg` - Validate commit messages
- `pre-push` - Run tests

**Setup:**
```bash
pnpm prepare                # Install hooks
```

### lint-staged
**Purpose:** Run linters on staged files only

**Configuration:**
```javascript
{
  '*.{ts,tsx}': ['biome check --write'],
  '*.{json,md}': ['prettier --write']
}
```

### Commitizen
**Purpose:** Interactive commit message creator

```bash
pnpm commit                 # Guided commit
```

**Format:** Conventional Commits
```
feat: add new feature
fix: resolve bug
docs: update documentation
```

## Observability and Monitoring

### Sentry
**Purpose:** Error tracking and performance monitoring

**Integration:**
- `@sentry/nextjs` - Next.js SDK
- Source maps for stack traces
- Performance monitoring
- User feedback

### OpenTelemetry
**Purpose:** Distributed tracing and metrics

**Packages:**
- `@opentelemetry/instrumentation`
- `@opentelemetry/exporter-prometheus`
- `@vercel/otel` - Vercel integration

### Prometheus
**Purpose:** Metrics collection

- Counters, gauges, histograms
- Time-series data
- Integration with monitoring dashboards

## Learning Path

### 1. Package Managers
- Learn pnpm workspace features
- Understand Bun's all-in-one approach
- Master dependency management
- Study lock file formats

### 2. Build Tools
- Deep dive into Turborepo configuration
- Learn Vite plugin system
- Understand bundling strategies
- Study code splitting

### 3. Code Quality
- Master Biome configuration
- Learn ESLint rule customization
- Understand linting vs formatting
- Study static analysis

### 4. TypeScript
- Advanced type features
- Generic constraints
- Conditional types
- Type inference tricks

### 5. Observability
- Learn Sentry integration
- Understand distributed tracing
- Study performance metrics
- Practice debugging with traces

## Performance Optimization

### Build Performance
- Use `turbo` for parallel builds
- Enable remote caching
- Optimize dependency tree
- Use `pnpm` for fast installs

### Runtime Performance
- Code splitting with Next.js
- Tree shaking with modern bundlers
- Image optimization
- Font optimization

## Related Concepts

- Module resolution strategies
- Tree shaking and dead code elimination
- Source maps
- Bundle analysis
- Dependency graphs
- Caching strategies

## Resources

- [Bun Documentation](https://bun.sh/docs)
- [pnpm Documentation](https://pnpm.io/)
- [Turborepo Handbook](https://turbo.build/repo/docs/handbook)
- [Vite Guide](https://vitejs.dev/guide/)
- [Biome Documentation](https://biomejs.dev/)
- [TypeScript Handbook](https://www.typescriptlang.org/docs/handbook/)
