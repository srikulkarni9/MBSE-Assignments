# Assignment A4 — Problem understanding and model

Folder: `assignments/a4_problem_understanding_and_model/`
Files in this folder: `MBSE_A4_Never_Settlers.pdf`, `model/` (currently only
`model/README.md` — the model file itself is missing, see below)

> Confidence legend used in this file:
> **high** = directly evidenced by a file in this repo or by its metadata ·
> **medium** = plausible reading of the evidence, alternatives possible ·
> **low** = reconstruction / assumption.

## Required

*(The lecturer's original A4 task sheet is not in the repo; the requirement
is reconstructed from the delivered PDF's own title and structure.)*

- "Assignment 4 - Understanding the problem and model" for team never
  settlers: model the problem in SysML v2 — stakeholder expectations and
  changing requirements — for the Autonomous Driving Competition, Shell
  Eco-marathon 2027. *(medium — reconstruction from the PDF's title line;
  the original task text is not in the repo)*
- Deliverable includes a SysML v2 model file, Part A (need, goals,
  objectives): `MBSE_A4_Never_Settlers_model.sysml`. *(medium — the PDF
  names this file as the "Model text"; the file itself is missing, see
  `model/README.md`)*

## Delivered

- `MBSE_A4_Never_Settlers.pdf` (2 pages, A4), four sections, using the ID
  schema N-/G-/O-/CR-/U-: *(high — full text extracted from the PDF)*
  1. **Stakeholder expectations (modelled)** — one need **N-01** (student
     teams of Hochschule Trier demonstrate under official SEM 2027
     conditions that a vehicle drives a defined course autonomously, safely
     and energy-efficiently); goals **G-01…G-07** (admission, autonomous
     driving, protection of people, energy efficiency, engineering
     communication, MBSE practice, compliance under rule changes); measurable
     objectives **O-01…O-08**, each tied to one goal with measure and target;
     model-mapping note: need = concern def, goal = action def, objective =
     requirement def; model text named as `MBSE_A4_Never_Settlers_model.sysml`,
     Part A.
  2. **Changing requirements** — rule-change items **CR-1…CR-7** (2027 vs.
     earlier) with type (New / Changed / Indicated / Pending), impact on the
     vehicle and evidence per item; result: 4 of 7 affect the ADC vehicle or
     team (CR-3 ballast, CR-4 emergency shutdown, CR-5 registration wording,
     CR-7 Chapter IV pending), 3 do not (CR-1, CR-2 hydrogen, CR-6 hybrid);
     explicitly stated as a **lower bound** (full 2026-vs-2027 Chapter I
     diff was not possible; 2027 Chapter IV was not readable). Plus a
     6-point change process: versioned rule elements with source and year,
     complete traceability, impact assessment within 5 working days
     (objective O-08), TBC/Baseline markers, baseline freezes at project
     reviews with model files kept in Git, early organiser questions.
  3. **Key steps we took** — 5 steps: course material and A3 model read;
     2027 Chapter I and the available autonomous-competition rules read;
     one singular need, then goals and measurable objectives, free of
     solutions; rule versions compared where evidence existed; change
     process and open conflicts recorded.
  4. **Where we are uncertain** — U-1, U-2, U-3, U-10, U-11, each with risk
     and action (see Open below).
- File metadata: created 2026-11-12 12:14 CET, LibreOffice 24.2, author
  field "Un-named". *(high — `pdfinfo`)*
- The SysML model file itself is **not** delivered — it is missing from the
  repo (see `model/README.md`). *(high that it is missing)*

## Open

- **The role of the PDF in this folder is an interpretation, not a proven
  fact.** The reading adopted in this file — the PDF is the **group's own
  A4 submission/analysis document** — has *medium* confidence. Evidence
  for it: the PDF is an analysis product with the sections "3. Key steps
  we took" and "4. Where we are uncertain" and a "Model mapping
  (Session 3)" note; it contains no task list, no deadlines and no grading
  criteria; the author field is "Un-named". The **lecturer's original A4
  task sheet is not in the repo** — its location is unknown. *(medium —
  interpretation; decision and evidence recorded in `misc/INVENTORY.md`
  §4 D11)*
- **U-1 (High risk) — 2027 Chapter IV not read.** All ADC-specific
  requirements use the 2026 text as baseline and carry the status
  "Baseline-2026"; values, sub-clauses or numbering may differ. Action per
  the PDF: obtain the 2027 Chapter IV PDF, run a clause-by-clause diff and
  update SR-ADC-xxx and SR-DOC-003. *(high — as stated in the PDF; the
  underlying open point is unresolved)*
- **CR-7 (Pending) — 2027 Chapter IV content not retrieved.** The 2027
  Chapter IV exists (417 kB vs. 634 kB for 2026, per the publisher listing
  cited in the PDF) but its content was not available to the team.
  *(high — as stated in the PDF)*
- **U-2 (High):** vehicle category not yet fixed — Prototype and Urban
  Concept rules differ in dimensions, braking and body; both sets are
  modelled and tagged P or UC. Action: confirm with the proTRon team leads.
- **U-3 (Medium):** energy class assumed Battery Electric (based on the A3
  model's `ElectricalEnergySystem`); other classes would change electrical
  and shutdown requirements.
- **U-10 (Medium):** objective targets marked "initial" (O-01, O-03, O-05,
  O-08) are team proposals, not stakeholder-approved.
- **U-11 (Medium):** rule changes not fully diffed — only changes with
  evidence are listed (CR-1…CR-7); the remaining Chapter I articles are
  assumed unchanged, which is unproven.
- **Missing model file:** `MBSE_A4_Never_Settlers_model.sysml`, referenced
  in section 1 of the PDF ("Model text: …, Part A"), does not exist in the
  repo — never exported; the working assumption is that it exists only
  inside kotar.app (assumption, not proven). As of 2026-11-19 the A4 model
  has not been created or exported yet and is absent from the repository;
  the machine-wide scan claim of 2026-11-18 ("no `.sysml`/`.sysmlx`/`.xmi`/
  `.kerml` file exists anywhere on this machine") is superseded — the
  repository does contain the A3 model
  (`assignments/a3_sem_rule_change_analysis/model/MBSE_A3_Never_Settlers_model.sysml`)
  and the A6 model
  (`assignments/a6_system_model_v2/model/MBSE_A6_Never_Settlers.sysml`),
  see `misc/INVENTORY.md` §3.1. Export instructions: `model/README.md`.
  *(high that it is missing; the "only in kotar.app" part is an assumption)*

## Sources

- `assignments/a4_problem_understanding_and_model/MBSE_A4_Never_Settlers.pdf`
  — full text and metadata (pdftotext / pdfinfo, extracted 2026-11-18).
  *(high)*
- `assignments/a3_sem_rule_change_analysis/MBSE_A3_Never_Settlers_SEM_Analysis.pdf`
  — cited by the A4 PDF as evidence (CR-3, CR-4, CR-7) and as prior work
  ("the A3 model", `ElectricalEnergySystem`). *(high)*
- `misc/INVENTORY.md` §3.1 and §4 D7 — model-file gap and the
  `.sysml`-stays-in-Git decision. *(high)*
- Git history: `92e94b5` (PDF copied into this folder from the local
  Downloads folder; the original outside the repo stays untouched).
  *(high)*
