---
created: 2025-10-22
tags: [doc, git, troubleshooting, workflow]
status: reference
---

# Git Workflow and Troubleshooting Guide

**Purpose**: Complete guide for managing Git workflows, resolving conflicts, and troubleshooting common issues in this Obsidian vault.

---

## Overview

This vault uses GitHub for version control with automated workflows (GitHub Actions) that create commits daily. This can lead to sync conflicts when working locally. This guide provides strategies to avoid and resolve these issues.

---

## Daily Git Workflow

### Morning Routine (Before Starting Work)

**Always start by syncing with remote:**

```bash
# 1. Check current status
git status

# 2. Pull latest changes from remote
git pull origin main

# 3. If there are conflicts, see "Resolving Conflicts" section below
```

**Alternative: Pull with rebase (cleaner history)**

```bash
# Pull and rebase local commits on top of remote
git pull --rebase origin main
```

### During Work (Making Changes)

**Check what changed:**

```bash
# See all modified files
git status

# See detailed changes
git diff

# See changes for a specific file
git diff 02-Work/Daily-Logs/2025-10-22.md
```

**Stage and commit changes:**

```bash
# Stage specific files
git add 02-Work/Daily-Logs/2025-10-22.md
git add 00-Inbox/New-Learning-Note.md

# Or stage all changes
git add -A

# Commit with descriptive message
git commit -m "Update daily log for 2025-10-22 with PR reviews"

# Or commit with multi-line message
git commit -m "Update daily log and add learning notes

- Added PR review notes for cnp#760
- Created new learning note on TypeScript patterns
- Updated quarterly tracker with achievements"
```

### End of Day (Pushing Changes)

**Push to remote:**

```bash
# 1. Check status
git status

# 2. Pull latest changes first (in case Actions ran)
git pull origin main

# 3. Resolve any conflicts if needed

# 4. Push your changes
git push origin main
```

---

## Understanding Sync Conflicts

### Why Conflicts Happen

**Common scenarios in this vault:**

1. **GitHub Actions creates a commit** (daily logs, learning notes, inbox processing)
2. **You make local changes** at the same time
3. **Both modify the same file** (e.g., both edit today's daily log)
4. **Git can't auto-merge** → Conflict!

### Branch Divergence

When you see:
```
Your branch and 'origin/main' have diverged,
and have 1 and 3 different commits each, respectively.
```

This means:
- **Local branch**: Has 1 commit remote doesn't have
- **Remote branch**: Has 3 commits local doesn't have
- **Solution**: Merge or rebase to reconcile

---

## Resolving Merge Conflicts

### Step-by-Step Guide

#### 1. Identify the Conflict

```bash
git status
```

Output will show:
```
Unmerged paths:
  (use "git add <file>..." to mark resolution)
	both modified:   02-Work/Daily-Logs/2025-10-22.md
```

#### 2. Open the Conflicted File

Look for conflict markers:

```markdown
<<<<<<< HEAD
Your local changes
=======
Remote changes from GitHub
>>>>>>> commit-hash
```

**Understanding the markers:**
- `<<<<<<< HEAD` - Start of your local changes
- `=======` - Separator between versions
- `>>>>>>> commit-hash` - End of remote changes

#### 3. Resolve the Conflict

**Option A: Keep both versions (recommended for daily logs)**

Manually merge the content by combining both sections:

```markdown
# Before (with conflict):
<<<<<<< HEAD
- Worked on PR #760
- Fixed bug in payment flow
=======
- Created daily log template
>>>>>>> abc123

# After (resolved):
- Worked on PR #760
- Fixed bug in payment flow
- Created daily log template
```

**Option B: Keep only local version**

Delete the remote section and conflict markers:

```markdown
# Keep only local changes
- Worked on PR #760
- Fixed bug in payment flow
```

**Option C: Keep only remote version**

Delete your local section and conflict markers:

```markdown
# Keep only remote changes
- Created daily log template
```

**Option D: Ask Claude for Help**

Say: "Help me resolve the merge conflict in [file]"

Claude will:
1. Read the conflicted file
2. Analyze both versions
3. Intelligently merge content
4. Preserve all valuable information

#### 4. Mark as Resolved

```bash
# After editing the file and removing all conflict markers:

# Stage the resolved file
git add 02-Work/Daily-Logs/2025-10-22.md

# Check status
git status

# Should show "Changes to be committed" instead of "Unmerged paths"
```

#### 5. Complete the Merge

```bash
# Commit the merge
git commit -m "Merge remote changes and resolve conflict in daily log"

# Push to remote
git push origin main
```

---

## Claude Code Integration for Git

### Ask Claude to Help with Git Tasks

**Resolving conflicts:**
```
"Help me resolve this merge conflict"
"I have a conflict in 2025-10-22.md, can you merge both versions?"
"Check the git status and help me fix the conflicts"
```

**Before committing:**
```
"What files have I changed today?"
"Show me the diff for my daily log"
"Review my changes before I commit"
```

**Writing commit messages:**
```
"Generate a commit message for these changes"
"Help me write a descriptive commit message"
```

**Pushing changes:**
```
"Help me commit and push my changes"
"Check if I need to pull before pushing"
"Help me sync with the remote repository"
```

### What Claude Can Do

✅ **Claude can:**
- Read conflicted files and resolve conflicts intelligently
- Stage files with `git add`
- Create commits with descriptive messages
- Push changes to remote
- Check git status and analyze issues
- Explain what conflicts mean
- Suggest best resolution strategy

❌ **Claude will ask first before:**
- Force pushing (`git push --force`)
- Destructive operations (hard reset)
- Modifying git config
- Changing branch structure

---

## Automation Conflicts Prevention

### Best Practices to Avoid Conflicts

**1. Pull before starting work each day**

```bash
# Every morning before opening Obsidian:
cd ~/Documents/cw-vault
git pull origin main
```

**2. Understand automation schedule**

- **Daily logs**: Created at 8 AM UTC (5 AM BRT) on weekdays
- **Learning notes**: Created at 9 AM UTC (6 AM BRT) daily
- **Inbox processing**: Friday at 7 PM UTC (4 PM BRT)

**Strategy**: Work outside these times or pull immediately after.

**3. Pull before pushing**

```bash
# Always pull first
git pull origin main

# Then push
git push origin main
```

**4. Commit frequently**

Small, frequent commits are easier to merge than large changes:

```bash
# Instead of one big commit at end of day:
git commit -m "Update morning tasks"      # 10 AM
git commit -m "Add PR review notes"       # 2 PM
git commit -m "Document blockers"         # 4 PM
git commit -m "Fill end-of-day summary"   # 6 PM
```

**5. Use descriptive filenames**

Avoid editing files that automation creates:
- ✅ Create `Bug-Investigation-Payment-Flow.md` in `02-Work/`
- ❌ Don't manually edit `2025-10-22.md` at the same time Actions runs

---

## Common Git Issues and Solutions

### Issue 1: "Your branch is behind 'origin/main'"

**What it means**: Remote has changes you don't have locally.

**Solution:**
```bash
git pull origin main
```

---

### Issue 2: "Your branch is ahead of 'origin/main'"

**What it means**: You have local commits not pushed to remote.

**Solution:**
```bash
git push origin main
```

---

### Issue 3: "Your branch and 'origin/main' have diverged"

**What it means**: Both local and remote have different commits.

**Solution:**
```bash
# Option A: Merge (preserves both histories)
git pull origin main
# Resolve conflicts if any
git push origin main

# Option B: Rebase (cleaner history)
git pull --rebase origin main
# Resolve conflicts if any
git push origin main
```

---

### Issue 4: "Merge conflict in [file]"

**What it means**: Git can't automatically merge changes.

**Solution**: See "Resolving Merge Conflicts" section above, or ask Claude:
```
"Help me resolve the merge conflict in [file]"
```

---

### Issue 5: "refusing to merge unrelated histories"

**What it means**: Local and remote repos have no common ancestor.

**Solution:**
```bash
# Allow merging unrelated histories (rare, be careful)
git pull origin main --allow-unrelated-histories

# Better: Start fresh if this is initial setup
git clone <remote-url>
```

---

### Issue 6: Accidentally committed wrong files

**Solution:**
```bash
# If haven't pushed yet:
git reset --soft HEAD~1   # Undo last commit, keep changes
git reset HEAD <file>     # Unstage specific file
git commit -m "Correct commit message"

# If already pushed (be careful):
# Ask Claude: "I pushed the wrong files, how do I fix it?"
```

---

### Issue 7: Need to undo last commit

**Solution:**
```bash
# Undo last commit but keep changes
git reset --soft HEAD~1

# Undo last commit and discard changes (dangerous!)
git reset --hard HEAD~1

# Undo last commit and create new commit (safe for pushed commits)
git revert HEAD
```

---

### Issue 8: Forgot to pull before making changes

**What happened**: You made local changes, now can't push because remote has changes.

**Solution:**
```bash
# 1. Commit your local changes first
git add -A
git commit -m "My local changes"

# 2. Pull with rebase to put your changes on top
git pull --rebase origin main

# 3. Resolve any conflicts

# 4. Push
git push origin main
```

---

## Git Commands Cheat Sheet

### Status and Information
```bash
git status                    # Check current state
git log                       # View commit history
git log --oneline            # Compact commit history
git log --graph --oneline    # Visual branch history
git diff                      # See unstaged changes
git diff --staged            # See staged changes
git show HEAD                # See last commit
```

### Staging and Committing
```bash
git add <file>               # Stage specific file
git add -A                   # Stage all changes
git add .                    # Stage all in current directory
git reset HEAD <file>        # Unstage file
git commit -m "message"      # Commit with message
git commit --amend           # Modify last commit
```

### Syncing with Remote
```bash
git pull origin main         # Fetch and merge from remote
git pull --rebase origin main # Fetch and rebase
git push origin main         # Push to remote
git fetch origin             # Fetch without merging
git remote -v                # Show remote URLs
```

### Branches
```bash
git branch                   # List local branches
git branch -a                # List all branches
git checkout -b <name>       # Create and switch to branch
git checkout <name>          # Switch to branch
git merge <branch>           # Merge branch into current
```

### Undoing Changes
```bash
git checkout -- <file>       # Discard local changes to file
git reset --soft HEAD~1      # Undo last commit, keep changes
git reset --hard HEAD~1      # Undo last commit, discard changes
git revert HEAD              # Create new commit that undoes last
git clean -fd                # Remove untracked files (careful!)
```

---

## Advanced Workflows

### Working with Multiple Devices

If you edit the vault on multiple computers:

**Computer A (morning):**
```bash
git pull origin main        # Get latest
# ... make changes ...
git add -A
git commit -m "Morning updates"
git push origin main
```

**Computer B (afternoon):**
```bash
git pull origin main        # Get morning changes from Computer A
# ... make changes ...
git add -A
git commit -m "Afternoon updates"
git push origin main
```

**Computer A (evening):**
```bash
git pull origin main        # Get afternoon changes from Computer B
# ... continue working ...
```

---

### Using Branches (Optional)

For major changes or experiments:

```bash
# Create feature branch
git checkout -b feature/new-workflow

# Make changes
# ... edit files ...

# Commit to feature branch
git add -A
git commit -m "Implement new workflow"

# Switch back to main
git checkout main

# Merge feature into main
git merge feature/new-workflow

# Delete feature branch
git branch -d feature/new-workflow

# Push to remote
git push origin main
```

---

## GitHub Actions Specific Issues

### Conflict with Automated Daily Logs

**Scenario**: GitHub Actions created today's log, but you also created it manually.

**Solution**:
```bash
git pull origin main
# Conflict in 02-Work/Daily-Logs/2025-10-22.md

# Open file, merge content from both versions
# Remove conflict markers
git add 02-Work/Daily-Logs/2025-10-22.md
git commit -m "Merge automated and manual daily log"
git push origin main
```

**Prevention**: Let GitHub Actions create the file, then edit it.

---

### Conflict with Inbox Processing

**Scenario**: You moved a note from inbox manually, but Actions also tried to move it.

**Solution**:
```bash
# Pull to see the conflict
git pull origin main

# If file was moved to same location - keep one version
# If moved to different locations - decide which is correct

git add <conflicted-file>
git commit -m "Resolve inbox processing conflict"
git push origin main
```

**Prevention**: Process inbox manually before Friday 4 PM BRT, or let automation handle it entirely.

---

## Emergency Recovery

### "Everything is broken, help!"

**Scenario**: Conflicts everywhere, not sure what happened.

**Nuclear option (start fresh with remote state):**

```bash
# ⚠️ WARNING: This will discard ALL local uncommitted changes!

# 1. Backup your local changes first
cp -r ~/Documents/cw-vault ~/Documents/cw-vault-backup

# 2. Reset to remote state
git fetch origin
git reset --hard origin/main

# 3. Verify
git status  # Should say "nothing to commit, working tree clean"

# 4. If needed, manually copy back specific changes from backup
```

**Better approach: Ask Claude first:**
```
"My git state is messed up, can you help me understand what happened?"
```

---

## Best Practices Summary

### ✅ Do:
- Pull before starting work each day
- Commit frequently with descriptive messages
- Pull before pushing
- Ask Claude for help with conflicts
- Check `git status` before major operations
- Keep commits focused and atomic
- Write clear commit messages

### ❌ Don't:
- Use `git push --force` unless absolutely necessary
- Commit large binary files (images, PDFs)
- Edit files during automation windows
- Ignore merge conflicts (resolve immediately)
- Make multiple unrelated changes in one commit
- Forget to pull for multiple days

---

## Getting Help

### Ask Claude Code:
```
"Help me with git [specific issue]"
"Explain this git error: [error message]"
"What's the best way to [git operation]?"
"Review my git status and suggest next steps"
```

### Resources:
- [Git Documentation](https://git-scm.com/doc)
- [GitHub Docs](https://docs.github.com/)
- [Pro Git Book](https://git-scm.com/book/en/v2)
- [Oh Shit, Git!?!](https://ohshitgit.com/) - Common problems and solutions

---

## Quick Reference Card

**Daily workflow:**
```bash
# Morning
git pull origin main

# During work
git status                           # Check changes
git add <file>                       # Stage files
git commit -m "Descriptive message"  # Commit

# End of day
git pull origin main                 # Sync first
git push origin main                 # Push changes
```

**Resolve conflicts:**
```bash
git status                           # Find conflicted files
# Edit files, remove conflict markers
git add <resolved-file>              # Mark as resolved
git commit -m "Resolve conflicts"    # Complete merge
git push origin main                 # Push
```

**Undo mistakes:**
```bash
git reset --soft HEAD~1              # Undo last commit
git checkout -- <file>               # Discard file changes
git clean -fd                        # Remove untracked files
```

---

## Related Notes

- [[Daily Work Log - Automation Guide]] - Automation that creates commits
- [[CLAUDE.md]] - Vault configuration and workflows
- [[README.md]] - Vault overview

---

**Last Updated**: 2025-10-22

---

💡 **Tip**: Bookmark this guide and refer to it whenever you encounter Git issues. Most problems have simple solutions!

