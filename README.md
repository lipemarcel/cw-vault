# CW Vault - Personal Knowledge Base

> 🤖 AI-powered knowledge management system for software engineers

Obsidian vault for tracking learning, work notes, and technical knowledge at Cloudwalk.

**Owner:** Fellipe Marcel  
**Role:** Software Engineer I at Cloudwalk

---

## ⚡ Quick Start

**First time using this vault?**

1. **Morning routine**: `git pull origin main` to sync with automated changes
2. **Open today's log**: Press `Cmd/Ctrl + O` → Type today's date
3. **Capture work**: Fill in your daily log as you work
4. **Ask Claude for help**: "Update my daily log with [activity]"
5. **End of day**: `git pull && git push origin main`

**Your first week:**
- Days 1-5: Fill in daily logs (practice the workflow)
- Friday: Review your week, update quarterly tracker
- Learn to use tags for organization (see Tag System below)

---

## 🎯 Why Use This System?

This vault solves common problems for busy engineers:

✅ **Never forget what you worked on** - Daily logs capture everything automatically  
✅ **Quarterly reviews in 30 minutes** - Continuous tracking makes reviews effortless  
✅ **Find anything instantly** - Tag system + search = powerful knowledge retrieval  
✅ **Learn consistently** - Automated learning notes keep you growing  
✅ **No manual busywork** - GitHub Actions + AI handle repetitive tasks  
✅ **Version controlled** - Git tracks everything, never lose work  

**Time savings**: ~2-3 hours per quarter on performance reviews + better daily productivity

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

---

## 🤖 Claude Code Integration

This vault is designed to work seamlessly with Claude Code (AI assistant).

### What Claude Can Do

**Daily Work Logs:**
```
"Create today's daily work log"
"Add PR review for cnp#760 to my log"
"Show me this week's daily logs"
"Summarize my work this week"
```

**Quarterly Reviews:**
```
"Update my quarterly tracker with this week's work"
"Generate my Q4 self-evaluation"
"What achievements am I missing for [pillar]?"
```

**Git Operations:**
```
"Help me resolve this merge conflict"
"Check git status and help me commit"
"Explain this git error: [error message]"
```

**Note Management:**
```
"Create a new learning note about [topic]"
"Move completed work to archive"
"Find all notes tagged with #bug"
```

### How It Works

1. **Claude reads CLAUDE.md** - Understands vault structure and rules
2. **Intelligent placement** - Creates notes in correct folders
3. **Consistent tagging** - Applies tags following guidelines
4. **Smart linking** - Connects related notes automatically
5. **Context-aware** - Knows your projects and repositories

**See full documentation**: [CLAUDE.md](./CLAUDE.md)

---

## Git Workflows

This vault uses Git for version control with automated GitHub Actions creating commits daily. This can occasionally lead to merge conflicts.

### Daily Git Routine
1. **Morning**: `git pull origin main` before starting work
2. **During work**: Commit frequently with descriptive messages
3. **End of day**: `git pull` then `git push origin main`

### When Conflicts Happen
- Don't panic! Conflicts are normal with automated workflows
- See [[Git Workflow and Troubleshooting Guide]] for step-by-step resolution
- Ask Claude: "Help me resolve this merge conflict"

### Common Commands
```bash
git status              # Check current state
git pull origin main    # Sync with remote
git add <file>          # Stage changes
git commit -m "msg"     # Commit changes
git push origin main    # Push to remote
```

**Full documentation**: See `05-Resources/Git-Workflow-and-Troubleshooting-Guide.md`

---

## 📚 Documentation & Resources

### Vault Documentation
- **[CLAUDE.md](./CLAUDE.md)** - Complete vault configuration and AI integration guide
- **[Git Workflow Guide](./05-Resources/Git-Workflow-and-Troubleshooting-Guide.md)** - Git workflows, conflict resolution, and troubleshooting

### Automation Guides
- **[Daily Work Log - Automation Guide](./05-Resources/Daily%20Work%20Log%20-%20Automation%20Guide.md)** - Multiple options for automating daily logs
- **[Quarterly Review Automation](./05-Resources/Quarterly-Review-Automation-Guide.md)** - Effortless performance reviews with AI
- **[Obsidian Vault Setup Prompt](./05-Resources/Obsidian-Vault-Setup-Prompt.md)** - Guide for setting up similar vaults

### External Resources
- [Obsidian Documentation](https://help.obsidian.md/) - Official Obsidian docs
- [GitHub Actions Docs](https://docs.github.com/en/actions) - GitHub automation
- [Markdown Guide](https://www.markdownguide.org/) - Markdown syntax reference
- [Pro Git Book](https://git-scm.com/book/en/v2) - Comprehensive Git guide

---

## GitHub Actions Workflows

This vault uses three automated workflows:

1. **`daily-learning.yml`** - Generates learning notes with Claude AI (daily at 9 AM UTC)
2. **`create-daily-log.yml`** - Creates daily work logs (weekdays at 8 AM UTC)
3. **`process-inbox.yml`** - Organizes inbox notes by tags (Fridays at 7 PM UTC)

All workflows can be found in `.github/workflows/` and can be triggered manually.

---

## 🆘 Getting Help

### Common Questions

**"I have a merge conflict, what do I do?"**
→ See [Git Workflow Guide](./05-Resources/Git-Workflow-and-Troubleshooting-Guide.md) or ask Claude: "Help me resolve this merge conflict"

**"How do I create a daily log?"**
→ It's created automatically each morning! Or ask Claude: "Create today's daily work log"

**"Where should I put this note?"**
→ See [CLAUDE.md](./CLAUDE.md) for folder decision tree, or ask Claude to create it for you

**"How do I prepare for quarterly reviews?"**
→ See [Quarterly Review Automation Guide](./05-Resources/Quarterly-Review-Automation-Guide.md)

**"What tags should I use?"**
→ See Tag System section above, keep it simple (1-3 tags per note)

### Ask Claude Code

For any vault-related questions:
```
"How do I [task]?"
"What's the best way to [goal]?"
"Help me understand [concept]"
"I'm having trouble with [issue]"
```

Claude understands this vault's structure and can guide you through any workflow.

---

## 📊 Vault Statistics

**Current Status:**
- ✅ Automated daily work logs
- ✅ AI-generated learning notes
- ✅ Automated inbox processing
- ✅ Git conflict resolution support
- ✅ Quarterly review automation
- ✅ Claude Code integration

**Maintenance:**
- Daily logs created: Automatic (Mon-Fri)
- Learning notes added: Automatic (Daily)
- Inbox processed: Automatic (Fridays)
- Git syncs: Manual (2x per day recommended)

---

## 🎉 What's Next?

**Week 1-2: Learn the Basics**
- Use daily logs consistently
- Practice Git workflows
- Learn tag system

**Week 3-4: Optimize Your Flow**
- Set up Obsidian shortcuts
- Create custom templates
- Explore Claude integration

**Month 2+: Advanced Usage**
- Build personal knowledge base
- Create project documentation
- Prepare first quarterly review

**Continuous Improvement:**
- Review and refine workflows
- Add custom automations
- Share learnings with team

---

<div align="center">

🤖 **This vault is enhanced with AI-powered automation and intelligent organization**

Built with ❤️ using [Obsidian](https://obsidian.md/) • [GitHub Actions](https://github.com/features/actions) • [Claude AI](https://claude.ai/)

*Last Updated: 2025-10-22*

</div>
