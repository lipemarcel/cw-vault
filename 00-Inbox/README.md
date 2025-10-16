# 00-Inbox

Quick capture zone for incoming notes, ideas, and daily learning.

## Purpose
- Temporary storage for new notes
- Daily learning notes land here first (automated at 9 AM UTC daily)
- Quick captures during meetings or research
- Automated processing based on tags (Fridays at 7 PM UTC)

## Workflow

### Manual Processing
1. Create notes here with quick capture
2. Add proper tags (1-3 tags recommended)
3. Move to appropriate folder when ready

### Automated Processing (NEW)
Every Friday at 7 PM UTC (4 PM BRT), notes are automatically organized based on tags:

**Automatic Routing**:
- `#meeting`, `#bug`, `#feature`, `#pr-review`, `#work` → `02-Work/`
- `#learning`, `#doc` (general) → `01-Learning/`
- `#learning`, `#doc` + `#cnp` + architecture keywords → `03-Projects/`
- `#done` → `04-Archive/`
- No clear tags → Stays in inbox for manual review

## Tag Best Practices

To enable automatic processing, use clear tags:

**Good examples**:
```yaml
tags: [meeting, cnp, feature]        # → 02-Work/
tags: [learning, doc, typescript]    # → 01-Learning/
tags: [doc, cnp]                     # → 03-Projects/ (if architecture doc)
tags: [done, bug]                    # → 04-Archive/
```

**Manual review needed**:
```yaml
tags: [idea]                         # Too vague, stays in inbox
tags: []                             # No tags, stays in inbox
```

## Tips

- **Add tags immediately** when creating notes for automatic processing
- **Use 1-3 tags** from the established tag system (see CLAUDE.md)
- **Check inbox weekly** for notes that need manual categorization
- **Trigger workflow manually** via GitHub Actions if you want immediate processing
