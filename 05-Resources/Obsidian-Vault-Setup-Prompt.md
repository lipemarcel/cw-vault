---
created: 2025-10-16
tags: [doc, guide, automation]
type: setup-guide
---

# Obsidian Vault Setup Prompt for Claude Code

**Purpose**: A comprehensive prompt to help others replicate this AI-powered knowledge management system using Claude Code.

---

## Instructions for Claude Code

You are helping a user set up a professional knowledge management system in Obsidian. This system is designed for software engineers who want to:

1. **Track daily work** systematically
2. **Automate documentation** workflows
3. **Prepare performance reviews** effortlessly
4. **Integrate AI** into their development workflow
5. **Build a searchable knowledge base** over time

Follow the structure and guidelines below to create a similar vault from scratch.

---

## Part 1: Create Folder Structure

Create the following numbered folder system in the user's Obsidian vault:

```
00-Inbox/          # Quick capture zone - temporary notes
01-Learning/       # Technical knowledge base - permanent reference
02-Work/           # Day-to-day activities - active work tracking
  └── Daily-Logs/  # Daily work log files (YYYY-MM-DD.md format)
03-Projects/       # Long-term initiatives - project documentation
04-Archive/        # Historical reference - completed work
05-Resources/      # Reference materials - templates and guides
  └── Templates/   # Note templates
```

Create a `README.md` in each folder explaining its purpose:

### 00-Inbox/README.md
```markdown
# Inbox - Quick Capture Zone

**Purpose**: Temporary holding area for new notes that need processing.

## Use this folder for:
- Quick captures during meetings or research
- Daily learning notes before categorization
- Brainstorming and rough ideas
- Notes that need further organization

## Workflow:
1. Capture notes here quickly without overthinking
2. Process regularly (daily or weekly)
3. Move to appropriate permanent folders
4. Keep inbox lean (under 10 notes ideally)

## Processing Guidelines:
- **Learning materials** → Move to `01-Learning/`
- **Work tasks/meetings** → Move to `02-Work/`
- **Personal projects** → Move to `03-Projects/`
- **Reference materials** → Move to `05-Resources/`
- **Completed items** → Move to `04-Archive/`
```

### 01-Learning/README.md
```markdown
# Learning - Technical Knowledge Base

**Purpose**: Permanent reference for technical documentation and learning.

## Use this folder for:
- Repository overviews and architecture docs
- Technology documentation and guides
- Design patterns and best practices
- Framework and tool documentation
- Tutorial notes and learning paths

## Examples:
- "React Server Components Deep Dive"
- "CNP Monorepo Architecture Overview"
- "GraphQL Best Practices"
- "TypeScript Advanced Patterns"

## Organization:
- One concept per note (atomic notes)
- Link related concepts with [[wiki links]]
- Add tags: `#learning #doc` + technology tag
- Include code examples and diagrams
```

### 02-Work/README.md
```markdown
# Work - Day-to-Day Activities

**Purpose**: Active work tracking and daily activities.

## Use this folder for:
- Daily work logs (in `Daily-Logs/` subfolder)
- Sprint task tracking
- Bug investigation notes
- Meeting notes and discussions
- Code review notes
- Incident reports

## Subfolders:
- `Daily-Logs/` - Daily work logs in YYYY-MM-DD.md format
- Root folder - Other work-related notes

## Organization:
- Use descriptive filenames
- Add tags: `#meeting`, `#bug`, `#feature`, `#pr-review`, etc.
- Link to project notes and PRs
- Archive completed work to `04-Archive/` when done
```

### 03-Projects/README.md
```markdown
# Projects - Long-Term Initiatives

**Purpose**: Documentation for long-term projects and initiatives.

## Use this folder for:
- Feature architecture and design docs
- Cross-repository initiatives
- Side projects and experiments
- Project proposals and planning
- Professional growth plans

## Examples:
- "PayJIM Architecture"
- "Design System Migration Plan"
- "Professional Growth Plan"

## Organization:
- One note per major project
- Include architecture diagrams
- Link related work notes
- Track project status in frontmatter
```

### 04-Archive/README.md
```markdown
# Archive - Historical Reference

**Purpose**: Completed work and historical context.

## Use this folder for:
- Completed features and resolved bugs
- Historical meeting notes (older than 3 months)
- Past incident reports
- Deprecated documentation

## Workflow:
- Move completed work here periodically
- Maintain folder structure from source
- Keep links intact for reference
- Review annually and delete if no longer needed
```

### 05-Resources/README.md
```markdown
# Resources - Reference Materials

**Purpose**: Reusable templates, snippets, and reference materials.

## Use this folder for:
- Note templates
- Code snippets and examples
- Cheat sheets and quick references
- Tool setup guides
- Bookmark collections
- Automation guides

## Organization:
- Templates go in `Templates/` subfolder
- Use descriptive names
- Tag with `#doc` for searchability
```

---

## Part 2: Create Core Templates

### Daily Work Log Template

Create `05-Resources/Templates/Daily Work Log Template.md`:

```markdown
---
created: {{date}}
tags: [work, daily-log]
type: daily-log
---

# Daily Work Log - {{date}}

## 🎯 Today's Focus

**Main Goal**:

**Repositories**:
- [ ] [primary-repo-name]
- [ ] [secondary-repo-name]

---

## ✅ What I Did Today

### Code & Features
-

### PRs & Reviews
- **Opened**:
- **Reviewed**:
- **Merged**:

### Bugs & Fixes
-

### Meetings & Discussions
-

---

## 🧠 What I Learned

### Technical
-

### Domain Knowledge
-

### Process/Tools
-

---

## 🚧 Blockers & Challenges

### Active Blockers
-

### Questions to Answer
-

### Need Help With
-

---

## 💡 Ideas & Notes

### Improvements
-

### Refactoring Ideas
-

### Future Work
-

---

## 📝 Action Items for Tomorrow

- [ ]
- [ ]
- [ ]

---

## 🔗 Related Notes

- [[Project Name]]
-

---

## Standup Summary

**Yesterday**:

**Today**:

**Blockers**:

---

## Time Tracking (Optional)

| Task | Time Spent | Repository |
|------|------------|------------|
|      |            |            |

**Total Productive Hours**:

---

## Mood & Energy

**Energy Level**: ⚡⚡⚡⚡⚡ (1-5)

**Focus Quality**: 🎯🎯🎯🎯🎯 (1-5)

**Notes**:
```

### Quarterly Self-Evaluation Template

Create `05-Resources/Templates/Quarterly Self-Evaluation Template.md`:

```markdown
---
created: {{date}}
tags: [work, performance-review, self-evaluation]
quarter: Q[X] {{year}}
deadline: {{deadline-date}}
status: in-progress
---

# Quarterly Self-Evaluation - Q[X] {{year}} (DRAFT)

**Period**: [Start Date] to [End Date]
**Deadline**: [Submission Deadline]
**Status**: `IN PROGRESS - Update weekly`

> **Note**: This is a living document. Update throughout the quarter as you complete work.

---

## Results 🥇

**Rating**: [ ] Outstanding | [ ] 100% Consistent | [ ] Almost there | [ ] Below

### Key Achievements

-

### Draft Response (Portuguese)

```
[Your response here]
```

### Draft Response (English)

```
[Your response here]
```

---

## Innovation 💡

**Rating**: [ ] Outstanding | [ ] 100% Consistent | [ ] Almost there | [ ] Below

### Key Achievements

-

### Draft Response (Portuguese)

```
[Your response here]
```

### Draft Response (English)

```
[Your response here]
```

---

## Ownership ⚖️

**Rating**: [ ] Outstanding | [ ] 100% Consistent | [ ] Almost there | [ ] Below

### Key Achievements

-

### Draft Response (Portuguese)

```
[Your response here]
```

### Draft Response (English)

```
[Your response here]
```

---

## AI Application 🤖

**Rating**: [ ] Outstanding | [ ] 100% Consistent | [ ] Almost there | [ ] Below

### Key Achievements

-

### Draft Response (Portuguese)

```
[Your response here]
```

### Draft Response (English)

```
[Your response here]
```

---

## Supporting Evidence

### Key Projects This Quarter

- [[Project 1]]
- [[Project 2]]

### PRs Delivered

**Merged**:
-

**In Review/Progress**:
-

### Automation & Tools Created

-

### Learning & Growth

-

---

## Progress Tracking

**Last Updated**: {{date}}
**Achievement Count**: [X] achievements documented
**Coverage**: All 4 pillars [✅/❌]

### Update Schedule

- **Weekly** (Friday 4pm): Add week's achievements
- **Monthly** (Last Friday): Review month's progress
- **Before Deadline** (2 weeks prior): Final polish and submission

---

## Related Notes

- [[Quarterly-Achievement-Tracker]]
- [[Previous Quarter Evaluation]]
```

---

## Part 3: Create CLAUDE.md Configuration

Create `CLAUDE.md` in the vault root with detailed instructions for Claude Code on how to work with this vault. Include:

### Repository Overview
- Vault purpose and owner
- Primary work repositories
- Role and context

### Vault Structure Documentation
- Folder system (00-05) with descriptions
- When to use each folder
- Workflow stages (Capture → Process → Organize → Archive)

### Tag System
Define a simple, consistent tag taxonomy:

**Content Type** (choose ONE):
- `#meeting` - Meeting notes
- `#idea` - Ideas and brainstorming
- `#doc` - Documentation
- `#learning` - Learning resources

**Status** (optional):
- `#todo` - Not started
- `#doing` - In progress
- `#done` - Completed

**Repository/Project** (if applicable):
- Custom tags for each repository (e.g., `#repo-name`)

**Work Type** (if applicable):
- `#bug` - Bug fixes
- `#feature` - New features
- `#pr-review` - Code reviews
- `#incident` - Production incidents
- `#troubleshooting` - Debugging

**Priority** (use sparingly):
- `#urgent` - Time-sensitive
- `#important` - High-value

### Smart Note Creation Workflow

Include a decision tree for Claude:

1. **Is this a new concept?**
   - YES → Create in `00-Inbox/`
   - NO → Continue to step 2

2. **What is the primary purpose?**
   - Task tracking / Daily work → `02-Work/`
   - Long-term project / Feature → `03-Projects/`
   - Documentation / Learning → `01-Learning/`
   - Code snippet / Template → `05-Resources/`
   - Completed work → `04-Archive/`

3. **What lifecycle stage?**
   - Active development → `02-Work/` or `03-Projects/`
   - Reference/Documentation → `01-Learning/` or `05-Resources/`
   - Historical/Completed → `04-Archive/`

### Daily Work Log Workflow

Document the daily log system:
- Storage location: `02-Work/Daily-Logs/`
- Format: `YYYY-MM-DD.md`
- Template reference
- When to use daily logs
- Claude Code integration examples

### Note Structure Best Practices

- Atomic notes (one concept per note)
- Frontmatter with metadata
- Wiki-style links `[[Note Name]]`
- Tags (1-3 per note)
- Bidirectional linking

---

## Part 4: Create Automation Guides

### Daily Work Log Automation Guide

Create `05-Resources/Daily Work Log - Automation Guide.md` with:

1. **Option 1**: Obsidian Daily Notes plugin (native, simple)
2. **Option 2**: Templater plugin (advanced)
3. **Option 3**: GitHub Actions (full automation)
4. **Option 4**: Periodic Notes plugin (weekly/monthly rollups)
5. **Option 5**: Claude Code integration (conversational)

Include setup instructions for each option.

### Quarterly Review Automation Guide

Create `05-Resources/Quarterly-Review-Automation-Guide.md` with:

1. **The Problem**: Manual quarterly reviews are time-consuming
2. **The Solution**: Three-part system
   - Continuous tracking
   - AI-powered generation
   - Quarterly workflow
3. **Part 1**: Weekly achievement capture
4. **Part 2**: AI response generation with Claude Code
5. **Part 3**: Timeline and workflow
6. **Best Practices**: Do's and Don'ts
7. **Example Commands** for Claude Code

---

## Part 5: Create Achievement Tracker

Create `02-Work/Quarterly-Achievement-Tracker.md`:

```markdown
---
created: {{date}}
tags: [work, performance-review, achievement-tracking]
status: active
---

# Quarterly Achievement Tracker

**Purpose**: Continuous tracking of accomplishments for effortless quarterly reviews.

---

## Current Quarter: Q[X] {{year}}

**Period**: [Start] - [End]
**Review Deadline**: [Date]

### Results 🥇
*Deliverables, objectives met, team contributions*

#### [Month] {{year}}

**Date**: YYYY-MM-DD
**Category**: Results
**What**: Brief description
**Impact**: How it helped
**Evidence**: [[Link]], [PR #123]

---

### Innovation 💡
*Automation, new tools, creative solutions*

#### [Month] {{year}}

-

---

### Ownership ⚖️
*Proactive problem-solving, initiative, impact awareness*

#### [Month] {{year}}

-

---

### AI Application 🤖
*AI opportunity identification, staying current, proposing solutions*

#### [Month] {{year}}

-

---

## Quick Capture Template

```
**Date**: YYYY-MM-DD
**Category**: [Results/Innovation/Ownership/AI Application]
**What**: Brief description
**Impact**: How it helped team/customers/process
**Evidence**: [[Link]], [PR #123]
```

---

## Automation Commands

Ask Claude Code:
- "Update my quarterly tracker with recent work"
- "Generate my Q[X] self-evaluation"
- "What achievements am I missing for [pillar]?"
- "Summarize my quarter for the review"

---

## Tips

1. **Log weekly**: Update every Friday
2. **Be specific**: Include metrics, PR numbers
3. **Capture context**: Note why it was significant
4. **Link everything**: Connect to PRs, meeting notes
5. **Don't overthink**: Quick bullets are enough
```

---

## Part 6: Setup GitHub Actions (Optional)

If the user wants automated daily log creation, create:

`.github/workflows/create-daily-log.yml`:

```yaml
name: Create Daily Work Log

on:
  schedule:
    - cron: '0 8 * * 1-5'  # 8 AM UTC, Mon-Fri
  workflow_dispatch:

permissions:
  contents: write

jobs:
  create-log:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v4
        with:
          fetch-depth: 0

      - name: Get current date
        id: date
        run: echo "date=$(TZ='America/Sao_Paulo' date +'%Y-%m-%d')" >> $GITHUB_OUTPUT

      - name: Check if log exists
        id: check
        run: |
          if [ -f "02-Work/Daily-Logs/${{ steps.date.outputs.date }}.md" ]; then
            echo "exists=true" >> $GITHUB_OUTPUT
          else
            echo "exists=false" >> $GITHUB_OUTPUT
          fi

      - name: Create log from template
        if: steps.check.outputs.exists == 'false'
        run: |
          mkdir -p 02-Work/Daily-Logs
          DATE="${{ steps.date.outputs.date }}"
          sed "s/{{date}}/$DATE/g" "05-Resources/Templates/Daily Work Log Template.md" > "02-Work/Daily-Logs/$DATE.md"

      - name: Commit and push
        if: steps.check.outputs.exists == 'false'
        run: |
          git config user.name "github-actions[bot]"
          git config user.email "github-actions[bot]@users.noreply.github.com"
          git add 02-Work/Daily-Logs/
          git commit -m "Create daily work log for ${{ steps.date.outputs.date }}"
          git push
```

**Requirements**:
1. GitHub repository
2. Template file exists at specified path
3. Workflow permissions set to allow writes

### Inbox Processing Automation

Create `.github/workflows/process-inbox.yml` for automatic note organization:

```yaml
name: Process Inbox Notes

on:
  schedule:
    # Run every Friday at 4 PM BRT (7 PM UTC)
    - cron: '0 19 * * 5'
  workflow_dispatch: # Allow manual trigger

permissions:
  contents: write

jobs:
  process-inbox:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v4
        with:
          fetch-depth: 0

      - name: Setup Git
        run: |
          git config --global user.name "GitHub Actions Bot"
          git config --global user.email "github-actions[bot]@users.noreply.github.com"

      - name: Process inbox notes
        id: process
        run: |
          MOVED_COUNT=0
          MOVED_NOTES=""

          # Check if inbox directory exists
          if [ ! -d "00-Inbox" ] || [ -z "$(find 00-Inbox -maxdepth 1 -name '*.md' -not -name 'README.md')" ]; then
            echo "No notes to process"
            echo "moved_count=0" >> $GITHUB_OUTPUT
            echo "has_changes=false" >> $GITHUB_OUTPUT
            exit 0
          fi

          # Process each markdown file in inbox
          for file in 00-Inbox/*.md; do
            # Skip README
            if [ "$file" = "00-Inbox/README.md" ] || [ "$file" = "00-Inbox/*.md" ]; then
              continue
            fi

            BASENAME=$(basename "$file")
            echo "Processing: $BASENAME"

            # Extract tags from file
            TAGS=$(grep -E '^tags:|#[a-z-]+' "$file" | tr '[],' ' ' | grep -oE '#[a-z-]+' | sort -u)

            # Determine destination based on tags
            DEST_FOLDER=""

            # Work-related tags → 02-Work/
            if echo "$TAGS" | grep -qE '#(meeting|bug|feature|pr-review|incident|troubleshooting|work)'; then
              DEST_FOLDER="02-Work"

            # Learning/documentation tags → 01-Learning/ or 03-Projects/
            elif echo "$TAGS" | grep -qE '#(learning|doc)'; then
              if echo "$TAGS" | grep -qE '#(cnp|dashboard|design-system|receipt)'; then
                # Architecture docs → Projects
                if grep -qiE '(architecture|design|implementation)' "$file"; then
                  DEST_FOLDER="03-Projects"
                else
                  DEST_FOLDER="01-Learning"
                fi
              else
                DEST_FOLDER="01-Learning"
              fi

            # Completed items → Archive
            elif echo "$TAGS" | grep -qE '#done'; then
              DEST_FOLDER="04-Archive"

            # No clear destination → keep in inbox
            else
              echo "  → Keeping in inbox (no clear tags)"
              continue
            fi

            # Move file
            if [ -n "$DEST_FOLDER" ] && [ "$DEST_FOLDER" != "00-Inbox" ]; then
              mkdir -p "$DEST_FOLDER"
              mv "$file" "$DEST_FOLDER/"
              echo "  → Moved to $DEST_FOLDER/"
              MOVED_COUNT=$((MOVED_COUNT + 1))
              MOVED_NOTES="${MOVED_NOTES}- ${BASENAME} → ${DEST_FOLDER}/\n"
            fi
          done

          echo "moved_count=$MOVED_COUNT" >> $GITHUB_OUTPUT
          echo -e "moved_notes<<EOF" >> $GITHUB_OUTPUT
          echo -e "$MOVED_NOTES" >> $GITHUB_OUTPUT
          echo "EOF" >> $GITHUB_OUTPUT

          if [ $MOVED_COUNT -gt 0 ]; then
            echo "has_changes=true" >> $GITHUB_OUTPUT
          else
            echo "has_changes=false" >> $GITHUB_OUTPUT
          fi

      - name: Commit and push
        if: steps.process.outputs.has_changes == 'true'
        run: |
          git add -A
          git commit -m "Process inbox: moved ${{ steps.process.outputs.moved_count }} note(s)

          ${{ steps.process.outputs.moved_notes }}

          🤖 Automated by GitHub Actions"
          git push

      - name: Log result
        run: |
          if [ "${{ steps.process.outputs.has_changes }}" == "true" ]; then
            echo "✅ Processed ${{ steps.process.outputs.moved_count }} note(s)"
          else
            echo "✅ No notes to process"
          fi
```

**How it works**:
- Runs every Friday at 4 PM (or manually via workflow_dispatch)
- Analyzes tags in each note's frontmatter and content
- Moves notes to appropriate folders based on tag patterns
- Commits changes directly to main branch
- Skips notes without clear destination tags

**Tag-based routing**:
- `#meeting`, `#bug`, `#feature`, `#pr-review` → `02-Work/`
- `#learning`, `#doc` → `01-Learning/` (or `03-Projects/` if architecture)
- `#done` → `04-Archive/`
- No clear tags → Stays in inbox

---

## Part 7: Initial Content Examples

### Create Example Learning Note

`01-Learning/Repository Architecture Best Practices.md`:

```markdown
---
created: {{date}}
tags: [learning, doc, architecture]
---

# Repository Architecture Best Practices

## Key Principles

### 1. Separation of Concerns
- Clear module boundaries
- Single responsibility per module
- Minimal coupling between modules

### 2. Scalability
- Monorepo vs multi-repo considerations
- Build optimization strategies
- Dependency management

### 3. Developer Experience
- Fast feedback loops
- Easy local development setup
- Clear documentation

## Monorepo Benefits

- **Atomic changes**: Single PR across multiple packages
- **Code sharing**: Easy to share utilities
- **Consistent tooling**: Same config across all projects
- **Better refactoring**: Confidence with unified testing

## Tools

- **Turborepo**: Build system and task orchestration
- **Nx**: Advanced monorepo toolkit
- **pnpm workspaces**: Package management
- **Lerna**: Legacy but still popular

## Related Notes

- [[Monorepo Architecture]]
- [[Build Optimization Strategies]]
```

### Create Example Project Note

`03-Projects/Professional Growth Plan.md`:

```markdown
---
created: {{date}}
tags: [doc, career, personal-growth]
status: active
---

# Professional Growth Plan

## Current Level

**Role**: [Your Current Role]
**Date**: [Current Date]

## Short-Term Goals (3-6 months)

### Technical Skills
- [ ] Goal 1
- [ ] Goal 2

### Soft Skills
- [ ] Goal 1
- [ ] Goal 2

## Long-Term Goals (1-2 years)

### Career Direction
-

### Skills to Develop
-

## Learning Resources

- [[Book Recommendations]]
- Online courses
- Conference talks

## Progress Tracking

Use quarterly self-evaluations to track progress:
- [[Q1 Self-Evaluation]]
- [[Q2 Self-Evaluation]]
- [[Q3 Self-Evaluation]]
- [[Q4 Self-Evaluation]]
```

---

## Part 8: Claude Code Integration

### Commands for Users

Teach users these Claude Code commands:

**Daily Work Logs**:
```
"Create today's daily work log"
"Add [activity] to today's log"
"Show me this week's daily logs"
"Summarize my work this week"
```

**Quarterly Reviews**:
```
"Update my quarterly tracker with this week's work"
"Generate my Q[X] self-evaluation"
"What achievements am I missing for [pillar]?"
"Compare this evaluation to last quarter"
```

**Note Management**:
```
"Create a new meeting note for [topic]"
"Create architecture documentation for [project]"
"Move completed notes to archive"
```

### Claude's Role

Claude Code should:
1. **Understand vault structure** via CLAUDE.md
2. **Create notes in correct folders** using decision tree
3. **Apply tags consistently** following guidelines
4. **Link notes bidirectionally** when relevant
5. **Populate templates** with context-aware content
6. **Extract achievements** from daily logs
7. **Generate evaluation drafts** from achievement tracker
8. **Maintain consistency** across all notes

---

## Part 9: Obsidian Configuration

### Recommended Core Plugins

Enable these Obsidian core plugins:
- ✅ File explorer
- ✅ Search
- ✅ Quick switcher
- ✅ Graph view
- ✅ Backlinks
- ✅ Outgoing links
- ✅ Tag pane
- ✅ Page preview
- ✅ Templates
- ✅ Daily notes
- ✅ Note composer
- ✅ Command palette
- ✅ Markdown format importer
- ✅ Outline
- ✅ Bookmarks

### Daily Notes Configuration

`.obsidian/daily-notes.json`:
```json
{
  "folder": "02-Work/Daily-Logs",
  "format": "YYYY-MM-DD",
  "template": "05-Resources/Templates/Daily Work Log Template.md"
}
```

### Recommended Community Plugins (Optional)

- **Templater**: Advanced template features
- **Dataview**: Query and display note metadata
- **Calendar**: Visual calendar for daily notes
- **Periodic Notes**: Weekly/monthly note support
- **Obsidian Git**: Automatic Git sync

---

## Part 10: Usage Workflows

### Daily Routine

**Morning (2-3 min)**:
1. Open or create today's log
2. Review yesterday's action items
3. Set today's main focus

**During Day**:
- Quick capture work as you go
- Note PR activity
- Document blockers immediately
- Capture learnings

**End of Day (5 min)**:
1. Fill "What I Did Today"
2. Document "What I Learned"
3. List blockers
4. Create action items for tomorrow

### Weekly Routine

**Friday Afternoon (10 min)**:
1. Review all daily logs from the week
2. Update quarterly achievement tracker
3. Extract key learnings to `01-Learning/`
4. Move completed work to `04-Archive/`
5. Process inbox notes

### Quarterly Routine

**2 Weeks Before Deadline**:
1. Ask Claude: "Generate my Q[X] self-evaluation"
2. Review and refine responses
3. Identify missing evidence

**1 Week Before Deadline**:
1. Final review of responses
2. Polish language and tone
3. Get feedback if needed

**Day of Deadline**:
1. Copy responses to submission form
2. Submit before deadline
3. Archive evaluation to `04-Archive/Performance-Reviews/`

---

## Part 11: Customization Guidelines

Help the user customize this system:

### Personal Adjustments

1. **Folder Names**: Adapt to user's workflow
2. **Tag System**: Add project-specific tags
3. **Templates**: Modify to match team's practices
4. **Repository Links**: Update to user's actual repos
5. **Automation**: Enable/disable based on preferences

### Team Context

Ask the user about:
- Their role and responsibilities
- Primary repositories they work with
- Performance review system structure
- Team communication patterns
- Existing documentation practices

### Integration Points

Consider integrating with:
- Linear / Jira for issue tracking
- GitHub for PR tracking
- Slack for team communication
- Notion / Confluence for team docs

---

## Part 12: Success Metrics

After setup, the user should be able to:

✅ **Capture work effortlessly**: Daily logs in < 5 minutes
✅ **Find information quickly**: Search and links work well
✅ **Prepare reviews easily**: Quarterly reviews in < 30 minutes
✅ **Track growth**: Clear progression over time
✅ **Share knowledge**: Documentation helps team
✅ **Reduce friction**: Automation eliminates tedious tasks

---

## Part 13: Troubleshooting

### Common Issues

**"I forgot to log work all week"**:
- Review git commits for the week
- Check Linear/GitHub for completed work
- Ask Claude: "Help reconstruct this week from git history"

**"Inbox is overwhelming"**:
- Set weekly processing time
- Use Claude: "Help categorize and organize my inbox"
- Delete notes that are no longer relevant

**"Tags are inconsistent"**:
- Review tag guidelines in CLAUDE.md
- Ask Claude: "Audit my tags for consistency"
- Simplify tag system if too complex

**"Templates aren't working"**:
- Check Obsidian Templates plugin is enabled
- Verify template paths in settings
- Ensure templates folder exists

---

## Implementation Steps for Claude Code

When a user asks you to set up this system:

1. **Ask clarifying questions**:
   - What's your role?
   - What repositories do you work with?
   - Do you have performance reviews? What structure?
   - Do you want GitHub Actions automation?

2. **Create folder structure** with READMEs

3. **Create templates** customized to their context

4. **Create CLAUDE.md** with their specific info

5. **Create automation guides** explaining options

6. **Create achievement tracker** with their review pillars

7. **Set up GitHub Actions** (if desired)

8. **Create example notes** to demonstrate system

9. **Configure Obsidian settings** (if access available)

10. **Explain workflows** and provide quick commands

11. **Test the system** by creating a daily log together

12. **Provide ongoing support** as they use the system

---

## Example Interaction

```
User: "Help me set up a knowledge management system like yours"

Claude: "I'd be happy to help you set up an AI-powered knowledge management system in Obsidian! Let me ask a few questions to customize it for you:

1. What's your role? (e.g., Software Engineer, Product Manager)
2. What repositories or projects do you work with primarily?
3. Does your company have quarterly performance reviews? If so, what are the evaluation criteria?
4. Do you want automated daily log creation via GitHub Actions, or prefer manual creation?
5. Are there any specific workflows you want to track? (e.g., bug investigations, meeting notes, code reviews)

Once I understand your needs, I'll create a complete vault structure with templates, automation guides, and AI integration customized for your workflow."

[After receiving answers]

Claude: "Perfect! I'm going to create your vault structure now. I'll:

1. Create a numbered folder system (00-Inbox through 05-Resources)
2. Set up templates for daily logs and quarterly reviews
3. Create a CLAUDE.md file so I can assist you intelligently
4. Build automation guides for different workflows
5. Set up an achievement tracker for your review criteria
6. Create example notes to show the system in action

Give me a moment to set everything up..."

[Creates all files]

Claude: "All done! Your vault is ready. Here's how to get started:

**Today**:
- Run: 'Create today's daily work log'
- Fill in what you worked on today
- Try: 'Add [your recent PR] to today's log'

**This Week**:
- Use daily logs to capture work as you go
- Friday: 'Update my quarterly tracker with this week's work'

**This Quarter**:
- Continue logging daily
- 2 weeks before review: 'Generate my Q[X] self-evaluation'

Try creating today's log now, and I'll help you populate it!"
```

---

## Maintenance and Evolution

### Weekly
- Process inbox (< 10 notes)
- Update achievement tracker
- Review and refine tags

### Monthly
- Review note connections
- Archive completed work
- Update templates if needed
- Check automation is working

### Quarterly
- Generate self-evaluation
- Reflect on what's working
- Adjust workflows if needed
- Update documentation

---

## Resources for Users

- [Obsidian Documentation](https://help.obsidian.md/)
- [Markdown Guide](https://www.markdownguide.org/)
- [GitHub Actions Documentation](https://docs.github.com/actions)
- [Zettelkasten Method](https://zettelkasten.de/)
- [Building a Second Brain](https://www.buildingasecondbrain.com/)

---

**Remember**: This system should reduce friction, not create it. Start simple and add complexity only when needed. The goal is to make documentation effortless and performance reviews automatic.
