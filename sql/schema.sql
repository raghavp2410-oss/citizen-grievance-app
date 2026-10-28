-- Citizen Grievance App — Case Tracking Schema
-- Supports the MVP acceptance criteria: case ownership, status visibility,
-- and 48-hour inactivity escalation.

CREATE TABLE cases (
    case_id         TEXT PRIMARY KEY,
    citizen_id      TEXT NOT NULL,
    category        TEXT NOT NULL,
    location        TEXT NOT NULL,
    description     TEXT,
    status          TEXT NOT NULL DEFAULT 'Filed'
                        CHECK (status IN ('Filed','Assigned','In Progress',
                                           'Resolved','Closed','Escalated')),
    current_owner_id TEXT,                 -- enforces single current owner
    filed_at        TEXT NOT NULL,         -- ISO 8601 timestamp
    last_activity_at TEXT NOT NULL         -- drives the 48h escalation check
);

CREATE TABLE status_history (
    history_id      INTEGER PRIMARY KEY AUTOINCREMENT,
    case_id         TEXT NOT NULL REFERENCES cases(case_id),
    old_status      TEXT,
    new_status      TEXT NOT NULL,
    changed_by      TEXT NOT NULL,
    changed_at      TEXT NOT NULL
);

CREATE TABLE ownership_history (
    history_id      INTEGER PRIMARY KEY AUTOINCREMENT,
    case_id         TEXT NOT NULL REFERENCES cases(case_id),
    old_owner_id    TEXT,
    new_owner_id    TEXT NOT NULL,
    reason          TEXT NOT NULL,          -- e.g. 'initial_assignment', 'reassigned', 'escalated'
    changed_at      TEXT NOT NULL
);

CREATE TABLE escalations (
    escalation_id   INTEGER PRIMARY KEY AUTOINCREMENT,
    case_id         TEXT NOT NULL REFERENCES cases(case_id),
    triggered_at    TEXT NOT NULL,
    hours_inactive  REAL NOT NULL,
    supervisor_id   TEXT NOT NULL,
    resolved_at     TEXT                     -- null while still escalated
);

-- Query: cases inactive > 48 hours and not yet escalated (the trigger condition)
-- SELECT case_id, current_owner_id, last_activity_at
-- FROM cases
-- WHERE status NOT IN ('Closed', 'Escalated')
--   AND (strftime('%s','now') - strftime('%s', last_activity_at)) / 3600.0 > 48;

-- Query: median resolution time (Filed -> Closed), in hours
-- SELECT AVG(hours) AS median_approx FROM (
--   SELECT (strftime('%s', sh2.changed_at) - strftime('%s', c.filed_at)) / 3600.0 AS hours
--   FROM cases c
--   JOIN status_history sh2 ON sh2.case_id = c.case_id AND sh2.new_status = 'Closed'
-- );
