# GitHub Automation

This directory contains GitHub Actions workflows and scripts for automating vault tasks.

## Workflows

### Create Daily Work Log (`workflows/create-daily-log.yml`)

Automatically creates a daily work log every weekday morning.

**Schedule**: Monday-Friday at 8:00 AM UTC (5:00 AM BRT)

**What it does**:
1. Checks if today's log already exists
2. Creates log from template if needed
3. Replaces template variables with today's date
4. Links to yesterday's log if it exists
5. Commits and pushes automatically

**Manual Trigger**:
1. Go to GitHub repo → **Actions** tab
2. Select **"Create Daily Work Log"** workflow
3. Click **"Run workflow"** button
4. Click **"Run workflow"** again to confirm

**Features**:
- ✅ Fully automated - runs every weekday
- ✅ Prevents duplicate creation
- ✅ Links to previous day's log
- ✅ Works even when computer is off
- ✅ Can be manually triggered anytime

## Scripts

### Test Daily Log Creation (`scripts/test-daily-log-creation.sh`)

Test the daily log creation logic locally before pushing.

**Usage**:
```bash
cd ~/Documents/cw-vault
.github/scripts/test-daily-log-creation.sh
```

**What it does**:
- Creates a test daily log
- Shows preview of generated file
- Validates template and date replacement
- Cleans up test file automatically

## Configuration

### Change Schedule

Edit `.github/workflows/create-daily-log.yml`:

```yaml
# Run at different time
- cron: '0 6 * * 1-5'  # 6 AM UTC

# Include weekends
- cron: '0 8 * * *'    # Every day

# Different days (e.g., Mon, Wed, Fri only)
- cron: '0 8 * * 1,3,5'
```

### Time Zone Reference

- 8:00 AM UTC = 5:00 AM BRT (Brazil)
- 8:00 AM UTC = 3:00 AM EST (US East)
- 8:00 AM UTC = 12:00 AM PST (US West)

To adjust for your timezone, use [Crontab Guru](https://crontab.guru/).

## Troubleshooting

### Workflow not running

1. Check that GitHub Actions is enabled:
   - Go to repo Settings → Actions → General
   - Ensure "Allow all actions" is selected

2. Check workflow permissions:
   - Settings → Actions → General → Workflow permissions
   - Select "Read and write permissions"

3. Manual trigger still works:
   - Go to Actions tab
   - Select workflow
   - Click "Run workflow"

### Daily log not created

1. Check workflow run logs:
   - Go to Actions tab
   - Click on the failed run
   - Review logs for errors

2. Verify template exists:
   - Ensure `05-Resources/Templates/Daily Work Log Template.md` exists
   - Template must contain `{{date}}` placeholder

3. Test locally:
   ```bash
   .github/scripts/test-daily-log-creation.sh
   ```

### Duplicate logs created

The workflow checks for existing logs and skips creation if one exists. If you see duplicates:
- Check the workflow logs
- Ensure only one instance is running
- Manually delete duplicates

## Future Enhancements

Potential improvements to consider:

- [ ] Auto-populate from GitHub PR activity
- [ ] Auto-populate from Git commit history
- [ ] Weekly summary generation
- [ ] Automatic archival of old logs (30+ days)
- [ ] Slack/Discord notifications when log is created
- [ ] Pre-fill "Today's Focus" based on calendar events

## Related Documentation

- [Daily Work Log - Automation Guide](../05-Resources/Daily%20Work%20Log%20-%20Automation%20Guide.md)
- [Daily Work Log Template](../05-Resources/Templates/Daily%20Work%20Log%20Template.md)
- [CLAUDE.md](../CLAUDE.md) - Workflow documentation
