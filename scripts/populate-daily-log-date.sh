#!/bin/bash

# Populate Daily Log with GitHub Activity for a Specific Date
# Usage: ./populate-daily-log-date.sh [YYYY-MM-DD]
# If no date provided, uses today

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Get date from argument or use today
if [ -n "$1" ]; then
  TODAY="$1"
  # Validate date format
  if ! date -j -f "%Y-%m-%d" "$TODAY" "+%Y-%m-%d" &>/dev/null; then
    echo -e "${RED}❌ Error: Invalid date format. Use YYYY-MM-DD${NC}"
    exit 1
  fi
  DAY_NAME=$(date -j -f "%Y-%m-%d" "$TODAY" "+%A" 2>/dev/null)
else
  TODAY=$(date +'%Y-%m-%d')
  DAY_NAME=$(date +'%A')
fi

echo -e "${BLUE}🤖 Populating Daily Log with GitHub Activity for ${TODAY}${NC}\n"

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

# Create temporary file for activity
ACTIVITY_FILE=$(mktemp)

echo -e "${BLUE}📊 Fetching GitHub activity for ${TODAY}...${NC}\n"

# Initialize activity content
cat > "${ACTIVITY_FILE}" <<EOF

---

## 📊 GitHub Activity (Auto-Generated for ${TODAY})

EOF

FOUND_ACTIVITY=false

# Function to add section header
add_section() {
  echo "" >> "${ACTIVITY_FILE}"
  echo "### $1" >> "${ACTIVITY_FILE}"
}

# Fetch PRs created on the specified date
add_section "🚀 PRs Opened"
for REPO in "${REPOS[@]}"; do
  echo -e "${BLUE}  Checking PRs opened in ${REPO}...${NC}"

  PRS=$(gh pr list --repo "${ORG}/${REPO}" \
    --author @me \
    --search "created:${TODAY}" \
    --json number,title,url,state \
    --jq '.[] | "- **PR #\(.number)**: \(.title) (\(.state)) - [View PR](\(.url))"' 2>/dev/null || echo "")

  if [ -n "$PRS" ]; then
    echo "**${REPO}**:" >> "${ACTIVITY_FILE}"
    echo "$PRS" >> "${ACTIVITY_FILE}"
    echo "" >> "${ACTIVITY_FILE}"
    FOUND_ACTIVITY=true
    echo -e "${GREEN}  ✓ Found PRs${NC}"
  fi
done

# Fetch PR reviews done on the specified date
add_section "👀 PRs Reviewed"
for REPO in "${REPOS[@]}"; do
  echo -e "${BLUE}  Checking PR reviews in ${REPO}...${NC}"

  # Get PRs where you left reviews using search (limited by date range)
  REVIEWS=$(gh search prs --repo "${ORG}/${REPO}" \
    --reviewed-by @me \
    --json number,title,url \
    --limit 50 2>/dev/null | \
    jq -r --arg today "${TODAY}" '.[] | "- **PR #\(.number)**: \(.title) - [View PR](\(.url))"' 2>/dev/null || echo "")

  if [ -n "$REVIEWS" ]; then
    echo "**${REPO}**:" >> "${ACTIVITY_FILE}"
    echo "$REVIEWS" >> "${ACTIVITY_FILE}"
    echo "" >> "${ACTIVITY_FILE}"
    FOUND_ACTIVITY=true
    echo -e "${GREEN}  ✓ Found reviews${NC}"
  fi
done

# Fetch PRs merged on the specified date
add_section "✅ PRs Merged"
for REPO in "${REPOS[@]}"; do
  echo -e "${BLUE}  Checking merged PRs in ${REPO}...${NC}"

  MERGED=$(gh pr list --repo "${ORG}/${REPO}" \
    --author @me \
    --state merged \
    --search "merged:${TODAY}" \
    --json number,title,url \
    --jq '.[] | "- **PR #\(.number)**: \(.title) - [View PR](\(.url))"' 2>/dev/null || echo "")

  if [ -n "$MERGED" ]; then
    echo "**${REPO}**:" >> "${ACTIVITY_FILE}"
    echo "$MERGED" >> "${ACTIVITY_FILE}"
    echo "" >> "${ACTIVITY_FILE}"
    FOUND_ACTIVITY=true
    echo -e "${GREEN}  ✓ Found merged PRs${NC}"
  fi
done

# Fetch commits pushed on the specified date
add_section "📝 Commits"
for REPO in "${REPOS[@]}"; do
  echo -e "${BLUE}  Checking commits in ${REPO}...${NC}"

  COMMITS=$(gh api repos/${ORG}/${REPO}/commits \
    --jq '.[] | select(.commit.author.date | startswith("'${TODAY}'")) | select(.author.login == "lipemarcel") | "- `\(.sha[0:7])` - \(.commit.message | split("\n")[0])"' 2>/dev/null | head -10 || echo "")

  if [ -n "$COMMITS" ]; then
    echo "**${REPO}**:" >> "${ACTIVITY_FILE}"
    echo "$COMMITS" >> "${ACTIVITY_FILE}"
    echo "" >> "${ACTIVITY_FILE}"
    FOUND_ACTIVITY=true
    echo -e "${GREEN}  ✓ Found commits${NC}"
  fi
done

echo ""

# Check if we found any activity
if [ "$FOUND_ACTIVITY" = false ]; then
  echo -e "${YELLOW}ℹ️  No GitHub activity found for ${TODAY}${NC}"
  echo -e "${YELLOW}   This could mean:${NC}"
  echo -e "${YELLOW}   - No code was pushed on this date${NC}"
  echo -e "${YELLOW}   - No PRs were created or reviewed${NC}"
  echo -e "${YELLOW}   - It was a weekend or holiday${NC}"
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

🤖 Generated by populate-daily-log-date.sh"

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
