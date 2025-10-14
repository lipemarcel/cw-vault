#!/bin/bash

# Test script for daily log creation
# This simulates what the GitHub Action does

set -e

echo "🧪 Testing Daily Log Creation..."
echo ""

# Get dates
TODAY=$(date +'%Y-%m-%d')
DAY_NAME=$(date +'%A')
YESTERDAY=$(date -d '1 day ago' +'%Y-%m-%d' 2>/dev/null || date -v-1d +'%Y-%m-%d')

echo "📅 Today: $TODAY ($DAY_NAME)"
echo "📅 Yesterday: $YESTERDAY"
echo ""

# Test file path
TEST_FILE="02-Work/Daily-Logs/test-$TODAY.md"

# Check if template exists
if [ ! -f "05-Resources/Templates/Daily Work Log Template.md" ]; then
    echo "❌ Template not found!"
    exit 1
fi

echo "✅ Template found"
echo ""

# Create test log
echo "📝 Creating test daily log..."

cat "05-Resources/Templates/Daily Work Log Template.md" | \
    sed "s/{{date}}/$TODAY/g" | \
    sed "s/# Daily Work Log - {{date}}/# Daily Work Log - $TODAY ($DAY_NAME)/g" | \
    sed "s/created: {{date}}/created: $TODAY/g" \
    > "$TEST_FILE"

# Check if yesterday's log exists and update link
if [ -f "02-Work/Daily-Logs/$YESTERDAY.md" ]; then
    sed -i.bak "s|**Yesterday**: N/A (First daily log)|**Yesterday**: See [[$YESTERDAY]]|g" "$TEST_FILE"
    rm "${TEST_FILE}.bak" 2>/dev/null || true
    echo "✅ Linked to yesterday's log"
fi

echo "✅ Test log created: $TEST_FILE"
echo ""

# Show preview
echo "📄 Preview (first 30 lines):"
echo "---"
head -n 30 "$TEST_FILE"
echo "---"
echo ""

echo "✅ Test completed successfully!"
echo ""
echo "To clean up: rm $TEST_FILE"
