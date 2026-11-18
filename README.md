# MBSE-Assignments — Group Repository of Team **never settlers**

Central collection of files and group-assignment results for the module
**MBSE4B — Model-Based Systems Engineering**. The repository is maintained
so that both humans and AI agents can use it as the single point of
reference: every group assignment with actual artifacts has one folder,
every claim about the repository's contents and history is backed by a file in the repo, and
every gap is documented instead of invented (assignments without artifacts
on this machine — A1/A2/A5 — deliberately get no folder; see the note below
the layout tree and `misc/INVENTORY.md` §4 D2).

- **Remote:** https://github.com/srikulkarni9/MBSE-Assignments
  (only the repository owner pushes; all local work stays local until then).

## Module & project context

- **Module:** MBSE4B — Model-Based Systems Engineering at Hochschule Trier
  (evidence: the A4 assignment PDF names "Student teams of Hochschule
  Trier").
- **Modelling method & language:** SysML v2, textual syntax.
- **Project:** the group designs an **autonomous vehicle for the Shell
  Eco-marathon (SEM)**, targeting the **Autonomous Driving Competition
  (ADC)**.
- **Special focus:** the **rule changes between marathon seasons**
  (2025 → 2026 → 2027) must be reflected in the design — the model has to
  stay compliant while the rules change (A4 goals G-07 / objective O-08).

## Current status (as of 2026-11-18)

| Item | State |
|---|---|
| A3 — SEM rule-change analysis | **Delivered** (analysis PDF; group authorship not provable — gap #4) in `assignments/a3_sem_rule_change_analysis/` |
| A4 — Problem understanding & model | **Delivered** (analysis PDF; medium confidence — `misc/INVENTORY.md` §4 D11) in `assignments/a4_problem_understanding_and_model/` — the SysML model file is still missing |
| A4 — SysML model file | **Missing** — `MBSE_A4_Never_Settlers_model.sysml` was never exported; see `assignments/a4_problem_understanding_and_model/model/README.md` |

## Repository layout

```
.
├── README.md                  ← this file (purpose, status, setup)
├── AGENTS.md                  ← contract for AI agents (paths, naming, do/don't)
├── HISTORY.md                 ← chronology of the group's work
├── assignments/
│   ├── a3_sem_rule_change_analysis/
│   │   ├── MBSE_A3_Never_Settlers_SEM_Analysis.pdf
│   │   └── assignment.md      ← Required / Delivered / Open / Sources
│   └── a4_problem_understanding_and_model/
│       ├── MBSE_A4_Never_Settlers.pdf
│       ├── assignment.md      ← Required / Delivered / Open / Sources
│       └── model/
│           └── README.md      ← placeholder + export guide for the missing .sysml file
├── course_material/
│   └── scripts/               ← lecture scripts MBSE4B_0 … MBSE4B_5
├── misc/
│   ├── INVENTORY.md           ← provenance of every file, decisions, documented gaps
│   ├── VERIFICATION.md        ← recorded verification runs (results of verify_repo.sh)
│   ├── verify_repo.sh         ← re-runnable integrity checks — agents: `bash misc/verify_repo.sh`
│   ├── NASA_MBSE_a5_Cheat_Sheet1.pdf
│   ├── NASA_MBSE_a5_human_ai.pdf
│   └── NASA_Systems_Modeling_Handbook_Kurzfassung.pdf
└── .gitignore
```

Only **group assignments** get a folder here (individual assignments are
out of scope by decision of the team). Folders exist only for assignments
with actual artifacts — no empty folders are invented for assignments
without evidence (see `misc/INVENTORY.md` §4 D2).

Agents can re-verify the documented repo state at any time until the
repository state changes (the documented scope of the checks, including
by-design future FAIL triggers, lives in `misc/VERIFICATION.md`) with
`bash misc/verify_repo.sh` (9 checks; exit code 0 = all pass). The
recorded verification runs live in `misc/VERIFICATION.md`.

## Tooling setup of the group

Group members create SysML models in two different ways:

- **SysOn in a Docker container** — some members run the SysML v2 tool
  *SysOn* inside a local Docker container and work on the model files
  directly in the container workspace.
- **kotar.app (web app)** — other members use https://kotar.app/app : they
  paste SysML code into the web app and inspect the rendered model
  visually.

Both paths are fine; the shared artifacts of record are the exported model
files committed in this repo (see the `model/README.md` of the respective
assignment for exact export instructions).

## For AI agents: SysML cheat sheet

When creating or modifying SysML models, agents can use
`misc/NASA_MBSE_a5_Cheat_Sheet1.pdf` (NASA MBSE cheat sheet, kept in the
repo) as orientation. Two further NASA references live next to it in
`misc/`. No external lookup is needed.

## Known gaps (short — details in `misc/INVENTORY.md` and the assignment.md files)

1. The A4 SysML model file `MBSE_A4_Never_Settlers_model.sysml` is not in
   the repo — never exported; presumably it exists only inside kotar.app
   (`misc/INVENTORY.md` §3.1).
2. No dedicated PDF of the Shell Eco-marathon rulebook is in the repo; the
   rule analysis works from the A3 PDF and the sources it cites
   (`misc/INVENTORY.md` §3.2).
3. The whole A3 PDF is AI-generated: the disclaimer "AI generated content
   using Gemini AI" is printed in the PDF directly next to the prompt line
   ("Comparison of rule/regulation changes between 2025 Vs 2026 Vs 2027"),
   so it covers the entire document — the 2025/2026 columns included — and
   not only the 2027 column. Treat the whole A3 document as an
   **unverified draft**, not as authoritative rule text
   (`misc/INVENTORY.md` §3.3).
4. It is not provable from the file alone whether the A3 PDF is the group's
   delivered result or provided material — both readings are documented
   with evidence in `assignments/a3_sem_rule_change_analysis/assignment.md`.
5. No folders for A1/A2/A5: no artifacts exist on this machine, so none are
   invented (`misc/INVENTORY.md` §4 D2).

## Conventions

- Documentation language: **English** (the group's artifacts and the course
  material are in English).
- Folder naming (`a<number>_<short-title>/`) and element-ID schema
  (N-, G-, O-, SR-, CR-, U-): see `AGENTS.md`.
- Git: **nobody pushes except the repository owner**; no history rewriting;
  `.sysml` files are intentionally *not* ignored — model files belong in
  Git (required by the A4 change process).

## Rights notice

The lecture scripts and the assignment PDFs stored in this repository are
course material of the MBSE4B module (Hochschule Trier); their copyright
remains with the respective authors and rights holders. They are kept here
solely for the internal use of team **never settlers**. The NASA reference
documents serve as orientation when modelling in SysML. Before this
repository is pushed to the public remote, the repository owner confirms
the distribution rights for the stored material. Nothing in this section
is legal advice.
