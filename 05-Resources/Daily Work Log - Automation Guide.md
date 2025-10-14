---
created: 2025-10-14
tags: [doc, learning]
status: reference
---

# Daily Work Log - Automation Guide

Multiple automation options for creating and managing daily work logs in your Obsidian vault.

---

## Automation Options

### Option 1: Obsidian Daily Notes Plugin (Built-in) ⭐ RECOMMENDED

The simplest and most native solution.

#### Setup Steps

1. **Enable Daily Notes Plugin**
   - Already enabled in your vault
   - Settings → Core plugins → Daily notes (check enabled)

2. **Configure Daily Notes**
   ```
   Settings → Core plugins → Daily notes:
   - New file location: 02-Work/Daily-Logs/
   - Template file location: 05-Resources/Templates/Daily Work Log Template.md
   - Date format: YYYY-MM-DD
   - Open daily note on startup: Optional (recommended: No)
   ```

3. **Usage**
   - Press `Ctrl/Cmd + P` → "Open today's daily note"
   - Or use ribbon icon
   - Creates new note from template automatically
   - Replaces `{{date}}` with current date

**Pros**:
- ✅ Native to Obsidian, no external dependencies
- ✅ Works offline
- ✅ Simple keyboard shortcut
- ✅ Automatic date injection

**Cons**:
- ❌ Limited variable substitution (only date)
- ❌ Can't auto-pull from external sources (PRs, commits, etc.)

---

### Option 2: Templater Plugin (Advanced)

More powerful template system with custom scripts.

#### Setup Steps

1. **Install Templater Plugin**
   - Settings → Community plugins → Browse
   - Search "Templater" → Install → Enable

2. **Configure Templater**
   ```
   Settings → Templater:
   - Template folder location: 05-Resources/Templates/
   - Automatic jump to cursor: Enable
   - Trigger Templater on new file creation: Enable
   ```

3. **Enhanced Template Variables**
   ```markdown
   ---
   created: <% tp.date.now("YYYY-MM-DD") %>
   day: <% tp.date.now("dddd") %>
   week: Week <% tp.date.now("WW") %>
   tags: [work, daily-log]
   ---

   # Daily Work Log - <% tp.date.now("YYYY-MM-DD") %>

   ## 🎯 Today's Focus

   **Day of Week**: <% tp.date.now("dddd") %>
   **Week Number**: <% tp.date.now("WW") %> of 2025

   <!-- Yesterday's note -->
   [[<% tp.date.now("YYYY-MM-DD", -1) %>]] ← Yesterday | Tomorrow → [[<% tp.date.now("YYYY-MM-DD", 1) %>]]
   ```

4. **Custom Scripts** (Optional - Advanced)
   Create `05-Resources/Templates/scripts/daily-log-helper.js`:
   ```javascript
   // Auto-list open PRs, recent commits, etc.
   // Requires API integration
   ```

**Pros**:
- ✅ Advanced variable substitution
- ✅ Custom JavaScript functions
- ✅ Auto-link to yesterday/tomorrow
- ✅ Can execute shell commands
- ✅ Dynamic content generation

**Cons**:
- ❌ Requires plugin installation
- ❌ Learning curve
- ❌ More complex setup

---

### Option 3: Shell Script Automation

Create notes from command line or scheduled tasks.

#### Create Script: `~/.local/bin/create-daily-log.sh`

```bash
#!/bin/bash

VAULT_PATH="$HOME/Documents/cw-vault"
TEMPLATE_PATH="$VAULT_PATH/05-Resources/Templates/Daily Work Log Template.md"
LOG_DIR="$VAULT_PATH/02-Work/Daily-Logs"
TODAY=$(date +%Y-%m-%d)
DAY_NAME=$(date +%A)
LOG_FILE="$LOG_DIR/$TODAY.md"

# Create directory if it doesn't exist
mkdir -p "$LOG_DIR"

# Check if today's log already exists
if [ -f "$LOG_FILE" ]; then
    echo "Today's log already exists: $LOG_FILE"
    open -a "Obsidian" "$LOG_FILE"
    exit 0
fi

# Copy template and replace variables
cp "$TEMPLATE_PATH" "$LOG_FILE"

# Replace template variables (macOS sed syntax)
sed -i '' "s/{{date}}/$TODAY/g" "$LOG_FILE"

# Add day of week
sed -i '' "s/# Daily Work Log - $TODAY/# Daily Work Log - $TODAY ($DAY_NAME)/g" "$LOG_FILE"

echo "Created daily log: $LOG_FILE"

# Optional: Open in Obsidian
open -a "Obsidian" "$LOG_FILE"
```

#### Make Executable
```bash
chmod +x ~/.local/bin/create-daily-log.sh
```

#### Usage
```bash
# Run manually
create-daily-log.sh

# Or create alias in ~/.zshrc or ~/.bashrc
alias daily="create-daily-log.sh"
```

**Pros**:
- ✅ Full control over automation
- ✅ Can integrate with Git, GitHub API, etc.
- ✅ Can run on schedule
- ✅ Cross-platform (with modifications)

**Cons**:
- ❌ Requires shell scripting knowledge
- ❌ Manual execution unless scheduled
- ❌ Maintenance overhead

---

### Option 4: Periodic Notes Plugin (Week/Month/Quarter Views)

Extension of daily notes with weekly/monthly rollups.

#### Setup Steps

1. **Install Periodic Notes Plugin**
   - Settings → Community plugins → Browse
   - Search "Periodic Notes" → Install → Enable

2. **Configure**
   ```
   Settings → Periodic Notes:
   - Daily Notes: Enable
   - Weekly Notes: Enable (optional)
   - Monthly Notes: Enable (optional)
   ```

3. **Weekly Summary Template**
   Create `05-Resources/Templates/Weekly Summary Template.md`:
   ```markdown
   # Week <% tp.date.now("WW") %> - <% tp.date.now("YYYY") %>

   ## This Week's Daily Logs
   - [[Monday]]
   - [[Tuesday]]
   - [[Wednesday]]
   - [[Thursday]]
   - [[Friday]]

   ## Key Achievements
   -

   ## Challenges
   -

   ## Next Week's Focus
   -
   ```

**Pros**:
- ✅ Weekly and monthly rollups
- ✅ Better long-term view
- ✅ Integrates with daily logs

**Cons**:
- ❌ Another plugin dependency
- ❌ More complex structure

---

### Option 5: Claude Code Integration (This!)

Ask Claude to create daily logs on demand.

#### Usage

Simply ask:
```
"Create today's daily work log"
"Update my daily log with [activity]"
"Show me yesterday's log"
```

Claude will:
- Use the template
- Fill in today's date
- Place in correct folder
- Auto-link to relevant notes
- Can even pre-fill based on context

**Pros**:
- ✅ Conversational interface
- ✅ Context-aware (knows your projects)
- ✅ Can auto-summarize from PRs/commits
- ✅ No setup required
- ✅ Natural language queries

**Cons**:
- ❌ Requires Claude Code to be running
- ❌ Not fully automatic (requires request)

---

## Recommended Setup: Hybrid Approach ⭐

**Best of all worlds**:

1. **Primary**: Use Obsidian Daily Notes plugin for quick creation
   - Set keyboard shortcut: `Cmd/Ctrl + Shift + D`
   - Template auto-fills date

2. **Enhancement**: Add Templater for advanced features
   - Auto-link to yesterday/tomorrow
   - Day-of-week insertion
   - Week number tracking

3. **Smart Fill**: Use Claude Code to populate content
   - "Fill today's log with what I worked on"
   - Claude can parse PR activity, commits, etc.
   - Intelligent summarization

4. **Review**: Weekly script to archive old logs
   - Moves logs older than 30 days to `04-Archive/`
   - Creates weekly summaries

---

## Automation Workflows

### Morning Routine
1. Open Obsidian
2. Press `Cmd/Ctrl + Shift + D` (daily note shortcut)
3. Review yesterday's action items
4. Fill in "Today's Focus"

### During Day
- Quick capture: Add to relevant sections as you work
- PR reviews: Add to "PRs & Reviews" immediately
- Blockers: Note them in real-time

### End of Day
1. Fill in "What I Did Today"
2. Update "What I Learned"
3. Create "Action Items for Tomorrow"
4. Fill standup summary (if needed for tomorrow)

### Weekly Review
1. Create weekly summary (use Periodic Notes or Claude)
2. Review all daily logs from the week
3. Extract key learnings → Move to `01-Learning/`
4. Archive completed items → Move to `04-Archive/`

---

## Git Integration (Advanced)

Auto-populate from Git activity:

```bash
# Get today's commits
git log --since="midnight" --author="Fellipe Marcel" --oneline

# Get PRs (requires gh CLI)
gh pr list --author "@me" --state all --json title,number,createdAt

# Add to daily log automatically
```

---

## GitHub Integration (Advanced)

Use GitHub CLI to pull activity:

```bash
# Today's PR reviews
gh pr list --review-requested=@me

# PRs you opened today
gh pr list --author=@me --state=all --json createdAt,title

# Issues assigned to you
gh issue list --assignee=@me --state=open
```

Create script to inject this into daily log template.

---

## Next Steps

1. **Start Simple**: Use Obsidian Daily Notes (Option 1)
2. **Enhance**: Add Templater when comfortable (Option 2)
3. **Automate**: Use Claude Code for intelligent filling (Option 5)
4. **Advanced**: Add Git/GitHub integration when needed

---

## Related Notes

- [[Daily Work Log Template]]
- [[CLAUDE.md]] - Workflow documentation
- [[Professional Growth Plan]] - Weekly review integration

---

## TODO

- [ ] Set up Obsidian Daily Notes plugin
- [ ] Configure keyboard shortcut
- [ ] Create first daily log
- [ ] Test Claude Code integration
- [ ] Set up weekly review reminder
