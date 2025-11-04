---
created: 2025-11-04
tags: [learning, doc, dashboard, design-system]
status: reference
---

# Feature Flags with LaunchDarkly

## Overview

Feature flags (also known as feature toggles) are a software development technique that allows teams to enable or disable features without deploying new code. This enables safer deployments, gradual rollouts, A/B testing, and the ability to quickly disable problematic features.

**LaunchDarkly** is a feature management platform that provides robust feature flag capabilities with targeting, experimentation, and real-time updates.

## Why Use Feature Flags?

### Benefits

1. **Progressive Rollouts** - Deploy features to a small percentage of users first
2. **Kill Switches** - Instantly disable features that cause issues
3. **A/B Testing** - Test different variations with different user segments
4. **Trunk-Based Development** - Merge incomplete features to main branch safely
5. **Reduce Deployment Risk** - Decouple deployment from feature release
6. **Operational Control** - Non-technical team members can toggle features
7. **User Targeting** - Show features to specific users or segments

### Use Cases

- **Beta Features** - Test new features with internal users or beta testers
- **Premium Features** - Gate features behind subscription tiers
- **Regional Rollouts** - Enable features by geography
- **Performance Kill Switches** - Disable expensive operations during high load
- **Gradual Migration** - Migrate users from old to new implementation gradually
- **Mobile Releases** - Update features without app store approval

## Architecture in infinitepay-dashboard-js

The dashboard implements a **vendor-agnostic abstraction layer** for feature flags, supporting both LaunchDarkly and Amplitude. This architecture provides flexibility to switch vendors or use multiple providers.

### Structure

```
src/lib/flags/
├── constants.ts           # Flag names and configuration
├── context.tsx            # React context for flags
├── index.ts               # Public API exports
└── vendors/
    ├── launch-darkly.ts   # LaunchDarkly integration
    ├── amplitude.ts       # Amplitude integration
    └── __tests__/         # Unit tests
```

### Key Components

#### 1. Flag Constants (`constants.ts`)

Centralized definition of all feature flags in the application.

```typescript
// Example from infinitepay-dashboard-js
export const FLAGS = {
  // Feature flags
  ENABLE_NEW_DASHBOARD: 'enable-new-dashboard',
  ENABLE_PAY_FEATURE: 'enable-pay-feature',
  ENABLE_ADVANCED_ANALYTICS: 'enable-advanced-analytics',
  
  // Experiment flags
  CHECKOUT_BUTTON_COLOR: 'checkout-button-color',
  PRICING_PAGE_VARIANT: 'pricing-page-variant',
} as const;

export type FlagKey = typeof FLAGS[keyof typeof FLAGS];
```

**Benefits:**
- Type safety with TypeScript
- Single source of truth
- Easy to refactor flag names
- IDE autocomplete support

#### 2. Vendor Integration (`vendors/launch-darkly.ts`)

LaunchDarkly-specific implementation.

```typescript
// Simplified example based on infinitepay-dashboard-js patterns
import { LDClient, LDContext, initialize } from 'launchdarkly-js-client-sdk';

export class LaunchDarklyProvider {
  private client: LDClient | null = null;
  
  async initialize(clientSideId: string, context: LDContext) {
    this.client = initialize(clientSideId, context, {
      // Configuration options
      streaming: true,
      bootstrap: 'localStorage',
      // Only evaluate flags used by the application
      evaluationReasons: false,
    });
    
    await this.client.waitForInitialization();
    return this.client;
  }
  
  getFlag<T>(key: string, defaultValue: T): T {
    if (!this.client) return defaultValue;
    return this.client.variation(key, defaultValue);
  }
  
  async setContext(context: LDContext) {
    if (!this.client) return;
    await this.client.identify(context);
  }
  
  on(event: string, callback: () => void) {
    if (!this.client) return;
    this.client.on(event, callback);
  }
  
  off(event: string, callback: () => void) {
    if (!this.client) return;
    this.client.off(event, callback);
  }
}
```

#### 3. React Context (`context.tsx`)

Provides flags throughout the React component tree.

```typescript
// Simplified example based on dashboard patterns
import { createContext, useContext, useEffect, useState } from 'react';

interface FlagsContextValue {
  flags: Record<string, any>;
  loading: boolean;
  error: Error | null;
}

const FlagsContext = createContext<FlagsContextValue>({
  flags: {},
  loading: true,
  error: null,
});

export function FlagsProvider({ 
  children, 
  user 
}: { 
  children: React.ReactNode;
  user?: { id: string; email: string; name: string };
}) {
  const [flags, setFlags] = useState<Record<string, any>>({});
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<Error | null>(null);
  
  useEffect(() => {
    // Initialize flag provider
    const initFlags = async () => {
      try {
        const provider = new LaunchDarklyProvider();
        await provider.initialize(
          process.env.NEXT_PUBLIC_LAUNCHDARKLY_CLIENT_ID!,
          {
            kind: 'user',
            key: user?.id || 'anonymous',
            email: user?.email,
            name: user?.name,
          }
        );
        
        // Get all flags
        const allFlags = provider.client?.allFlags() || {};
        setFlags(allFlags);
        setLoading(false);
        
        // Listen for changes
        provider.on('change', () => {
          const updatedFlags = provider.client?.allFlags() || {};
          setFlags(updatedFlags);
        });
      } catch (err) {
        setError(err as Error);
        setLoading(false);
      }
    };
    
    initFlags();
  }, [user]);
  
  return (
    <FlagsContext.Provider value={{ flags, loading, error }}>
      {children}
    </FlagsContext.Provider>
  );
}

export function useFlags() {
  return useContext(FlagsContext);
}

export function useFlag<T>(key: string, defaultValue: T): T {
  const { flags } = useFlags();
  return flags[key] !== undefined ? flags[key] : defaultValue;
}
```

#### 4. Usage in Components

**Example from `use-is-pay-enabled.hook.ts`:**

```typescript
import { useFlag } from '@/lib/flags';
import { FLAGS } from '@/lib/flags/constants';

export function useIsPayEnabled() {
  const isEnabled = useFlag(FLAGS.ENABLE_PAY_FEATURE, false);
  const rolloutPercentage = useFlag('pay-feature-rollout-percentage', 0);
  
  return {
    isEnabled,
    isFullyRolledOut: rolloutPercentage >= 100,
    rolloutPercentage,
  };
}

// Usage in component
function PaymentButton() {
  const { isEnabled } = useIsPayEnabled();
  
  if (!isEnabled) {
    return null;
  }
  
  return <button>Pay Now</button>;
}
```

**Experiment Hook (`experiment.hook.ts`):**

```typescript
import { useFlag } from '@/lib/flags';

export function useExperiment<T extends string>(
  experimentKey: string,
  defaultVariant: T
): { variant: T; isControl: boolean } {
  const variant = useFlag<T>(experimentKey, defaultVariant);
  
  return {
    variant,
    isControl: variant === 'control',
  };
}

// Usage for A/B testing
function CheckoutButton() {
  const { variant } = useExperiment('checkout-button-color', 'control');
  
  const buttonColor = {
    control: 'blue',
    variant_a: 'green',
    variant_b: 'orange',
  }[variant];
  
  return (
    <button style={{ backgroundColor: buttonColor }}>
      Checkout
    </button>
  );
}
```

## LaunchDarkly Setup Guide

### Step 1: Create LaunchDarkly Account

1. Go to [LaunchDarkly](https://launchdarkly.com/)
2. Sign up for a free account
3. Create a new project for your application

### Step 2: Get Your SDK Keys

1. Navigate to **Account Settings** → **Projects**
2. Click on your project
3. Go to **Environments** tab
4. Copy your **Client-side ID** (starts with `65...`)
   - **Important:** Never use Server-side SDK keys in client applications

### Step 3: Install Dependencies

```bash
# For React applications
npm install launchdarkly-react-client-sdk

# Or for vanilla JavaScript
npm install launchdarkly-js-client-sdk

# TypeScript types (if not included)
npm install --save-dev @types/launchdarkly-js-client-sdk
```

### Step 4: Configure Environment Variables

Add to your `.env.local` or `.env`:

```bash
# Client-side ID (safe to expose in browser)
NEXT_PUBLIC_LAUNCHDARKLY_CLIENT_ID=65abc123def456789

# Server-side SDK key (keep secret, server-only)
LAUNCHDARKLY_SDK_KEY=sdk-abc-123-def-456
```

**Important Security Notes:**
- Client-side IDs are safe to expose in browser
- Server-side SDK keys should **never** be exposed to the client
- Use `NEXT_PUBLIC_` prefix for client-accessible variables in Next.js

### Step 5: Wrap Your App with Provider

**For Next.js App Router (`app/layout.tsx`):**

```typescript
import { FlagsProvider } from '@/lib/flags';

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body>
        <FlagsProvider user={undefined}>
          {children}
        </FlagsProvider>
      </body>
    </html>
  );
}
```

**With User Context:**

```typescript
import { auth } from '@/lib/auth';
import { FlagsProvider } from '@/lib/flags';

export default async function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  const session = await auth();
  
  return (
    <html lang="en">
      <body>
        <FlagsProvider 
          user={session?.user ? {
            id: session.user.id,
            email: session.user.email!,
            name: session.user.name!,
          } : undefined}
        >
          {children}
        </FlagsProvider>
      </body>
    </html>
  );
}
```

### Step 6: Create Your First Feature Flag

#### In LaunchDarkly Dashboard:

1. Go to **Feature flags** in the left sidebar
2. Click **Create flag**
3. Fill in flag details:
   - **Name:** "New Dashboard Design"
   - **Key:** `new-dashboard-design` (auto-generated, can edit)
   - **Flag type:** Boolean (on/off)
   - **Description:** "Enables the redesigned dashboard layout"
4. Click **Save flag**

#### Flag Types:

- **Boolean** - Simple on/off toggle
- **String** - Return text values (e.g., "variant_a", "variant_b")
- **Number** - Return numeric values (e.g., rollout percentage)
- **JSON** - Return complex objects (e.g., configuration)

### Step 7: Configure Flag Targeting

#### Targeting Rules:

1. **Default rule** - What should everyone get?
   - Serve `true` or `false` to all users
   
2. **Percentage rollouts** - Gradual feature release
   - 10% get `true`, 90% get `false`
   - LaunchDarkly ensures consistent experience per user
   
3. **User targeting** - Specific users or segments
   - Target by email: `email ends with @yourcompany.com`
   - Target by user ID: `key in ["user-123", "user-456"]`
   - Target by custom attributes: `tier equals "premium"`

4. **Rules** - Conditional logic
   - IF `country equals "US"` SERVE `true`
   - IF `tier equals "free"` SERVE `false`

#### Example Rollout Strategy:

**Phase 1: Internal Testing**
```
Rule 1: IF email ends with "@cloudwalk.io" SERVE true
Default: SERVE false
```

**Phase 2: Beta Testing (10% rollout)**
```
Rule 1: IF email ends with "@cloudwalk.io" SERVE true
Rule 2: SERVE true to 10% of users
Default: SERVE false
```

**Phase 3: Full Rollout**
```
Default: SERVE true
```

### Step 8: Use the Flag in Code

#### Basic Boolean Flag:

```typescript
'use client';

import { useFlag } from '@/lib/flags';

export default function Dashboard() {
  const newDesign = useFlag('new-dashboard-design', false);
  
  if (newDesign) {
    return <NewDashboard />;
  }
  
  return <OldDashboard />;
}
```

#### String Flag for A/B Testing:

```typescript
'use client';

import { useFlag } from '@/lib/flags';

export default function PricingPage() {
  const variant = useFlag<'control' | 'variant_a' | 'variant_b'>(
    'pricing-page-variant',
    'control'
  );
  
  const pricing = {
    control: { monthly: 99, annual: 999 },
    variant_a: { monthly: 79, annual: 799 },
    variant_b: { monthly: 119, annual: 1199 },
  }[variant];
  
  return (
    <div>
      <h1>Pricing</h1>
      <p>Monthly: ${pricing.monthly}</p>
      <p>Annual: ${pricing.annual}</p>
    </div>
  );
}
```

#### JSON Flag for Configuration:

```typescript
'use client';

import { useFlag } from '@/lib/flags';

interface FeatureConfig {
  enabled: boolean;
  maxItems: number;
  allowedRegions: string[];
}

export default function FeatureComponent() {
  const config = useFlag<FeatureConfig>('feature-config', {
    enabled: false,
    maxItems: 10,
    allowedRegions: ['US'],
  });
  
  if (!config.enabled) {
    return null;
  }
  
  return <div>Max items: {config.maxItems}</div>;
}
```

### Step 9: Server-Side Flags (Next.js)

For Server Components or API routes, use the server-side SDK:

```typescript
// lib/flags/server.ts
import { init } from '@launchdarkly/node-server-sdk';

let ldClient: ReturnType<typeof init> | null = null;

export async function getLDClient() {
  if (!ldClient) {
    ldClient = init(process.env.LAUNCHDARKLY_SDK_KEY!);
    await ldClient.waitForInitialization();
  }
  return ldClient;
}

export async function getFlag<T>(
  userId: string,
  flagKey: string,
  defaultValue: T
): Promise<T> {
  const client = await getLDClient();
  
  const context = {
    kind: 'user',
    key: userId,
  };
  
  return await client.variation(flagKey, context, defaultValue);
}

// Usage in Server Component
import { auth } from '@/lib/auth';
import { getFlag } from '@/lib/flags/server';

export default async function ServerPage() {
  const session = await auth();
  const userId = session?.user?.id || 'anonymous';
  
  const newDesign = await getFlag(userId, 'new-dashboard-design', false);
  
  if (newDesign) {
    return <NewDashboard />;
  }
  
  return <OldDashboard />;
}
```

### Step 10: Testing Feature Flags

#### Unit Testing:

```typescript
// __tests__/dashboard.test.tsx
import { render, screen } from '@testing-library/react';
import { FlagsProvider } from '@/lib/flags';
import Dashboard from '@/app/dashboard/page';

// Mock the flag provider
jest.mock('@/lib/flags', () => ({
  useFlag: (key: string, defaultValue: any) => {
    const flags: Record<string, any> = {
      'new-dashboard-design': true,
    };
    return flags[key] ?? defaultValue;
  },
}));

describe('Dashboard', () => {
  it('renders new design when flag is enabled', () => {
    render(<Dashboard />);
    expect(screen.getByText('New Dashboard')).toBeInTheDocument();
  });
});
```

#### Integration Testing:

```typescript
// Use LaunchDarkly test data source
import { init } from '@launchdarkly/node-server-sdk';
import { TestData } from '@launchdarkly/node-server-sdk/integrations';

describe('Feature Flag Integration', () => {
  let td: ReturnType<typeof TestData>;
  let client: ReturnType<typeof init>;
  
  beforeAll(async () => {
    td = TestData();
    client = init('sdk-key', {
      updateProcessor: td.getFactory(),
    });
    await client.waitForInitialization();
  });
  
  afterAll(() => {
    client.close();
  });
  
  it('returns correct flag value', async () => {
    // Set up test data
    td.update(td.flag('new-dashboard-design').variations(true, false).on(true));
    
    const value = await client.variation(
      'new-dashboard-design',
      { kind: 'user', key: 'test-user' },
      false
    );
    
    expect(value).toBe(true);
  });
});
```

## Best Practices

### 1. Naming Conventions

```typescript
// Good: Descriptive, kebab-case
'enable-new-checkout-flow'
'payment-provider-version'
'dashboard-layout-variant'

// Bad: Ambiguous, inconsistent
'feature1'
'NewFeature'
'enable_feature'
```

### 2. Flag Lifecycle Management

**Short-lived flags** (temporary):
- Feature rollouts
- Kill switches
- A/B tests

**Long-lived flags** (permanent):
- Premium features
- Regional differences
- User preferences

**Remove old flags:**
```typescript
// Step 1: Set flag to 100% rollout
// Step 2: Remove flag checks from code
if (newFeature) { ... } // Remove this check

// Step 3: Delete code branches
// Old: if (newFeature) { newCode } else { oldCode }
// New: newCode

// Step 4: Archive flag in LaunchDarkly
```

### 3. Default Values

Always provide sensible defaults:

```typescript
// Good: Safe default (feature disabled)
const newFeature = useFlag('new-feature', false);

// Good: Safe default (existing behavior)
const paymentProvider = useFlag('payment-provider', 'stripe');

// Bad: No default or risky default
const criticalFeature = useFlag('critical-feature', true); // Risky!
```

### 4. Type Safety

Use TypeScript for flag values:

```typescript
// Define flag types
type PaymentProvider = 'stripe' | 'paypal' | 'braintree';
type DashboardLayout = 'grid' | 'list' | 'compact';

// Use in hooks
const provider = useFlag<PaymentProvider>('payment-provider', 'stripe');
const layout = useFlag<DashboardLayout>('dashboard-layout', 'grid');
```

### 5. Performance Optimization

```typescript
// ❌ Bad: Fetching flag in every render
function Component() {
  const flag = useFlag('my-flag', false);
  // Component re-renders on every flag change
}

// ✅ Good: Memoize expensive operations
function Component() {
  const flag = useFlag('my-flag', false);
  
  const expensiveValue = useMemo(() => {
    if (flag) {
      return computeExpensiveValue();
    }
    return null;
  }, [flag]);
}
```

### 6. Error Handling

```typescript
function ComponentWithFlags() {
  const { flags, loading, error } = useFlags();
  
  if (loading) {
    return <Spinner />;
  }
  
  if (error) {
    // Fallback to safe defaults
    console.error('Flag loading failed:', error);
    return <DefaultComponent />;
  }
  
  return <Component flags={flags} />;
}
```

### 7. Documentation

Document flags in code:

```typescript
export const FLAGS = {
  /**
   * Enables the new payment checkout flow.
   * - Jira: PAY-1234
   * - Rollout: Gradual, started 2025-11-01
   * - Remove after: 2025-12-01
   */
  ENABLE_NEW_CHECKOUT: 'enable-new-checkout',
  
  /**
   * Payment provider selection.
   * - Values: 'stripe' | 'paypal' | 'braintree'
   * - Permanent: Different providers per region
   */
  PAYMENT_PROVIDER: 'payment-provider',
} as const;
```

## Common Pitfalls

### 1. Flag Explosion

**Problem:** Too many flags makes code hard to maintain.

**Solution:**
- Regular flag cleanup
- Use expiration dates
- Archive unused flags

### 2. Tight Coupling

**Problem:** Flags tightly coupled to specific implementations.

**Solution:**
```typescript
// ❌ Bad: Tight coupling
if (useFlag('show-new-button', false)) {
  return <NewButton />;
}

// ✅ Good: Loose coupling
const buttonVariant = useFlag<'old' | 'new'>('button-variant', 'old');
return <Button variant={buttonVariant} />;
```

### 3. Nested Flags

**Problem:** Multiple flag checks create complex logic.

**Solution:**
```typescript
// ❌ Bad: Nested flags
if (useFlag('feature-a', false)) {
  if (useFlag('feature-b', false)) {
    return <FeatureAB />;
  }
  return <FeatureA />;
}

// ✅ Good: Combined flag
const features = useFlag<'none' | 'a' | 'b' | 'ab'>('features', 'none');
return {
  none: <Default />,
  a: <FeatureA />,
  b: <FeatureB />,
  ab: <FeatureAB />,
}[features];
```

### 4. Missing Flag in Constants

**Problem:** Flag keys as magic strings.

**Solution:**
```typescript
// ❌ Bad: Magic string
const flag = useFlag('my-feature', false);

// ✅ Good: Constant
const flag = useFlag(FLAGS.MY_FEATURE, false);
```

## Monitoring and Analytics

### Track Flag Evaluations

```typescript
import { track } from '@/lib/analytics';

function FeatureComponent() {
  const newFeature = useFlag('new-feature', false);
  
  useEffect(() => {
    // Track flag evaluation
    track('Feature Flag Evaluated', {
      flag: 'new-feature',
      value: newFeature,
      timestamp: new Date().toISOString(),
    });
  }, [newFeature]);
  
  // Component logic
}
```

### Set Up Alerts

Configure LaunchDarkly webhooks or integrations:
- Slack notifications for flag changes
- Datadog integration for metrics
- PagerDuty for critical flag failures

## Resources

### Official Documentation
- [LaunchDarkly Docs](https://docs.launchdarkly.com/)
- [React SDK Documentation](https://docs.launchdarkly.com/sdk/client-side/react/react-web)
- [Node SDK Documentation](https://docs.launchdarkly.com/sdk/server-side/node-js)

### infinitepay-dashboard-js Examples
- **Flag Definition:** `src/lib/flags/constants.ts`
- **LaunchDarkly Integration:** `src/lib/flags/vendors/launch-darkly.ts`
- **React Context:** `src/lib/flags/context.tsx`
- **Usage Example:** `src/features/pay/hooks/use-is-pay-enabled.hook.ts`
- **Experiment Hook:** `src/lib/experiment.hook.ts`
- **Tests:** `src/lib/__tests__/flags.test.ts`

### Related Topics
- [[Continuous Deployment Strategies]]
- [[A-B Testing Best Practices]]
- [[Progressive Rollouts]]
- [[Observability and Monitoring]]

## Quick Reference

### Common Commands

```bash
# Install LaunchDarkly SDK
npm install launchdarkly-react-client-sdk

# Install server-side SDK
npm install @launchdarkly/node-server-sdk

# Environment variable
NEXT_PUBLIC_LAUNCHDARKLY_CLIENT_ID=your-client-id
```

### Basic Usage

```typescript
// 1. Import hook
import { useFlag } from '@/lib/flags';

// 2. Use in component
const enabled = useFlag('my-feature', false);

// 3. Conditional rendering
if (enabled) {
  return <NewFeature />;
}
return <OldFeature />;
```

### TypeScript Types

```typescript
// Boolean flag
const enabled: boolean = useFlag('feature', false);

// String flag
const variant: string = useFlag('variant', 'control');

// Typed string flag
type Variant = 'control' | 'a' | 'b';
const variant: Variant = useFlag<Variant>('variant', 'control');

// JSON flag
interface Config { enabled: boolean; limit: number; }
const config: Config = useFlag<Config>('config', { enabled: false, limit: 10 });
```

---

**Last Updated:** 2025-11-04  
**Related Projects:** infinitepay-dashboard-js  
**Status:** Active reference document

