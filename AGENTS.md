# AGENTS.md — How AI agents work in this repository

This is the agent-facing contract. It deliberately does not repeat the
README — read in this order:

1. `README.md` — purpose, module context, current status
2. `AGENTS.md` (this file) — paths, naming, do/don't
3. `misc/INVENTORY.md` — provenance of every file, decisions, documented gaps
4. `assignments/<id>/assignment.md` — Required / Delivered / Open / Sources
   per assignment, with confidence markers (high / medium / low)

## Path map

| Path | Content |
|---|---|
| `assignments/<id>/` | One folder per **group** assignment. `<id>` = `a<number>_<short-title>`, lowercase snake_case, e.g. `assignments/a3_sem_rule_change_analysis/`. |
| `assignments/<id>/model/` | SysML model files of that assignment (textual SysML v2, `.sysml`). |
| `assignments/<id>/assignment.md` | Contract of record for the assignment: Required / Delivered / Open / Sources, each line marked high / medium / low confidence. |
| `course_material/scripts/` | Lecture scripts `MBSE4B_0_Course-Intro.pdf` … `MBSE4B_5_Architecting+Modelling.pdf`. |
| `misc/` | Cross-assignment references (`NASA_MBSE_a5_Cheat_Sheet1.pdf`, `NASA_MBSE_a5_human_ai.pdf`, `NASA_Systems_Modeling_Handbook_Kurzfassung.pdf`) and `misc/INVENTORY.md` (provenance & decision log). |
| `misc/VERIFICATION.md` | Recorded verification runs — the documented results of `verify_repo.sh` executions. |
| `misc/verify_repo.sh` | Re-runnable integrity checks for the documented repo state. Agents: run `bash misc/verify_repo.sh` from any working directory to re-verify the state (9 checks; exit code 0 = all pass). |
| `HISTORY.md` | Chronology of the group's work; add a dated entry for every state change. |

## ID conventions (schema used in the A4 artifacts)

- `N-…` — stakeholder need (modelled as a concern def in SysML v2)
- `G-…` — goal (action def), elaboration of a need
- `O-…` — objective (requirement def), measurable, tied to exactly one goal
- `SR-…` — system requirement; sub-prefixes used in the A4 artifacts:
  `SR-SAF-…` (safety), `SR-P-…` (Prototype) / `SR-UC-…` (Urban Concept),
  `SR-ADC-…` (Autonomous Driving Competition), `SR-PRJ-…` (project/process),
  `SR-DOC-…` (documentation)
- `CR-…` — rule-change items, each with type, impact and evidence
- `U-…` — uncertainties, each with risk level and action

Rule: IDs are stable once committed — a changed rule or status is an update
to the element, never a new ID.

## Adding a new assignment

1. Create `assignments/a<number>_<short-title>/` (lowercase snake_case).
2. Put the assignment's own documents (task PDFs, delivered PDFs) in that
   folder; SysML files go into `model/`.
3. Write `assignment.md` with the sections **Required / Delivered / Open /
   Sources** and a confidence marker per line. Mark reconstructions and
   assumptions explicitly as such.
4. Add a dated entry to `HISTORY.md` with the source cited per entry.
5. Commit your own changes (commit metadata names the executor as
   `<template>_<session>_<agent>`).

## Do / Don't

**Do**

- Keep every path in documentation repo-relative (no absolute paths).
  Documented exception: `misc/INVENTORY.md` deliberately contains absolute
  local source paths in its provenance sections — source traceability to
  the untouched originals outside the repo. This is the only exception.
- Cite a source file for every factual claim; mark assumptions as
  assumptions, unknown dates as `unknown`.
- Keep `.sysml` model files in Git (intentionally not git-ignored).

**Don't**

- **Never push** — only the repository owner pushes to GitHub.
- No secrets, private data or third-party personal data in the repo.
- Never rewrite, rebase or force-push Git history.
- Never invent content to fill a gap — document the gap instead
  (`assignment.md` → Open, `misc/INVENTORY.md` → §3).
- Do not duplicate README content in this file — link instead.
