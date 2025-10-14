# CW Vault - Personal Knowledge Base

Obsidian vault for tracking learning, work notes, and technical knowledge at Cloudwalk.

**Owner:** Fellipe Marcel
**Role:** Software Engineer I at Cloudwalk

## What's Inside

### 📚 Learning Notes
Comprehensive documentation on technologies used in InfinitePay projects:
- Monorepo Architecture with Turborepo
- Next.js App Router and Server Components
- Design System Architecture
- Testing Strategies and Tools
- Modern JavaScript Tooling

### 🏗️ Primary Repositories
- [infinitepay-cnp-monorepo](https://github.com/cloudwalk/infinitepay-cnp-monorepo)
- [infinitepay-dashboard-js](https://github.com/cloudwalk/infinitepay-dashboard-js)
- [infinitepay-ds-web](https://github.com/cloudwalk/infinitepay-ds-web)
- [infinitepay-receipt-js](https://github.com/cloudwalk/infinitepay-receipt-js)

## Tag System

Efficient tag system for organization (see CLAUDE.md for full details):

### Content Type
`#meeting` `#idea` `#doc` `#learning`

### Status
`#todo` `#doing` `#done`

### Repository
`#cnp` `#dashboard` `#design-system` `#receipt`

### Work Type
`#bug` `#feature` `#incident` `#troubleshooting` `#pr-review` `#deployment`

### Priority
`#urgent` `#important`

## Daily Learning

This vault includes an automated daily learning system powered by Claude AI:

### How It Works
1. **GitHub Actions workflow** runs daily at 9 AM UTC (6 AM BRT)
2. **Claude generates** a focused learning note on a random tech topic
3. **Pull Request created** automatically for review
4. **Merge to vault** after reviewing the content

### Topics Covered
- React Server Components
- TypeScript advanced types
- Next.js optimization
- Testing best practices
- Monorepo patterns
- And more...

### Manual Trigger
You can also trigger the workflow manually from the GitHub Actions tab.

## Setup

### Prerequisites
- Obsidian installed
- Git configured
- GitHub repository created

### Environment Setup
To enable daily learning notes:

1. Create a GitHub repository for this vault
2. Add `ANTHROPIC_API_KEY` to repository secrets
3. Push this vault to the repository
4. The workflow will run automatically daily

### Anthropic API Key
Get your API key from [Anthropic Console](https://console.anthropic.com/)

## Usage

### Creating Notes
Use 1-3 tags per note from the categories above.

Example:
```markdown
---
created: 2025-10-14
tags: [meeting, cnp, feature]
---

# Meeting: CNP Feature Discussion
...
```

### Daily Learning Notes
Review the daily PRs and merge them to continuously build your knowledge base.

## Resources

- [Obsidian Documentation](https://help.obsidian.md/)
- [CLAUDE.md](./CLAUDE.md) - Full vault configuration
- [GitHub Actions Docs](https://docs.github.com/en/actions)

---

🤖 This vault is enhanced with AI-powered daily learning via Claude
