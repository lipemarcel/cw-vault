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

## Automation Features

This vault includes several automated workflows powered by GitHub Actions:

### Daily Learning Notes
1. **GitHub Actions workflow** runs daily at 9 AM UTC (6 AM BRT)
2. **Claude generates** a focused learning note on a random tech topic
3. **Note automatically commits** to `00-Inbox/` on main branch
4. **Duplicate prevention** - skips if a note on that topic already exists

**Topics Covered**: React Server Components, TypeScript, Next.js optimization, Testing, Monorepo patterns, and more.

### Daily Work Logs
1. **Automated creation** every weekday at 8 AM UTC (5 AM BRT)
2. **Creates log from template** in `02-Work/Daily-Logs/`
3. **Date-based naming** (YYYY-MM-DD.md)
4. **Prevents duplicates** - skips if log already exists

### Inbox Processing (NEW)
1. **Runs every Friday** at 7 PM UTC (4 PM BRT)
2. **Analyzes tags** in inbox notes automatically
3. **Moves notes** to appropriate folders based on tags
4. **Commits changes** directly to main branch

**Tag-based routing**:
- `#meeting`, `#bug`, `#feature`, `#pr-review` → `02-Work/`
- `#learning`, `#doc` → `01-Learning/` or `03-Projects/`
- `#done` → `04-Archive/`
- No clear tags → Stays in inbox

### Manual Triggers
All workflows can be triggered manually from the GitHub Actions tab.

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

- **Inbox** → Automated processing every Friday (or manual with proper tags)
- **Work notes** → Archive when completed (use `#done` tag)
- **Learning notes** → Keep in Learning folder for reference
- **Projects** → Move to Archive when finished
- **Daily logs** → Created automatically each weekday morning

### Notes on Automation

- **Daily learning notes** appear in `00-Inbox/` each day at 9 AM UTC
- **Daily work logs** are created in `02-Work/Daily-Logs/` each weekday at 8 AM UTC
- **Inbox processing** runs every Friday at 7 PM UTC - notes with proper tags are moved automatically
- **Manual processing** is still available - you can move notes anytime or trigger workflows manually

## Resources

- [Obsidian Documentation](https://help.obsidian.md/)
- [CLAUDE.md](./CLAUDE.md) - Full vault configuration
- [GitHub Actions Docs](https://docs.github.com/en/actions)

---

## GitHub Actions Workflows

This vault uses three automated workflows:

1. **`daily-learning.yml`** - Generates learning notes with Claude AI (daily at 9 AM UTC)
2. **`create-daily-log.yml`** - Creates daily work logs (weekdays at 8 AM UTC)
3. **`process-inbox.yml`** - Organizes inbox notes by tags (Fridays at 7 PM UTC)

All workflows can be found in `.github/workflows/` and can be triggered manually.

---

🤖 This vault is enhanced with AI-powered automation and intelligent organization
