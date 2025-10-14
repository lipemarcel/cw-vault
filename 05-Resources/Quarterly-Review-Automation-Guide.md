---
created: 2025-10-14
tags: [doc, automation, performance-review, guide]
---

# Quarterly Self-Evaluation Automation Guide

**Goal**: Never manually write self-evaluation responses from scratch again.

---

## The Problem

Every quarter (Jan, Apr, Jul, Oct), you need to fill out CloudWalk's self-evaluation form covering:
- **Results** 🥇 - Deliverables, objectives, team contributions
- **Innovation** 💡 - Automation, tools, creative solutions
- **Ownership** ⚖️ - Proactivity, initiative, impact awareness
- **AI Application** 🤖 - AI integration, staying current, proposing solutions

**Manual process is painful**:
- Hard to remember 3 months of work
- Time-consuming to write thoughtful responses
- Risk of forgetting significant achievements
- No historical record for future reviews

---

## The Solution

**Three-part system**:

1. **Continuous Tracking** - Log achievements as they happen
2. **AI-Powered Generation** - Claude Code drafts responses from your logs
3. **Quarterly Workflow** - Streamlined review and submission process

---

## Part 1: Continuous Achievement Tracking

### Weekly Capture (5 minutes every Friday)

Open [[Quarterly-Achievement-Tracker]] and add significant work from the week:

```bash
# Ask Claude Code to help
"Claude, review my daily logs from this week and update my quarterly tracker"
```

**What to capture**:
- ✅ Major features shipped or bugs fixed
- ✅ Process improvements or automation
- ✅ Proactive problem-solving examples
- ✅ New tools/technologies learned or applied
- ❌ Routine tasks (unless they had unusual impact)
- ❌ Minor bug fixes (unless customer-critical)

### Integration with Daily Logs

Your [[Daily Work Log Template|daily logs]] are your source of truth:
- Log work as it happens throughout the day
- Weekly, extract highlights into the quarterly tracker
- Claude Code can automate this extraction

---

## Part 2: AI-Powered Response Generation

### 1-2 Weeks Before Deadline

Create your quarterly evaluation note:

```bash
# Ask Claude Code
"Create my Q4 2025 self-evaluation"
```

Claude will:
1. Create a new note from the [[Quarterly Self-Evaluation Template]]
2. Review your [[Quarterly-Achievement-Tracker]]
3. Review your daily logs from the quarter
4. Draft responses for all four pillars
5. Suggest a rating for each pillar
6. Link supporting evidence

### Review and Refine

1. **Read Claude's drafts** - They're starting points, not final answers
2. **Add personal touch** - Include your voice and perspective
3. **Verify accuracy** - Ensure all claims are factual
4. **Check tone** - Adjust for your preferred style (humble vs. confident)
5. **Add specifics** - Include customer names, PR numbers, metrics if missing

### Example Commands

```bash
# Generate full evaluation
"Generate my Q3 self-evaluation based on my achievement tracker and daily logs"

# Generate specific pillar
"Draft my Innovation pillar response for Q3"

# Improve existing draft
"Make this response more specific with examples and metrics"

# Check for gaps
"What achievements am I missing for the Ownership pillar?"

# Compare to past quarter
"How does my Q3 compare to Q2? What improved?"
```

---

## Part 3: Quarterly Workflow

### Timeline

**Ongoing (Daily/Weekly)**
- Log work in daily logs
- Update achievement tracker weekly
- Link to PRs, issues, meeting notes

**2 Weeks Before Deadline**
- Ask Claude Code to generate evaluation draft
- Review and refine responses
- Identify any missing evidence

**1 Week Before Deadline**
- Final review of all responses
- Get second opinion if needed (peer, manager)
- Polish language and tone

**Day of Deadline**
- Copy responses to Google Form
- Submit before deadline (typically 18:00)
- Archive evaluation to `04-Archive/Performance-Reviews/`

---

## Best Practices

### Do's ✅

- **Track weekly**: Small updates are easier than quarterly catch-up
- **Be specific**: Numbers, names, examples make responses stronger
- **Link evidence**: PRs, issues, docs prove your claims
- **Be honest**: Don't oversell or undersell your work
- **Use Claude iteratively**: Generate → Review → Refine → Regenerate
- **Keep historical record**: Archive past evaluations for reference

### Don'ts ❌

- **Don't wait until last minute**: You'll forget important work
- **Don't copy-paste blindly**: Review and personalize Claude's drafts
- **Don't only capture big wins**: Consistent small improvements matter
- **Don't forget soft skills**: Ownership and collaboration are important
- **Don't exaggerate**: Stick to factual achievements

---

## Template Hierarchy

```
05-Resources/Templates/
  └── Quarterly Self-Evaluation Template.md  (Empty template)

02-Work/
  ├── Quarterly-Achievement-Tracker.md  (Ongoing tracking)
  └── Q4-2025-Self-Evaluation.md  (Generated from template)

04-Archive/Performance-Reviews/
  ├── Q1-2025-Self-Evaluation.md
  ├── Q2-2025-Self-Evaluation.md
  └── Q3-2025-Self-Evaluation.md
```

---

## Example Workflow

### Week 1 of Quarter (Day 1)
```
User: "Set up tracking for Q4 2025"

Claude:
- Creates fresh section in achievement tracker
- Sets up quarterly dates and deadline
- Links to relevant project notes
```

### Week 13 of Quarter (Friday)
```
User: "Update my tracker with this week's work"

Claude:
- Reviews daily logs from the week
- Extracts significant achievements
- Categorizes under appropriate pillars
- Adds links to supporting evidence
```

### 2 Weeks Before Deadline
```
User: "Generate my Q4 self-evaluation"

Claude:
- Creates Q4-2025-Self-Evaluation.md
- Analyzes 3 months of achievements
- Drafts responses for all four pillars
- Suggests ratings and provides justifications
- Links supporting evidence
```

### 1 Day Before Deadline
```
User: "Final review of my evaluation"

Claude:
- Checks all responses are complete
- Verifies supporting links work
- Suggests any improvements
- Confirms deadline and submission checklist
```

### Submission Day
```
User: [Copies responses to Google Form]

User: "Archive my Q4 evaluation"

Claude:
- Moves completed evaluation to 04-Archive/Performance-Reviews/
- Updates status to "submitted"
- Prepares tracker for next quarter (Q1 2026)
```

---

## Advanced: Proactive Reminders

### Option 1: Calendar Reminders

Set recurring calendar events:

- **Weekly Friday 4pm**: "Update quarterly achievement tracker"
- **2 weeks before deadline**: "Generate quarterly self-evaluation with Claude"
- **1 week before deadline**: "Review and refine self-evaluation"
- **Day before deadline**: "Submit self-evaluation form"

### Option 2: Obsidian Reminder Plugin

Install [Obsidian Reminder](https://github.com/uphy/obsidian-reminder) to get in-app notifications.

### Option 3: Shell Script Automation

```bash
# Add to ~/.bashrc or ~/.zshrc
quarterly_review_reminder() {
  # Check if we're within 2 weeks of deadline
  # Remind to generate evaluation
  echo "⏰ Quarterly review deadline approaching!"
}
```

---

## Comparison: Before vs After

### Before (Manual Process)
- ⏰ **Time**: 2-3 hours per quarter
- 😰 **Stress**: High - scrambling to remember work
- 📝 **Quality**: Inconsistent - depends on memory
- 🔗 **Evidence**: Missing - hard to find supporting links
- 📊 **Growth tracking**: None - no historical record

### After (Automated with Claude)
- ⏰ **Time**: 30 minutes per quarter (mostly review)
- 😌 **Stress**: Low - everything documented
- 📝 **Quality**: High - comprehensive and specific
- 🔗 **Evidence**: Complete - all links tracked
- 📊 **Growth tracking**: Excellent - quarter-over-quarter comparison

---

## Troubleshooting

### "I forgot to track achievements all quarter"

1. Review all daily logs from the quarter (if you kept them)
2. Check Linear/GitHub for completed issues and PRs
3. Review meeting notes for contributions
4. Check Slack for product threads you participated in
5. Ask Claude: "Review my git commits and help me reconstruct Q3 achievements"

### "Claude's responses don't sound like me"

- Add a "Writing Style" section to your achievement tracker
- Provide examples of your preferred tone
- Ask Claude: "Rewrite this in a more [humble/confident/technical] tone"

### "I don't have enough achievements for a pillar"

- Review the pillar definition - you may be undervaluing your work
- Ask Claude: "Analyze my daily work - what counts for the Innovation pillar?"
- If genuinely lacking, note it as a growth area for next quarter

### "The deadline passed and I forgot"

- Set up automated reminders immediately
- Add quarterly review prep to your calendar
- Make weekly tracker updates a non-negotiable habit

---

## Integration with Other Systems

### Professional Growth Plan
[[Professional Growth Plan]] can reference quarterly evaluations:
- Track skill development over time
- Identify consistent strengths and growth areas
- Set goals based on evaluation feedback

### Daily Work Logs
[[Daily Work Log Template]] feeds the quarterly tracker:
- Daily logs = granular work details
- Achievement tracker = quarterly highlights
- Self-evaluation = polished responses

### Project Notes
Link project notes for context:
- [[PayJIM - Atividades]] for feature work
- [[Bug Investigation Notes]] for problem-solving
- [[Meeting Notes]] for collaboration examples

---

## Next Level: Multi-Quarter Analysis

After 2-3 quarters of using this system, unlock powerful insights:

```bash
# Ask Claude Code
"Compare my last 3 quarterly evaluations - what trends do you see?"
"Where have I improved most? Where am I stagnant?"
"Generate a year-end summary from all quarterly evaluations"
```

Claude can:
- Identify growth patterns
- Spot consistent strengths
- Highlight areas needing development
- Provide data for performance discussions
- Prepare you for annual reviews

---

## Quick Reference Commands

```bash
# Weekly
"Update my quarterly tracker with this week's achievements"

# Monthly
"Summarize my work this month across all four pillars"

# Quarterly (2 weeks before deadline)
"Generate my Q[X] self-evaluation"

# Refinement
"Make this response more specific with examples"
"What evidence is missing from my Innovation section?"
"Compare this evaluation to last quarter"

# Submission
"Check my evaluation is complete and ready to submit"
"Archive my Q[X] evaluation after submission"

# Analysis
"What are my consistent strengths across quarters?"
"Where should I focus development next quarter?"
```

---

## Related Resources

- [[Quarterly-Achievement-Tracker]] - Ongoing tracking
- [[Quarterly Self-Evaluation Template]] - Empty template
- [[Daily Work Log Template]] - Daily capture
- [[Professional Growth Plan]] - Long-term development

---

## Feedback Loop

After each quarterly review:
1. **Reflect**: What worked well in your tracking?
2. **Adjust**: What could improve for next quarter?
3. **Iterate**: Update this guide with learnings
4. **Share**: Help teammates set up similar systems

---

**Remember**: The goal isn't to automate away the self-reflection, but to automate the tedious parts so you can focus on thoughtful, accurate self-assessment.
