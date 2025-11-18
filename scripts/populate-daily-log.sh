#!/bin/bash

# Populate Daily Log with GitHub Activity
# This script fetches your GitHub activity (PRs, reviews, commits) and adds it to today's daily log

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}🤖 Populating Daily Log with GitHub Activity${NC}\n"

# Get today's date
TODAY=$(date +'%Y-%m-%d')
DAY_NAME=$(date +'%A')

# Path to daily log
DAILY_LOG="02-Work/Daily-Logs/${TODAY}.md"

# Check if daily log exists
if [ ! -f "${DAILY_LOG}" ]; then
  echo -e "${YELLOW}⚠️  Daily log for ${TODAY} doesn't exist. Creating it...${NC}"
  mkdir -p "02-Work/Daily-Logs"

  # Create from template
  sed "s/{{date}}/${TODAY}/g" "05-Resources/Templates/Daily Work Log Template.md" | \
    sed "s/# Daily Work Log - {{date}}/# Daily Work Log - ${TODAY} (${DAY_NAME})/g" | \
    sed "s/created: {{date}}/created: ${TODAY}/g" \
    > "${DAILY_LOG}"

  echo -e "${GREEN}✅ Created daily log${NC}\n"
fi

# Check if gh CLI is installed
if ! command -v gh &> /dev/null; then
  echo -e "${RED}❌ Error: GitHub CLI (gh) is not installed${NC}"
  echo "Install it with: brew install gh"
  exit 1
fi

# Check if authenticated
if ! gh auth status &> /dev/null; then
  echo -e "${RED}❌ Error: Not authenticated with GitHub${NC}"
  echo "Run: gh auth login"
  exit 1
fi

# Organizations and repositories
ORG="cloudwalk"
REPOS=(
  "infinitepay-cnp-monorepo"
  "infinitepay-dashboard-js"
  "infinitepay-ds-web"
  "infinitepay-receipt-js"
)

# Track which repos have activity for checkbox updates (space-separated list)
REPOS_WITH_ACTIVITY=""

# Create temporary file for activity
ACTIVITY_FILE=$(mktemp)

echo -e "${BLUE}📊 Fetching GitHub activity for ${TODAY}...${NC}\n"

# Initialize activity content
cat > "${ACTIVITY_FILE}" <<EOF

---

## 📊 GitHub Activity (Auto-Generated)

EOF

FOUND_ACTIVITY=false

# Function to add section header
add_section() {
  echo "" >> "${ACTIVITY_FILE}"
  echo "### $1" >> "${ACTIVITY_FILE}"
}

# Fetch PRs created today
PRS_OPENED_CONTENT=""
for REPO in "${REPOS[@]}"; do
  echo -e "${BLUE}  Checking PRs opened in ${REPO}...${NC}"

  PRS=$(gh pr list --repo "${ORG}/${REPO}" \
    --author @me \
    --search "created:${TODAY}" \
    --json number,title,url,state \
    --jq '.[] | "- **PR #\(.number)**: \(.title) (\(.state)) - [View PR](\(.url))"' 2>/dev/null || echo "")

  if [ -n "$PRS" ]; then
    PRS_OPENED_CONTENT="${PRS_OPENED_CONTENT}**${REPO}**:\n${PRS}\n\n"
    FOUND_ACTIVITY=true
    REPOS_WITH_ACTIVITY="${REPOS_WITH_ACTIVITY} ${REPO}"
    echo -e "${GREEN}  ✓ Found PRs${NC}"
  fi
done

if [ -n "$PRS_OPENED_CONTENT" ]; then
  add_section "🚀 PRs Opened"
  echo -e "$PRS_OPENED_CONTENT" >> "${ACTIVITY_FILE}"
fi

# Fetch PR reviews done today
PRS_REVIEWED_CONTENT=""
for REPO in "${REPOS[@]}"; do
  echo -e "${BLUE}  Checking PR reviews in ${REPO}...${NC}"

  # Get recent PRs where you were requested as reviewer or left reviews
  PR_NUMBERS=$(gh search prs --repo "${ORG}/${REPO}" \
    --reviewed-by @me \
    --json number \
    --limit 100 2>/dev/null | jq -r '.[].number' 2>/dev/null || echo "")

  REPO_REVIEWS=""
  for PR_NUM in $PR_NUMBERS; do
    if [ -z "$PR_NUM" ]; then
      continue
    fi

    # Check if any review was submitted today
    REVIEW_ON_DATE=$(gh api "repos/${ORG}/${REPO}/pulls/${PR_NUM}/reviews" 2>/dev/null | \
      jq -r --arg today "${TODAY}" --arg user "lipemarcel" \
      '.[] | select(.user.login == $user) | select(.submitted_at | startswith($today)) | .submitted_at' 2>/dev/null | head -1 || echo "")

    if [ -n "$REVIEW_ON_DATE" ]; then
      # Get PR details
      PR_INFO=$(gh pr view ${PR_NUM} --repo "${ORG}/${REPO}" \
        --json number,title,url \
        --jq '"- **PR #\(.number)**: \(.title) - [View PR](\(.url))"' 2>/dev/null || echo "")

      if [ -n "$PR_INFO" ]; then
        REPO_REVIEWS="${REPO_REVIEWS}${PR_INFO}\n"
      fi
    fi
  done

  if [ -n "$REPO_REVIEWS" ]; then
    PRS_REVIEWED_CONTENT="${PRS_REVIEWED_CONTENT}**${REPO}**:\n${REPO_REVIEWS}\n"
    FOUND_ACTIVITY=true
    REPOS_WITH_ACTIVITY="${REPOS_WITH_ACTIVITY} ${REPO}"
    echo -e "${GREEN}  ✓ Found reviews${NC}"
  fi
done

if [ -n "$PRS_REVIEWED_CONTENT" ]; then
  add_section "👀 PRs Reviewed"
  echo -e "$PRS_REVIEWED_CONTENT" >> "${ACTIVITY_FILE}"
fi

# Fetch PRs merged today
PRS_MERGED_CONTENT=""
for REPO in "${REPOS[@]}"; do
  echo -e "${BLUE}  Checking merged PRs in ${REPO}...${NC}"

  MERGED=$(gh pr list --repo "${ORG}/${REPO}" \
    --author @me \
    --state merged \
    --search "merged:${TODAY}" \
    --json number,title,url \
    --jq '.[] | "- **PR #\(.number)**: \(.title) - [View PR](\(.url))"' 2>/dev/null || echo "")

  if [ -n "$MERGED" ]; then
    PRS_MERGED_CONTENT="${PRS_MERGED_CONTENT}**${REPO}**:\n${MERGED}\n\n"
    FOUND_ACTIVITY=true
    REPOS_WITH_ACTIVITY="${REPOS_WITH_ACTIVITY} ${REPO}"
    echo -e "${GREEN}  ✓ Found merged PRs${NC}"
  fi
done

if [ -n "$PRS_MERGED_CONTENT" ]; then
  add_section "✅ PRs Merged"
  echo -e "$PRS_MERGED_CONTENT" >> "${ACTIVITY_FILE}"
fi

# Fetch commits pushed today
COMMITS_CONTENT=""
for REPO in "${REPOS[@]}"; do
  echo -e "${BLUE}  Checking commits in ${REPO}...${NC}"

  # Fetch commits with better error handling
  COMMITS_RAW=$(gh api repos/${ORG}/${REPO}/commits 2>&1)

  # Check if the response is valid JSON and not an error
  if echo "$COMMITS_RAW" | jq -e '.' >/dev/null 2>&1; then
    # Valid JSON, now filter for today's commits
    COMMITS=$(echo "$COMMITS_RAW" | jq -r --arg today "${TODAY}" \
      '.[] | select(.commit.author.date | startswith($today)) | select(.author.login == "lipemarcel") | "- `\(.sha[0:7])` - \(.commit.message | split("\n")[0])"' 2>/dev/null | head -10 || echo "")

    if [ -n "$COMMITS" ]; then
      COMMITS_CONTENT="${COMMITS_CONTENT}**${REPO}**:\n${COMMITS}\n\n"
      FOUND_ACTIVITY=true
      REPOS_WITH_ACTIVITY="${REPOS_WITH_ACTIVITY} ${REPO}"
      echo -e "${GREEN}  ✓ Found commits${NC}"
    fi
  else
    # API error - skip this repo
    echo -e "${YELLOW}  ⚠ Could not fetch commits (API error)${NC}"
  fi
done

if [ -n "$COMMITS_CONTENT" ]; then
  add_section "📝 Commits"
  echo -e "$COMMITS_CONTENT" >> "${ACTIVITY_FILE}"
fi

echo ""

# Check if we found any activity
if [ "$FOUND_ACTIVITY" = false ]; then
  echo -e "${YELLOW}ℹ️  No GitHub activity found for ${TODAY}${NC}"
  echo -e "${YELLOW}   This could mean:${NC}"
  echo -e "${YELLOW}   - You haven't pushed any code yet today${NC}"
  echo -e "${YELLOW}   - You haven't created or reviewed any PRs${NC}"
  echo -e "${YELLOW}   - Activity hasn't synced yet${NC}"
  rm "${ACTIVITY_FILE}"
  exit 0
fi

# Check if activity section already exists in the log
if grep -q "## 📊 GitHub Activity" "${DAILY_LOG}"; then
  echo -e "${YELLOW}⚠️  Activity section already exists in daily log${NC}"
  echo -e "${YELLOW}   Skipping update to avoid duplicates${NC}"
  echo -e "${BLUE}   To regenerate, manually remove the '## 📊 GitHub Activity' section first${NC}"
  rm "${ACTIVITY_FILE}"
  exit 0
fi

# Insert activity before "## 🧠 What I Learned" section
TEMP_FILE=$(mktemp)

awk '
  /^## 🧠 What I Learned/ {
    # Print activity content
    system("cat '"${ACTIVITY_FILE}"'")
    print ""
  }
  { print }
' "${DAILY_LOG}" > "${TEMP_FILE}"

# Replace original file
mv "${TEMP_FILE}" "${DAILY_LOG}"

# Update repository checkboxes based on activity
echo -e "${BLUE}📋 Updating repository checkboxes...${NC}"
for REPO in "${REPOS[@]}"; do
  # Check if repo is in the space-separated list
  if echo " ${REPOS_WITH_ACTIVITY} " | grep -q " ${REPO} "; then
    # Mark checkbox as checked for repos with activity
    sed -i.bak "s/- \[ \] ${REPO}/- [x] ${REPO}/" "${DAILY_LOG}"
    echo -e "${GREEN}  ✓ Checked ${REPO}${NC}"
  fi
done

# Remove backup file created by sed
rm -f "${DAILY_LOG}.bak"

echo -e "${GREEN}✅ Successfully updated daily log with GitHub activity!${NC}"
echo -e "${BLUE}📄 File: ${DAILY_LOG}${NC}\n"

# Clean up
rm "${ACTIVITY_FILE}"

# Ask if user wants to commit
echo -e "${YELLOW}Would you like to commit these changes? (y/n)${NC}"
read -r response

if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
  git add "${DAILY_LOG}"
  git commit -m "Update daily work log for ${TODAY} with GitHub activity

Automated population with:
- PRs opened, reviewed, and merged
- Commits pushed

🤖 Generated by populate-daily-log.sh"

  echo -e "${GREEN}✅ Changes committed${NC}"

  echo -e "${YELLOW}Would you like to push to remote? (y/n)${NC}"
  read -r push_response

  if [[ "$push_response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    git push
    echo -e "${GREEN}✅ Changes pushed to remote${NC}"
  fi
else
  echo -e "${BLUE}ℹ️  Changes not committed. You can review them with 'git diff'${NC}"
fi

echo -e "\n${GREEN}🎉 Done!${NC}"
