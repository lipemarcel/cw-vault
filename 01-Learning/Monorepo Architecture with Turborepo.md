---
created: 2025-10-14
tags: [learning, doc, cnp, programming]
---

# Monorepo Architecture with Turborepo

## Overview

The CNP monorepo uses Turborepo for managing multiple applications and shared packages in a single repository. This architecture enables code sharing and coordinated development across multiple projects.

## Core Concepts

### Workspace Structure
- **apps/** - Contains deployable applications
- **packages/** - Contains shared libraries and utilities
- Managed by Bun (package manager) with workspaces

### Turborepo Benefits
1. **Incremental builds** - Only rebuilds what changed
2. **Parallel execution** - Runs tasks across packages simultaneously
3. **Remote caching** - Shares build artifacts across team
4. **Task pipelines** - Defines dependencies between tasks

## Key Commands (CNP Monorepo)

```bash
# Development
bun dev                    # Run all apps in parallel
bun dev:ui                 # Run only UI package

# Building
bun build                  # Build all apps
bun build:staging          # Build for staging
bun build:production       # Build for production

# Testing
bun test                   # Run all tests
bun test:watch             # Watch mode
bun test:coverage          # With coverage
bun test:playwright        # E2E tests

# Code Quality
bun lint                   # Lint all packages
bun format                 # Format code with Prettier
```

## Learning Path

### 1. Understand Workspace Dependencies
- How packages reference each other using `*` notation
- Shared configs: `@repo/eslint-config`, `@repo/typescript-config`
- Internal package imports

### 2. Task Pipeline Configuration
- Study `turbo.json` to understand task dependencies
- Learn how caching works and cache invalidation
- Understand task inputs and outputs

### 3. Package Management with Bun
- Bun as faster alternative to npm/pnpm
- Workspace protocol and linking
- Dependency overrides and resolutions

### 4. Best Practices
- Keep packages loosely coupled
- Use internal packages for shared business logic
- Centralize configuration in shared packages
- Version packages independently when needed

## Related Concepts to Study

- Workspace protocols
- Dependency hoisting
- Build artifacts and caching strategies
- Monorepo vs polyrepo trade-offs

## Resources

- [Turborepo Documentation](https://turbo.build/repo/docs)
- [Bun Workspaces](https://bun.sh/docs/install/workspaces)
- CNP Monorepo CLAUDE.md for project-specific patterns
