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

- `.obsidian/` - Configuration directory containing Obsidian-specific settings
  - `app.json` - General application settings
  - `core-plugins.json` - Enabled/disabled core plugins configuration
  - `workspace.json` - Current workspace layout and open files
  - `graph.json` - Graph view settings
  - `appearance.json` - Theme and appearance settings

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

### File Organization
- Notes can be organized in folders or kept flat depending on preference
- Use tags and links rather than deep folder structures for flexibility
- Common folder patterns (optional):
  - `Work/` - Work-related notes
  - `Learning/` - Learning materials and courses
  - `Projects/` - Project documentation
  - `Templates/` - Note templates
  - `Archive/` - Archived content
