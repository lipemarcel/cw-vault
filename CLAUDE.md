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
