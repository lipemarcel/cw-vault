# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is an Obsidian vault used for personal knowledge management, covering work notes, learning materials, research, and personal knowledge base content.

**Owner:** Fellipe Marcel
**Role:** Software Engineer I at Cloudwalk

### Primary Work Repositories

- **infinitepay-cnp-monorepo** - https://github.com/cloudwalk/infinitepay-cnp-monorepo
- **infinitepay-dashboard-js** - https://github.com/cloudwalk/infinitepay-dashboard-js
- **infinitepay-ds-web** - https://github.com/cloudwalk/infinitepay-ds-web (Design System)
- **infinitepay-receipt-js** - https://github.com/cloudwalk/infinitepay-receipt-js

## Vault Structure

This vault uses a numbered folder system for clear organization and workflow:

### Folders

- **`00-Inbox/`** - Quick capture zone
  - New notes and daily learning land here first
  - Quick captures during meetings or research
  - Process regularly and move to appropriate folders

- **`01-Learning/`** - Technical knowledge base
  - Technology deep-dives and patterns
  - Framework and tool documentation
  - Best practices and methodologies
  - Curated learning resources

- **`02-Work/`** - Day-to-day activities
  - Meeting notes and discussions
  - Bug investigations and troubleshooting
  - Feature planning and development notes
  - Code review notes
  - Incident reports

- **`03-Projects/`** - Long-term initiatives
  - Side projects and experiments
  - Personal development initiatives
  - Learning projects and POCs
  - Cross-repository features

- **`04-Archive/`** - Historical reference
  - Completed tasks and features
  - Resolved bugs and incidents
  - Past meeting notes
  - Historical context

- **`05-Resources/`** - Reference materials
  - Code snippets and templates
  - Useful links and bookmarks
  - Cheat sheets and quick references
  - Tool configurations

### Configuration

- `.obsidian/` - Obsidian application settings
  - `app.json` - General settings
  - `core-plugins.json` - Plugin configuration
  - `workspace.json` - Workspace layout
  - `graph.json` - Graph view settings
  - `appearance.json` - Theme settings

## Tag System

This vault uses a simplified tag system for efficient organization. Tags are used instead of complex folder structures to allow flexible categorization without decision fatigue.

### Core Tags (Use 1-3 per note)

#### Content Type (What kind of note is this?)
- `#meeting` - Meeting notes and discussions
- `#idea` - Ideas, brainstorming, concepts
- `#doc` - Documentation, guides, reference materials
- `#learning` - Learning resources, tutorials, courses

#### Status (What's the current state?)
- `#todo` - Actionable items or tasks
- `#doing` - Currently working on
- `#done` - Finished or resolved

#### Repository/Project (Which codebase?)
- `#cnp` - CNP monorepo (infinitepay-cnp-monorepo)
- `#dashboard` - Dashboard application (infinitepay-dashboard-js)
- `#design-system` - Design system (infinitepay-ds-web)
- `#receipt` - Receipt service (infinitepay-receipt-js)

#### Work Type (What kind of work?)
- `#bug` - Bug fixes and issues
- `#feature` - New features or enhancements
- `#incident` - Production incidents or urgent issues
- `#troubleshooting` - Debugging and problem-solving
- `#pr-review` - Pull request reviews
- `#deployment` - Deployment notes and processes

#### Priority (Optional - use sparingly)
- `#urgent` - Time-sensitive, needs immediate attention
- `#important` - High-value, significant impact

### Tag Usage Guidelines

- **Keep it simple**: Use 1-3 tags per note maximum
- **Be consistent**: Choose one tag from each relevant category
- **Skip obvious tags**: Don't tag work-related notes with a generic "work" tag
- **Use priority tags sparingly**: Only when truly urgent or important
- Tags are lowercase and use hyphens for multi-word tags

### Example Tag Combinations

- Meeting about CNP feature: `#meeting #cnp #feature`
- Bug fix in progress: `#dashboard #bug #doing`
- Learning resource: `#learning #doc`
- Production incident: `#incident #urgent #cnp`
- Design system documentation: `#design-system #doc`
- Feature idea for receipt service: `#idea #receipt #feature`
- Code review notes: `#pr-review #dashboard`
- Completed troubleshooting: `#troubleshooting #done #cnp`

## Enabled Core Plugins

- File explorer, global search, switcher
- Graph view and backlinks for visualizing connections
- Canvas for visual note organization
- Daily notes and templates
- Note composer and command palette
- Bookmarks and outline view
- Obsidian Sync and Bases

## Working with this Vault

### Creating/Editing Notes
- All notes should be markdown files (`.md` extension)
- Use wiki-style links for internal references: `[[Note Name]]`
- Add tags using hashtags anywhere in the note: `#tag-name`
- Obsidian supports CommonMark and GitHub Flavored Markdown

### Note Structure Best Practices
- Keep notes atomic (one concept per note)
- Use descriptive filenames that reflect the content
- Add frontmatter (YAML) at the top for structured metadata:
  ```yaml
  ---
  created: 2025-10-14
  tags: [work, project, meeting]
  status: in-progress
  ---
  ```
- Leverage bidirectional linking to create connections between notes
- Use the daily notes feature for time-based journaling

### File Organization Workflow

1. **Capture** - New notes start in `00-Inbox/`
2. **Process** - Review, add proper tags, and decide destination
3. **Organize** - Move to appropriate folder:
   - Learning materials → `01-Learning/`
   - Work tasks/meetings → `02-Work/`
   - Personal projects → `03-Projects/`
   - Reference materials → `05-Resources/`
4. **Archive** - Completed items → `04-Archive/`

### Folder + Tag Strategy

- **Folders** provide physical organization and workflow stages
- **Tags** enable cross-cutting categorization and quick search
- Use **both** for maximum flexibility:
  - Folders = "where does this live?"
  - Tags = "what type of content is this?"
- Each folder has a README explaining its purpose

## Smart Note Creation Workflow

When Claude creates notes in this vault, follow these intelligent decision rules:

### Decision Tree for Note Creation

1. **Is this a new concept being introduced?**
   - YES → Create in `00-Inbox/` for later processing
   - NO → Continue to step 2

2. **What is the primary purpose of this note?**
   - **Task tracking / Sprint work / Daily activities** → `02-Work/`
   - **Long-term project / Feature initiative** → `03-Projects/`
   - **Documentation / Learning resource** → `01-Learning/`
   - **Code snippet / Template / Reference** → `05-Resources/`
   - **Completed work** → `04-Archive/`

3. **What is the note's lifecycle stage?**
   - **Active development** → `02-Work/` or `03-Projects/`
   - **Reference/Documentation** → `01-Learning/` or `05-Resources/`
   - **Historical/Completed** → `04-Archive/`

### Folder-Specific Guidelines

#### `00-Inbox/` - Use for:
- Quick captures during conversations
- Notes that need further categorization
- Temporary brainstorming content
- **Action**: Move to permanent location after processing

#### `01-Learning/` - Use for:
- Repository overviews and architecture docs
- Technology documentation and guides
- API references and SDK documentation
- Design patterns and best practices
- Tutorial notes and learning paths
- **Examples**: "CNP Monorepo Overview", "React Hooks Guide", "GraphQL Best Practices"

#### `02-Work/` - Use for:
- Sprint task tracking and daily work
- Bug investigation notes
- Meeting notes and discussions
- Code review notes
- Incident reports and troubleshooting
- **Examples**: "PayJIM - Atividades", "Bug #1234 Investigation", "Team Sync 2025-10-14"

#### `03-Projects/` - Use for:
- Feature architecture and design docs
- Cross-repository initiatives
- Side projects and experiments
- Project proposals and planning
- **Examples**: "PayJIM Architecture", "Design System Migration Plan", "Auth Refactor Project"

#### `04-Archive/` - Use for:
- Completed features and resolved bugs
- Historical meeting notes (older than 3 months)
- Past incident reports
- Deprecated documentation
- **Action**: Only Claude should suggest archiving, user decides to move

#### `05-Resources/` - Use for:
- Code snippets and templates
- Configuration examples
- Cheat sheets and quick references
- Tool setup guides
- Bookmark collections
- **Examples**: "React Component Templates", "Git Commands Cheat Sheet", "VSCode Shortcuts"

### Smart Linking Strategy

When creating notes, intelligently create links to related content:

1. **Always link to**:
   - Parent repository/project notes
   - Related architectural documents
   - Referenced PR or issue tracking notes

2. **Create placeholder links** (notes that don't exist yet but should):
   - Use `[[Note Name]]` format
   - Only create placeholders for truly relevant cross-references
   - Don't over-link to avoid clutter

3. **Bidirectional linking**:
   - When creating Note B that references Note A, add a "Related Notes" section in Note A pointing back to Note B
   - Maintain context in both directions

### Tag Selection Rules

Apply tags based on these decision rules:

1. **Content Type** (choose ONE):
   - Creating documentation? → `#doc`
   - Meeting or discussion? → `#meeting`
   - New idea or proposal? → `#idea`
   - Learning material? → `#learning`

2. **Repository/Project** (if applicable):
   - Related to CNP? → `#cnp`
   - Related to Dashboard? → `#dashboard`
   - Related to Design System? → `#design-system`
   - Related to Receipts? → `#receipt`

3. **Work Type** (if applicable):
   - Bug-related? → `#bug`
   - Feature work? → `#feature`
   - Code review? → `#pr-review`
   - Production issue? → `#incident`
   - Debugging? → `#troubleshooting`

4. **Status** (if task-oriented):
   - Not started? → `#todo`
   - In progress? → `#doing`
   - Completed? → `#done`

5. **Priority** (only if explicitly urgent or important):
   - Time-sensitive? → `#urgent`
   - High-value? → `#important`

### Examples of Smart Decisions

| Scenario | Folder | Tags | Reasoning |
|----------|--------|------|-----------|
| User shares a CSV of sprint tasks | `02-Work/` | `#cnp #feature #doing` | Active work tracking, not long-term doc |
| Creating architecture overview for a project | `03-Projects/` | `#doc #cnp #feature` | Long-term project documentation |
| Documenting a repository structure | `01-Learning/` | `#doc #learning #cnp` | Educational/reference material |
| Bug investigation notes | `02-Work/` | `#bug #cnp #troubleshooting` | Active debugging work |
| Meeting notes from team sync | `02-Work/` | `#meeting #cnp` | Daily activity documentation |
| Code snippet for reuse | `05-Resources/` | `#doc` | Reference material template |
| Quick idea during conversation | `00-Inbox/` | `#idea` | Needs processing later |

### Workflow Automation Principles

1. **Avoid creating unnecessary notes**: Don't create notes for trivial or temporary information
2. **Consolidate related information**: If content fits in an existing note, update it instead of creating a new one
3. **Use meaningful filenames**: Names should be descriptive and searchable
4. **Maintain atomic notes**: One clear concept per note, but include enough context to be standalone
5. **Link generously, but purposefully**: Create connections that add value, not just for the sake of linking
6. **Front matter consistency**: Always include created date, relevant tags, and status if applicable

---

## Daily Work Log Workflow

A structured system for tracking daily activities, learnings, and progress.

### Purpose
- Track daily work and accomplishments
- Document learnings and decisions
- Identify blockers early
- Maintain context between days
- Support weekly reviews and standups
- Build a searchable work history

### Location & Structure
- **Storage**: `02-Work/Daily-Logs/`
- **Format**: `YYYY-MM-DD.md` (e.g., `2025-10-14.md`)
- **Template**: `05-Resources/Templates/Daily Work Log Template.md`
- **Tags**: `#work #daily-log`

### When to Use Daily Logs

✅ **Use for:**
- Daily accomplishments and tasks completed
- PR reviews and code changes
- Meetings and key discussions
- Technical learnings and discoveries
- Blockers and challenges faced
- Tomorrow's action items
- Standup preparation

❌ **Don't use for:**
- Long-form technical documentation → Use `01-Learning/`
- Project planning → Use `03-Projects/`
- Deep bug investigations → Create separate bug notes in `02-Work/`

### Claude Code Integration

When working with daily logs, Claude can:

1. **Create logs on demand**:
   - "Create today's daily work log"
   - "Show me today's log"
   - Automatically fills in date and sets up structure

2. **Smart population**:
   - "Add [activity] to today's log"
   - "Update my log with PR reviews"
   - Context-aware content suggestions

3. **Review and summarize**:
   - "Show me this week's daily logs"
   - "Summarize my work this week"
   - "Create weekly summary from daily logs"

4. **Link management**:
   - Auto-link to relevant project notes
   - Connect to PRs and issues
   - Reference related work notes

### Automation Options

See [[Daily Work Log - Automation Guide]] for detailed setup instructions:

- **Option 1 (Recommended)**: Obsidian Daily Notes plugin - Native, simple, keyboard shortcut
- **Option 2**: Templater plugin - Advanced templating with dynamic content
- **Option 3**: Shell scripts - Full automation with Git/GitHub integration
- **Option 4**: Periodic Notes - Weekly and monthly rollups
- **Option 5**: Claude Code integration - Conversational, context-aware

**Recommended Setup**: Hybrid approach
1. Use Obsidian Daily Notes for quick creation (`Cmd/Ctrl + Shift + D`)
2. Use Claude Code to intelligently populate content
3. Weekly review and archival process

### Daily Routine

#### Morning (2-3 minutes)
1. Open or create today's log
2. Review yesterday's action items
3. Set today's main focus and goals
4. Link to active projects

#### During Day (as needed)
- Quick captures: Add items as you work
- PR activity: Note reviews and merges
- Blockers: Document immediately
- Learnings: Capture technical insights

#### End of Day (5 minutes)
1. Fill "What I Did Today" section
2. Document "What I Learned"
3. List blockers and questions
4. Create action items for tomorrow
5. Fill standup summary (if applicable)

### Weekly Review Process

Every Friday or Monday:
1. Review all daily logs from the past week
2. Extract key accomplishments
3. Identify patterns in blockers
4. Move important learnings to `01-Learning/`
5. Update [[Professional Growth Plan]] with progress
6. Archive logs older than 30 days to `04-Archive/`

### Integration with Other Workflows

**Connects to**:
- [[Professional Growth Plan]] - Track skill development over time
- [[PayJIM - Atividades]] - Link to project tasks
- Project notes - Reference specific features worked on
- Bug investigation notes - Link to debugging sessions

**Feeds into**:
- Weekly summaries and retrospectives
- Performance reviews and 1:1s
- Learning documentation
- Team standups

### Tips for Effective Daily Logs

1. **Be concise**: Bullet points over paragraphs
2. **Be consistent**: Fill in daily, even if brief
3. **Link liberally**: Connect to PRs, issues, project notes
4. **Track learnings**: Capture "aha!" moments
5. **Note blockers**: Document problems when fresh
6. **Use sections selectively**: Not every section needs content every day
7. **Review regularly**: Look back weekly to see progress

### Example Workflow

```
User: "Create today's daily log"

Claude creates:
- File: 02-Work/Daily-Logs/2025-10-14.md
- Filled with today's date
- Linked to active projects (PayJIM, etc.)
- Ready to fill in

User: "Add PR review for cnp#735 to my log"

Claude updates the PRs section:
- Reviewed: PR #735 - Wallet USD support (infinitepay-cnp-monorepo)

User: "What did I work on this week?"

Claude reviews all daily logs from Mon-Fri:
- Summarizes key activities
- Lists completed PRs
- Highlights learnings
- Identifies recurring blockers
```

### Related Resources

- [[Daily Work Log Template]] - The base template
- [[Daily Work Log - Automation Guide]] - Detailed automation setup
- [[Professional Growth Plan]] - Career development tracking
- [[Book Recommendations]] - Learning resources

---

## Git Workflow Integration

This vault uses Git for version control with automated GitHub Actions that create commits daily. Claude Code can assist with Git operations and conflict resolution.

### Daily Git Workflow

**Morning routine:**
1. Always start with `git pull origin main` to sync with remote
2. This prevents conflicts with automated commits from GitHub Actions

**During work:**
1. Check changes: `git status` and `git diff`
2. Stage files: `git add <file>` or `git add -A`
3. Commit frequently: `git commit -m "descriptive message"`

**End of day:**
1. Pull first: `git pull origin main`
2. Resolve any conflicts (see below)
3. Push: `git push origin main`

### Claude Code Assistance with Git

Claude can help with various Git tasks:

**Checking status and changes:**
```
"What files have I changed today?"
"Show me the diff for my daily log"
"Check the git status"
```

**Resolving merge conflicts:**
```
"Help me resolve this merge conflict"
"I have a conflict in 2025-10-22.md, can you merge both versions?"
"Explain what this git conflict means"
```

**Committing and pushing:**
```
"Help me commit and push my changes"
"Generate a commit message for these changes"
"Check if I need to pull before pushing"
```

**Understanding errors:**
```
"Explain this git error: [error message]"
"My branch has diverged, what should I do?"
"Help me with git [specific issue]"
```

### How Claude Resolves Conflicts

When you ask Claude to help with merge conflicts:

1. **Claude reads the conflicted file** to see both versions
2. **Analyzes the content** to understand what each version contains
3. **Intelligently merges** by combining valuable information from both
4. **Writes the resolved version** removing conflict markers
5. **Stages the file** with `git add`
6. **Commits the merge** with a descriptive message
7. **Pushes to remote** if requested

**Example interaction:**
```
User: "Help me resolve the merge conflict in today's daily log"

Claude:
1. Reads 02-Work/Daily-Logs/2025-10-22.md
2. Sees local version has PR review notes
3. Sees remote version has automated template updates
4. Merges both sections together
5. Removes <<<<<<, =======, >>>>>> markers
6. Stages: git add 02-Work/Daily-Logs/2025-10-22.md
7. Commits: git commit -m "Merge remote changes and resolve conflict"
8. Pushes: git push origin main
```

### Preventing Conflicts with Automation

**Automation schedule:**
- **Daily logs**: Created at 8 AM UTC (5 AM BRT) on weekdays
- **Learning notes**: Created at 9 AM UTC (6 AM BRT) daily
- **Inbox processing**: Friday at 7 PM UTC (4 PM BRT)

**Best practices:**
1. **Pull before starting work** each day
2. **Commit frequently** (smaller commits = easier merges)
3. **Pull before pushing** at end of day
4. **Let automation create files**, then edit them
5. **Ask Claude for help** when conflicts occur

### Common Git Issues and Claude's Role

**Issue: "Your branch has diverged"**
- **Meaning**: Both local and remote have different commits
- **Ask Claude**: "My branch has diverged, help me merge"
- **Claude will**: Check status, suggest merge or rebase, help resolve

**Issue: "Merge conflict in [file]"**
- **Meaning**: Git can't automatically merge changes
- **Ask Claude**: "Help me resolve the conflict in [file]"
- **Claude will**: Read both versions, intelligently merge, stage, commit

**Issue: "Cannot push, remote has changes"**
- **Meaning**: Need to pull first
- **Ask Claude**: "Help me sync with remote"
- **Claude will**: Pull, resolve conflicts, then push

### Claude's Git Permissions

**Claude CAN do:**
- ✅ `git status`, `git diff`, `git log` (read operations)
- ✅ `git add` (stage files)
- ✅ `git commit` (create commits)
- ✅ `git push` (push to remote)
- ✅ `git pull` (pull from remote)
- ✅ Read and resolve merge conflicts
- ✅ Write resolved files and stage them

**Claude will ASK first before:**
- ⚠️ `git push --force` (force push)
- ⚠️ `git reset --hard` (destructive reset)
- ⚠️ Changing git config
- ⚠️ Deleting branches
- ⚠️ Any irreversible operations

**Claude will NOT do without explicit request:**
- ❌ Force push to main/master
- ❌ Hard reset that loses changes
- ❌ Skip commit hooks
- ❌ Modify git history destructively

### Full Documentation

For comprehensive Git workflows and troubleshooting:
- See [[Git Workflow and Troubleshooting Guide]] in `05-Resources/`
- Covers: daily workflows, conflict resolution, automation issues, recovery procedures
- Includes: command cheat sheet, emergency recovery, best practices

### Integration with Other Workflows

**Daily logs:**
- Pull before opening today's log
- Actions may have created it already
- Claude can merge your edits with template

**Quarterly reviews:**
- Commit achievement tracker updates frequently
- Claude can help stage and commit changes
- Prevents losing work if conflicts occur

**Learning notes:**
- Actions creates notes in `00-Inbox/` daily
- Pull in morning to see new notes
- Move to appropriate folders as needed

---
