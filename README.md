# CW Vault - Personal Knowledge Base

Obsidian vault for tracking learning, work notes, and technical knowledge at Cloudwalk.

**Owner:** Fellipe Marcel
**Role:** Software Engineer I at Cloudwalk

## Vault Organization

### 📁 Folder Structure

- **00-Inbox** - Quick capture for new notes and daily learning
- **01-Learning** - Technical knowledge base and documentation
- **02-Work** - Day-to-day work notes, meetings, and tasks
- **03-Projects** - Long-term initiatives and experiments
- **04-Archive** - Completed work and historical reference
- **05-Resources** - Templates, snippets, and reference materials

Each folder includes a README explaining its purpose and workflow.

### 📚 Current Learning Topics

Comprehensive documentation on InfinitePay technologies:
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
3. **Note lands in `00-Inbox/`** automatically
4. **Pull Request created** for review
5. **Merge to vault** and optionally move to `01-Learning/` after review

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

1. **Quick capture** - Create notes in `00-Inbox/`
2. **Add tags** - Use 1-3 tags from the tag system (see CLAUDE.md)
3. **Process regularly** - Review inbox and move to appropriate folders

Example frontmatter:
```markdown
---
created: 2025-10-14
tags: [meeting, cnp, feature]
---

# Meeting: CNP Feature Discussion
...
```

### Workflow

- **Inbox** → Process daily, move to proper folders
- **Work notes** → Archive when completed
- **Learning notes** → Keep in Learning folder for reference
- **Projects** → Move to Archive when finished

### Daily Learning Notes

Review daily PRs and merge to continuously build your knowledge base. Notes start in `00-Inbox/` and can be moved to `01-Learning/` if you want to keep them as permanent reference.

## Resources

- [Obsidian Documentation](https://help.obsidian.md/)
- [CLAUDE.md](./CLAUDE.md) - Full vault configuration
- [GitHub Actions Docs](https://docs.github.com/en/actions)

---

🤖 This vault is enhanced with AI-powered daily learning via Claude
