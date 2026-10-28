# MVP Acceptance Criteria

Scoped directly against the three drop-off points in the journey map.

## 1. Case ownership

- [ ] Every grievance is auto-assigned an owner within a defined SLA window
      of submission (no case can sit in an "unassigned" state indefinitely).
- [ ] Reassignment is logged with a timestamp and reason — ownership history
      is never silently overwritten.
- [ ] A case always has exactly one current owner at any point in time.

## 2. Status visibility

- [ ] Citizen can see one of a fixed set of statuses at any time: `Filed →
      Assigned → In Progress → Resolved → Closed` (plus `Escalated`).
- [ ] Every status transition is timestamped and visible in the case's
      history, to both citizen and field worker.
- [ ] Field worker's queue shows time-in-current-status for every open case,
      sorted oldest first.

## 3. Escalation after 48 hours of inactivity

- [ ] If a case has no status change or logged activity for 48 hours, it is
      automatically flagged `Escalated` and routed to the owner's supervisor.
- [ ] Escalation does not remove the original owner — it adds a second
      watcher, so accountability isn't lost mid-escalation.
- [ ] Escalated cases are visible in a separate supervisor-facing queue,
      sorted by longest-inactive first.

## Out of scope for MVP

- In-app chat between citizen and field worker (phone/SMS fallback only)
- Multi-language support beyond the primary rollout language
- Predictive routing (ML-based assignment) — MVP uses rule-based routing by
  category + location
