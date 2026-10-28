# Citizen Grievance App — Product Concept

A product concept for a citizen grievance-tracking app, built around closing
the three points in the case lifecycle where grievances currently stall.

## Problem

Grievance-filing systems are usually good at taking in complaints and bad at
making sure they go anywhere. Mapping the full citizen/field-worker journey
surfaced three specific drop-off points, not a vague "things are slow":

1. Cases sit **unassigned** after filing — no default owner, no SLA clock.
2. Cases go quiet during **field investigation** — no visible status for the
   citizen, no escalation trigger if it stalls.
3. Field workers mark things **resolved without citizen confirmation** — so
   cases can sit un-closed indefinitely even after the fix happened.

## Approach

- **Journey mapping**: mapped the full 6-stage citizen/field-worker journey
  (file → triage → investigate → resolve → verify → close) and identified
  the 3 drop-off points above. See
  [`docs/journey-map.md`](docs/journey-map.md).
- **MVP scope**: defined acceptance criteria around case ownership, status
  visibility, and escalation after 48 hours of inactivity — each mapped
  directly to one of the three drop-off points. See
  [`docs/mvp-acceptance-criteria.md`](docs/mvp-acceptance-criteria.md).
- **Roadmap**: sequenced MVP → reporting → automation, targeting < 72-hour
  median resolution, < 10% backlog, and a tracked post-closure feedback
  rate. See [`docs/roadmap.md`](docs/roadmap.md).
- **Data model**: a case-tracking schema (`cases`, `status_history`,
  `ownership_history`, `escalations`) that enforces single current
  ownership, full status history, and a queryable 48-hour inactivity check.
  See [`sql/schema.sql`](sql/schema.sql).

## Repo structure

```
citizen-grievance-app/
├── docs/
│   ├── journey-map.md              # 6-stage journey + 3 drop-off points
│   ├── mvp-acceptance-criteria.md  # ownership, visibility, escalation
│   └── roadmap.md                  # MVP -> reporting -> automation, target metrics
└── sql/
    └── schema.sql                  # case tracking data model
```

## Why these three MVP pillars

Case ownership, status visibility, and inactivity escalation weren't chosen
abstractly — each one closes exactly one of the three drop-off points found
in the journey map. That's the throughline of this project: diagnose where
a case actually gets stuck, then scope the MVP to fix only those points
rather than building broad feature coverage.
