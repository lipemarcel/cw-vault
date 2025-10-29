# Daily Log Automation

Simple automation for your daily work logs.

## Current Setup (Recommended)

### What's Automated:
1. **GitHub Activity Section** - Automatically populated by scripts
   - PRs opened, reviewed, merged
   - Commits pushed
   - Filtered by date

2. **Manual Sections** - Filled by Claude Code (this assistant!)
   - Today's Focus
   - Code & Features (detailed)
   - What I Learned
   - Action Items
   - Standup Summary
   - Time Tracking

### Daily Workflow:

**End of Day (6 PM BRT):**
- GitHub Actions runs automatically
- Creates daily log with GitHub Activity section

**Next Morning (or whenever):**
```
You: "Fill in today's daily log"
Claude Code: [Analyzes GitHub activity and fills all sections]
```

That's it! No scripts, no API keys, just ask me.

## How It Works

### Step 1: Automated (GitHub Actions)
```bash
# Runs daily at 6 PM BRT
./scripts/populate-daily-log.sh
```
- Creates/updates `02-Work/Daily-Logs/YYYY-MM-DD.md`
- Adds GitHub Activity section with PRs and commits

### Step 2: Ask Claude Code
Just say:
- "Fill in today's daily log"
- "Populate my daily log with details"
- "Complete the daily log for 2025-10-28"

I'll:
1. Read the GitHub Activity section
2. Fetch PR details if needed
3. Generate detailed summaries
4. Fill in all manual sections

## Commands You Can Use

### Fill Today's Log
```
"Fill in today's daily log"
```

### Fill Specific Date
```
"Fill in the daily log for 2025-10-28"
```

### Fill Multiple Days
```
"Fill in daily logs for October 28-29"
```

### Weekly Summary
```
"Summarize this week's daily logs"
```

## Manual Scripts (Optional)

If you want to run the automation manually:

```bash
# Populate today
./scripts/populate-daily-log.sh

# Populate specific date
./scripts/populate-daily-log-date.sh 2025-10-28

# Then ask me to fill in the details
```

## Why This Approach?

**Pros:**
- ✅ No API keys or configuration needed
- ✅ You're already using Claude Code
- ✅ I can see your entire codebase for context
- ✅ Fully automated GitHub Activity
- ✅ Intelligent, context-aware summaries
- ✅ Can ask me questions while I fill it in

**Cons:**
- ❌ Requires you to ask (not 100% automated)
- ❌ Need to have Claude Code open

## Example Interaction

```
You: "Fill in today's daily log"

Me:
- Reads 02-Work/Daily-Logs/2025-10-29.md
- Sees PR #3786 was merged (React Query refactoring)
- Sees PR #800 was merged (design system update)
- Fetches PR details
- Generates detailed summaries
- Updates the file
- Commits the changes

You: "Thanks!"
```

## Tips

1. **Ask at the end of each day** for most accurate summaries
2. **Review before committing** - I might miss context you know
3. **Add personal notes** - I can't know your thoughts/feelings
4. **Weekly reviews** - Ask me to summarize your week

## Future Enhancement

If you want 100% automation (no asking required):
- Set up GitHub Actions to call Claude API
- Requires Anthropic API key and workflow changes
- Let me know if you want this!

## Troubleshooting

**I filled it incorrectly:**
- Just tell me: "That's not quite right, the focus was actually..."
- I'll update it

**Missing information:**
- I work from GitHub data and PR descriptions
- Add more details to your PRs for better summaries

**Want different format:**
- Tell me: "Use more bullet points" or "Be more concise"
- I'll adjust my style
