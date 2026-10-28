# Roadmap

Three phases — MVP, reporting, automation — each building toward the same
three target metrics.

## Target metrics

| Metric | Target |
|---|---|
| Median case resolution time | < 72 hours |
| Backlog (cases open > 7 days) | < 10% of total open cases |
| Post-closure citizen feedback rate | tracked from MVP onward, used to validate that "Closed" actually means resolved |

## Phase 1 — MVP

- Case filing (citizen-facing) + triage queue (field-worker-facing)
- Case ownership, status visibility, 48-hour escalation (see
  [`mvp-acceptance-criteria.md`](mvp-acceptance-criteria.md))
- Manual status updates by field workers; no automation yet

## Phase 2 — Reporting

- Supervisor dashboard: open case counts by status, by category, by district
- Median resolution time and backlog % tracked weekly against the targets
  above
- Case-history export for audit/accountability review

## Phase 3 — Automation

- Auto-routing by category + location (replacing manual triage)
- Automated reminder nudges to field workers before the 48-hour escalation
  threshold hits (not just after)
- Post-closure feedback prompt sent automatically, feeding the backlog and
  feedback-rate metrics without manual follow-up
