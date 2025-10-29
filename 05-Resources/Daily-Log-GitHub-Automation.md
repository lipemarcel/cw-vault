---
created: 2025-10-29
tags: [doc, automation, work]
type: guide
---

# Daily Log GitHub Activity Automation

Automatically populate your daily work logs with GitHub activity (PRs, reviews, commits) from your Cloudwalk repositories.

## Overview

This automation fetches your GitHub activity and adds it to your daily log, including:
- **PRs Opened**: Pull requests you created today
- **PRs Reviewed**: Pull requests you reviewed today
- **PRs Merged**: Your pull requests that were merged today
- **Commits**: Commits you pushed today

### Monitored Repositories

- `cloudwalk/infinitepay-cnp-monorepo`
- `cloudwalk/infinitepay-dashboard-js`
- `cloudwalk/infinitepay-ds-web`
- `cloudwalk/infinitepay-receipt-js`

---

## Automation Methods

### Method 1: GitHub Actions (Recommended for End-of-Day)

**Schedule**: Runs automatically at 6:00 PM BRT (9:00 PM UTC) every weekday

**Workflow**: [`.github/workflows/populate-daily-log.yml`](../../.github/workflows/populate-daily-log.yml)

#### How It Works

1. **Triggers automatically** at end of workday (6 PM BRT)
2. **Creates daily log** if it doesn't exist
3. **Fetches GitHub activity** from all work repositories
4. **Updates the log** by inserting activity before "What I Learned" section
5. **Commits and pushes** changes automatically

#### Manual Trigger

You can also trigger the workflow manually:

1. Go to [GitHub Actions](https://github.com/lipemarcel/cw-vault/actions)
2. Select "Populate Daily Log with GitHub Activity"
3. Click "Run workflow"
4. Choose branch (usually `main`)
5. Click "Run workflow"

#### Permissions Required

The workflow uses `GITHUB_TOKEN` with `contents: write` permission (already configured).

---

### Method 2: Local Script (Recommended for On-Demand)

**Script**: [`scripts/populate-daily-log.sh`](../../scripts/populate-daily-log.sh)

#### Prerequisites

1. **GitHub CLI** installed:
   ```bash
   brew install gh
   ```

2. **Authenticate with GitHub**:
   ```bash
   gh auth login
   ```

#### Usage

**Run from vault root**:
```bash
./scripts/populate-daily-log.sh
```

**What it does**:
1. ✅ Checks if daily log exists (creates if needed)
2. 📊 Fetches GitHub activity for today
3. ✍️ Updates the daily log file
4. 💬 Asks if you want to commit
5. 🚀 Optionally pushes to remote

#### Example Output

```
🤖 Populating Daily Log with GitHub Activity

📊 Fetching GitHub activity for 2025-10-29...

  Checking PRs opened in infinitepay-cnp-monorepo...
  ✓ Found PRs
  Checking PR reviews in infinitepay-dashboard-js...
  ✓ Found reviews
  Checking commits in infinitepay-cnp-monorepo...
  ✓ Found commits

✅ Successfully updated daily log with GitHub activity!
📄 File: 02-Work/Daily-Logs/2025-10-29.md

Would you like to commit these changes? (y/n)
```

---

## Daily Log Format

The automation inserts a new section into your daily log:

```markdown
---

## 📊 GitHub Activity (Auto-Generated)

### 🚀 PRs Opened
**infinitepay-cnp-monorepo**:
- **PR #735**: Add wallet USD support (OPEN) - [View PR](https://github.com/...)

### 👀 PRs Reviewed
**infinitepay-dashboard-js**:
- **PR #421**: Fix transaction filter (APPROVED) - [View PR](https://github.com/...)

### ✅ PRs Merged
**infinitepay-cnp-monorepo**:
- **PR #730**: Implement PIX refund flow - [View PR](https://github.com/...)

### 📝 Commits
**infinitepay-cnp-monorepo**:
- `a3f5b21` - Fix wallet balance calculation
- `d7e9c42` - Add tests for USD conversion

---
```

The activity section is inserted **before** the "What I Learned" section.

---

## Workflow Integration

### Daily Routine

#### Morning
1. **Automated log creation** (8 AM BRT via `create-daily-log.yml`)
2. Pull latest changes: `git pull origin main`
3. Set today's focus and goals

#### During Day
- Work on features, PRs, reviews as usual
- No manual tracking needed

#### End of Day
1. **Automated activity population** (6 PM BRT via `populate-daily-log.yml`)
2. OR run manually: `./scripts/populate-daily-log.sh`
3. Review generated content
4. Fill in manual sections:
   - What I Learned
   - Blockers & Challenges
   - Ideas & Notes
   - Action Items for Tomorrow

---

## Customization

### Adding More Repositories

Edit the workflow or script to include additional repos:

**GitHub Actions** (`.github/workflows/populate-daily-log.yml`):
```yaml
REPOS=(
  "infinitepay-cnp-monorepo"
  "infinitepay-dashboard-js"
  "infinitepay-ds-web"
  "infinitepay-receipt-js"
  "your-new-repo"  # Add here
)
```

**Local Script** (`scripts/populate-daily-log.sh`):
```bash
REPOS=(
  "infinitepay-cnp-monorepo"
  "infinitepay-dashboard-js"
  "infinitepay-ds-web"
  "infinitepay-receipt-js"
  "your-new-repo"  # Add here
)
```

### Changing Schedule

Edit the cron schedule in `.github/workflows/populate-daily-log.yml`:

```yaml
schedule:
  # Current: 6:00 PM BRT (9:00 PM UTC)
  - cron: '0 21 * * 1-5'

  # Examples:
  # 5:00 PM BRT: '0 20 * * 1-5'
  # 7:00 PM BRT: '0 22 * * 1-5'
```

**Cron format**: `minute hour day month weekday`

---

## Troubleshooting

### Issue: "No GitHub activity found"

**Possible causes**:
1. You haven't pushed any code today
2. You haven't created/reviewed PRs today
3. Activity hasn't synced to GitHub yet
4. Date filter is too strict

**Solution**:
- Wait a few minutes and try again
- Check GitHub directly to confirm activity exists
- Run the script manually to see detailed output

---

### Issue: "Activity section already exists"

**Meaning**: The daily log already has a GitHub Activity section

**Solution**:
1. Open the daily log file
2. Manually remove the `## 📊 GitHub Activity` section
3. Run the script/workflow again

**Or**: Keep the existing section and add new activity manually

---

### Issue: "gh: command not found"

**Meaning**: GitHub CLI is not installed

**Solution**:
```bash
brew install gh
gh auth login
```

---

### Issue: Workflow fails with "Not authenticated"

**Meaning**: `GITHUB_TOKEN` doesn't have proper permissions

**Solution**:
1. Check workflow permissions in `.github/workflows/populate-daily-log.yml`
2. Ensure `contents: write` is set
3. Re-run the workflow

---

### Issue: Can't access Cloudwalk repositories

**Meaning**: Your GitHub token doesn't have access to private org repos

**Solution**:
1. For local script: `gh auth refresh -s read:org`
2. For GitHub Actions: Uses built-in `GITHUB_TOKEN` (should work automatically)

---

## Advanced Usage

### Manual Activity Fetch (No File Update)

To just see your activity without updating the log:

```bash
# PRs opened today
gh pr list --repo cloudwalk/infinitepay-cnp-monorepo \
  --author @me \
  --search "created:$(date +'%Y-%m-%d')"

# PRs reviewed today
gh search prs --repo cloudwalk/infinitepay-cnp-monorepo \
  --reviewed-by @me \
  --review-requested @me

# Commits pushed today
gh api repos/cloudwalk/infinitepay-cnp-monorepo/commits \
  --jq '.[] | select(.commit.author.date | startswith("'$(date +'%Y-%m-%d')'"))'
```

---

### Weekly Summary of Activity

To generate a weekly summary:

```bash
# PRs merged this week
gh pr list --repo cloudwalk/infinitepay-cnp-monorepo \
  --author @me \
  --state merged \
  --search "merged:>=$(date -v-7d +'%Y-%m-%d')"
```

---

### Integration with Claude Code

Ask Claude to:

**Populate today's log**:
```
"Run the populate daily log script"
"Update my daily log with GitHub activity"
```

**Check activity without updating**:
```
"Show me my PRs from today"
"What commits did I push today?"
"Show my GitHub activity"
```

**Troubleshoot automation**:
```
"Help me debug the populate daily log workflow"
"Why isn't my daily log being updated?"
"Check the GitHub Actions workflow for errors"
```

---

## Related Documentation

- [[Daily Work Log Template]] - Base template structure
- [[Git Workflow and Troubleshooting Guide]] - Git operations and conflict resolution
- [[CLAUDE.md]] - Full vault documentation
- [GitHub CLI Manual](https://cli.github.com/manual/)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)

---

## Benefits

### Time Savings
- ⏱️ **5-10 minutes saved daily** by not manually tracking PRs and commits
- 📊 **Automatic tracking** of all GitHub activity
- 🎯 **Focus on work** instead of documentation

### Better Documentation
- ✅ **Complete history** of all PRs and commits
- 🔗 **Direct links** to PRs for easy reference
- 📈 **Visible progress** over time

### Improved Standups
- 🗣️ **Quick standup prep** with auto-generated activity
- 📝 **Accurate reporting** of completed work
- 🚀 **Show impact** with concrete PRs and commits

### Performance Reviews
- 📊 **Quantifiable achievements** with PR links
- 📅 **Historical record** of contributions
- 💼 **Evidence of impact** and productivity

---

## Maintenance

### Keeping It Updated

**When adding new repositories**:
1. Update `populate-daily-log.yml` workflow
2. Update `populate-daily-log.sh` script
3. Test with manual run
4. Document in this file

**When changing teams/orgs**:
1. Update `ORG` variable in both workflow and script
2. Update repository list
3. Re-authenticate with `gh auth refresh`

**Periodic review** (quarterly):
- Review automation effectiveness
- Check for API changes in GitHub CLI
- Update documentation with new patterns
- Archive old workflows if needed

---

## Feedback & Improvements

Have ideas for improving this automation? Add them here:

### Future Enhancements
- [ ] Add issue tracking (issues opened/closed)
- [ ] Include PR review comments count
- [ ] Track code review turnaround time
- [ ] Weekly rollup of activity
- [ ] Integration with Jira/Linear tasks
- [ ] Slack notifications for activity summary

---

**Last Updated**: 2025-10-29
**Created By**: Claude Code + Fellipe Marcel
**Status**: ✅ Active and tested
