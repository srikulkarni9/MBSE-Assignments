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

## Current status (as of 2026-11-19)

| Item | State |
|---|---|
| A3 — SEM rule-change analysis | **Delivered** (analysis PDF; group authorship not provable — gap #4) in `assignments/a3_sem_rule_change_analysis/` |
| A3 — SysML model file | **Delivered** — textual SysML v2 export plus PNG/SVG renderings at `assignments/a3_sem_rule_change_analysis/model/` |
| A4 — Problem understanding & model | **Delivered** (analysis PDF; medium confidence — `misc/INVENTORY.md` §4 D11) in `assignments/a4_problem_understanding_and_model/` — the SysML model file is still missing |
| A4 — SysML model file | **Missing** — `MBSE_A4_Never_Settlers_model.sysml` was never exported; see `assignments/a4_problem_understanding_and_model/model/README.md` |
| A6 — System model v2 | **Prepared for submission** — [report and SysML v2 model](assignments/a6_system_model_v2/assignment.md#delivered) |

## Three open project decisions

Three decisions of the project are still open with the team. Each one selects
the rules that apply, so each one changes what the model has to contain. All
three are tracked in
[the A6 contract](assignments/a6_system_model_v2/assignment.md#open).

- **Event — which Shell Eco-marathon event the team enters.** *Open.* The
  values of the chosen event are published as **Chapter II**; they are not
  in this repository. **Impact:** Chapter II fixes the course length, the
  sector count, the attempt rules and the time limit — exactly the values
  the requirement baseline waits for (`SR-ADC-110`, "EventParameters", in the
  A6 model). The 2027 **Chapter I** is available locally; **Chapter IV**
  (Autonomous Driving Competition) is referenced but not stored here.
- **Vehicle category — Prototype or Urban Concept.** *Open.* Both are
  modelled as alternatives (`PrototypeBE` / `UrbanConceptBE` in the A6
  model). **Impact:** the category decides the applicable rules — wheel
  count, driver-weight threshold, vehicle mass limit, cockpit dimensions,
  body and brakes — and therefore which dimensional, body and brake checks
  the team still has to perform.
- **Energy class — Battery Electric, Hydrogen Fuel Cell or ICE.**
  *Working assumption: Battery Electric.* The other two classes remain
  alternatives. **Impact:** the energy class decides the applicable rules
  for energy storage, propulsion and the emergency shutdown — for example,
  the physical isolation of the propulsion battery applies to a Battery
  Electric design and changes with another class.

Until the decisions are confirmed, the A6 model keeps the category-,
energy-class- and event-dependent requirements in a separate, clearly marked
set of candidates instead of folding them into the baseline.

## Repository layout

```
.
├── README.md                  ← this file (purpose, status, setup)
├── AGENTS.md                  ← contract for AI agents (paths, naming, do/don't)
├── HISTORY.md                 ← chronology of the group's work
├── assignments/
│   ├── a3_sem_rule_change_analysis/
│   │   ├── MBSE_A3_Never_Settlers_SEM_Analysis.pdf
│   │   ├── assignment.md      ← Required / Delivered / Open / Sources
│   │   └── model/
│   │       ├── MBSE_A3_Never_Settlers_model.sysml   ← canonical A3 model (textual SysML v2)
│   │       ├── MBSE_A3_Never_Settlers_model.png     ← model rendering
│   │       └── MBSE_A3_Never_Settlers_model.svg     ← model rendering
│   ├── a4_problem_understanding_and_model/
│   │   ├── MBSE_A4_Never_Settlers.pdf
│   │   ├── assignment.md      ← Required / Delivered / Open / Sources
│   │   └── model/
│   │       └── README.md      ← placeholder + export guide for the missing .sysml file
│   └── a6_system_model_v2/
│       ├── MBSE_A6_Never_Settlers.pdf
│       ├── assignment.md
│       └── model/
│           └── MBSE_A6_Never_Settlers.sysml
├── course_material/
│   ├── scripts/               ← lecture scripts MBSE4B_0 … MBSE4B_5
│   └── shell_eco/             ← official SEM 2027 rules, Chapter I (local copy)
│       └── Shell Eco-marathon 2027 Official Rules, Chapter I - shell-eco-marathon-2027-official-rules-chapter-one.pdf
├── misc/
│   ├── INVENTORY.md           ← provenance of every file, decisions, documented gaps
│   ├── VERIFICATION.md        ← recorded verification runs (results of verify_repo.sh)
│   ├── verify_repo.sh         ← re-runnable integrity checks — agents: `bash misc/verify_repo.sh`
│   ├── NASA_MBSE_a5_Cheat_Sheet1.pdf
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
repo) as orientation. One further NASA reference lives next to it in
`misc/`. No external lookup is needed.

## Known gaps (short — details in `misc/INVENTORY.md` and the assignment.md files)

1. The A4 SysML model file `MBSE_A4_Never_Settlers_model.sysml` is not in
   the repo — never exported; presumably it exists only inside kotar.app
   (`misc/INVENTORY.md` §3.1).
2. The repo stores the **2027 Chapter I** rulebook only
   (`course_material/shell_eco/`). The event-specific **Chapter II** and the
   **Chapter IV** (Autonomous Driving Competition) are referenced by the A6
   contract but are **not** stored here — the complete rule set is therefore
   *not* in this repository. A6 works from the local Chapter I and the
   official 2027 Chapter IV; the event-specific Chapter II parameters remain
   open. See [the A6 contract](assignments/a6_system_model_v2/assignment.md#open).
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
6. The **A3 model export is a raw tool export**: it defines the vehicle and
   its six logical parts (perception, autonomous control, vehicle motion,
   safety, electrical energy, vehicle platform), but it carries no
   requirements, no allocations and no functional flows. The requirement
   baseline and the functional analysis live in the A6 model
   (`assignments/a6_system_model_v2/model/MBSE_A6_Never_Settlers.sysml`).

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
