# model/ — Placeholder for the missing SysML model file

**Target file: `MBSE_A4_Never_Settlers_model.sysml` — does not exist yet.**
This folder is its designated home inside the repo.

## Where the file is referenced

The assignment PDF
`assignments/a4_problem_understanding_and_model/MBSE_A4_Never_Settlers.pdf`
states at the end of section 1 (Stakeholder expectations):

> "Model text: `MBSE_A4_Never_Settlers_model.sysml`, Part A."

So the model text exists as a described artifact — but the file itself was
never exported into this repository. As of 2026-11-19 the A4 model
has not been exported into the repository and is absent from the repository; the
machine-wide scan claim of 2026-11-18 ("no `.sysml`, `.sysmlx`, `.xmi` or
`.kerml` file exists anywhere on this machine") is superseded — the
repository does contain the A3 model
(`assignments/a3_sem_rule_change_analysis/model/MBSE_A3_Never_Settlers_model.sysml`)
and the A6 model
(`assignments/a6_system_model_v2/model/MBSE_A6_Never_Settlers.sysml`),
see `misc/INVENTORY.md` §3.1. The working assumption is that the model was
created inside a modelling tool and never left it — presumably it exists
only inside kotar.app (assumption, not proven).

## How to export the model (both tool paths used in the group)

### Path 1 — SysOn in a Docker container

1. Enter the container workspace where the SysML model lives, e.g.
   `docker exec -it <container> sh` (container name depends on the
   member's setup).
2. Locate the model file in the container workspace; make sure it is the
   **current** A4 model text, Part A (need N-01, goals G-01…G-07,
   objectives O-01…O-08 per the A4 PDF).
3. Copy it out of the container into this folder, e.g.:
   `docker cp <container>:/<workspace-path>/MBSE_A4_Never_Settlers_model.sysml assignments/a4_problem_understanding_and_model/model/`

### Path 2 — kotar.app (web app)

1. Open the A4 model in https://kotar.app/app .
2. Export or copy the model code from the app (export function, or
   copy/paste of the textual SysML v2 code).
3. Save it as
   `assignments/a4_problem_understanding_and_model/model/MBSE_A4_Never_Settlers_model.sysml`
   (plain text, UTF-8).

### After the file exists

- Commit it. `.sysml` is intentionally **not** git-ignored — the A4 change
  process explicitly keeps model files in Git for history and diffs (see
  the note in `.gitignore` and `misc/INVENTORY.md` §4 D7).
- Update `assignments/a4_problem_understanding_and_model/assignment.md`
  (section Delivered) and add a dated entry to `HISTORY.md`.

## Naming

Keep the file name **exactly** `MBSE_A4_Never_Settlers_model.sysml` — that
is the name the A4 PDF binds the model text to. If the tool exports a
different format or extension (`.sysmlx`, `.xmi`, …), add that file
alongside, but also provide the textual `.sysml` file itself.
