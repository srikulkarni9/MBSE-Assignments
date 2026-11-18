# HISTORY.md — Working history of team never settlers

Chronology of the group's work on this repository. Every entry cites its
source. Dates that cannot be proven are marked **unknown** — no date is
guessed. The current status is marked at the bottom and updated whenever
the state changes.

| Date | Event | Source | Confidence |
|---|---|---|---|
| unknown | Module MBSE4B (Hochschule Trier) running; team never settlers works with SysML v2 | A4 PDF §1 ("Student teams of Hochschule Trier"); no date evidence | content medium, date unknown |
| unknown | Group produces the A3 rule-change analysis; when the content was actually worked on is not recorded anywhere | only file metadata exists; no work log | date unknown |
| 2026-10-26 16:36 CET | A3 analysis PDF (`MBSE_A3_Never_Settlers_SEM_Analysis.pdf`) created as a file; PDF metadata names author "sridhar kulkarni" (Microsoft Word for Microsoft 365, 2 pages A4) | PDF metadata (`pdfinfo`) | high (metadata); interpretation of author's role medium |
| 2026-11-12 12:14 CET | A4 assignment PDF (`MBSE_A4_Never_Settlers.pdf`) created as a file (LibreOffice 24.2, author field "Un-named", 2 pages A4) | PDF metadata (`pdfinfo`) | high (metadata) |
| unknown | Group works on A4 (need N-01, goals G-01…G-07, objectives O-01…O-08, rule changes CR-1…CR-7, uncertainties) and builds the SysML v2 model — the model text was never exported from the modelling tool, so no model file exists on this machine | A4 PDF content; `misc/INVENTORY.md` §3.1 | content high, dates unknown |
| 2026-11-16 13:52 CET | A3 PDF uploaded to the GitHub repository ("Add files via upload", commit `49589aa`, author account srikulkarni9, committer GitHub — web upload) | git log `49589aa` | high |
| 2026-11-18 ~19:15 | User sets the relevance cutoff: files in the local Downloads folder from this time on are considered relevant for the repo | user instruction of 2026-11-18; `misc/INVENTORY.md` §1 | high |
| 2026-11-18 19:24–19:42 | The five relevant files appear in Downloads (A4 PDF, 2 WhatsApp screenshots of A3 pages, browser-tab backup, ZIP with the 6 course scripts) | file mtimes; `misc/INVENTORY.md` §1 | high |
| 2026-11-18 19:37 CET | Local commit `6fffee1` "Initialize basic folder structure" (effectively only an empty `test.txt`); `origin/main` currently points here | git log | high |
| 2026-11-18 20:29 CET | Local commit `c464124`: empty `test.txt` removed (pre-existing deletion by the repository owner) | git log | high |
| 2026-11-18 20:30 CET | Local commit `92e94b5`: repository restructured — A3 PDF moved via `git mv` into `assignments/a3_sem_rule_change_analysis/` (history traceable to `49589aa`), A4 PDF copied into `assignments/a4_problem_understanding_and_model/`, 6 course scripts (from the ZIP, md5-verified) into `course_material/scripts/`, 3 NASA references + `misc/INVENTORY.md` into `misc/`, `.gitignore` added | git log; `misc/INVENTORY.md` | high |
| 2026-11-18 (evening) | Phase-2 documentation added in one commit: `README.md`, `AGENTS.md`, `HISTORY.md` (this file), `assignments/a3_sem_rule_change_analysis/assignment.md`, `assignments/a4_problem_understanding_and_model/assignment.md`, `assignments/a4_problem_understanding_and_model/model/README.md` — no push | `d4614d0` | high |
| 2026-11-18 20:41 CET | Local commit `bed4efd` "Add rights notice, repo verification script and recorded verification run": `## Rights notice` section added to `README.md`; re-runnable verification script `misc/verify_repo.sh` added; first recorded verification run documented in `misc/VERIFICATION.md` — no push | git log (commit metadata); `misc/VERIFICATION.md` | high |
| 2026-11-18 (evening) | Patch round R1 — documentation fixes from the internal primary review, one commit: A4 PDF characterized as the group's own submission/analysis document (README status, `misc/INVENTORY.md` §1 and §4 D11, Open section of the A4 `assignment.md`); A4 status sharpened to "Delivered (analysis PDF) — model file still missing"; AI-disclaimer scope of the A3 PDF widened from the 2027 column to the whole document (README, `misc/INVENTORY.md` §3.3, A3 `assignment.md`); verification cross-references added (README layout, `AGENTS.md` path map); inventory decisions D3/D6/D9/D10/D11 added; Downloads-folder state update recorded; re-verification run appended to `misc/VERIFICATION.md` — no push | `4739c9d`; `misc/VERIFICATION.md` run 2 | high |
| 2026-11-18 (evening) | Patch round R2 — truthfulness fix in `misc/INVENTORY.md`: gap §3.1 rewritten (the A4 model folder contains only the placeholder `model/README.md`, the model file itself is missing; the stale "currently empty"/"Phase 2" wording removed) and decision D2 freed of its stale phase reference; limited precision polish in README.md (verification scope, A3/A4 provenance wording in the status table, intro claim limited to repo claims) and AGENTS.md (redundant path prefix in the misc/ row); re-verification run 3 appended to `misc/VERIFICATION.md` — no push | parent: `4739c9d`; this commit = `git log --oneline -1`; `misc/VERIFICATION.md` run 3 | high |

## Assumption on record (not a fact)

- The user's original instruction message of 2026-11-18 ended mid-sentence,
  so the **current group state was adopted as an assumption**: "A3 done,
  A4 documented, the SysML model was never exported." This reading is
  consistent with the evidence in the repo (A3 and A4 PDFs present, no
  model file anywhere on the machine), but it is not independently
  confirmed by the group. Source: `misc/INVENTORY.md` §3 (gaps 1–3);
  user message of 2026-11-18.

## Current status (as of 2026-11-18, after commit 4739c9d and the R1 documentation patch + R2 truthfulness fix)

- **A3:** analysis PDF is in the repo; whether it is the delivered group
  result or provided material is not provable from the file alone — both
  readings documented in `assignments/a3_sem_rule_change_analysis/assignment.md`.
  The whole PDF is AI-generated (disclaimer next to the prompt line) and is
  treated as an unverified draft.
- **A4:** analysis PDF is in the repo and documented as the group's own
  submission/analysis document (reading D11, medium confidence); the SysML
  model file is **missing** (never exported) — export guide in
  `assignments/a4_problem_understanding_and_model/model/README.md`.
- **A1/A2/A5:** no artifacts on this machine; no folders invented
  (`misc/INVENTORY.md` §4 D2).
- **Git:** local `main` is ahead of `origin/main` (`6fffee1`) by five
  commits (as of this patch commit); **no push performed** — the
  repository owner pushes personally.
- **Open gaps:** see `misc/INVENTORY.md` §3 and the Open sections of the
  two `assignment.md` files. The documented repo state can be re-verified
  at any time with `bash misc/verify_repo.sh`
  (`misc/VERIFICATION.md`).
