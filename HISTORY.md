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
| unknown | Group works on A4 (need N-01, goals G-01…G-07, objectives O-01…O-08, rule changes CR-1…CR-7, uncertainties) and builds the SysML v2 model — the model text was never exported from the modelling tool, so at that time (2026-11-18) no model file existed on this machine; superseded since — the A3 and A6 model files are now in the repo, see `misc/INVENTORY.md` §3.1 | A4 PDF content; `misc/INVENTORY.md` §3.1 | content high, dates unknown |
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
| 2026-11-18 (evening) | Patch round R3 — robust-status fix: the stale hard ahead-count written in R1 (left stale when R2 updated only the section heading) removed from the Current-status Git bullet and replaced by a robust formulation that stays true after every future commit ("several commits" plus the live counter command `git rev-list --count origin/main..HEAD`, snapshot 6 as of commit `3ac349c`); section heading extended with the R3 fix; re-verification run 4 appended to `misc/VERIFICATION.md` — no push | parent: `3ac349c`; this commit = `git log --oneline -1`; `misc/VERIFICATION.md` run 4 | high |
| 2026-11-18 | Created the A6 folder and documented the team task, submission instructions and existing project inputs. | [A6 assignment brief](assignments/a6_system_model_v2/assignment.md), based on Session 5, slides 52 and 54 | high |
| 2026-11-18 | Prepared the A6 submission document and SysML v2 export, including the common working baseline, external exchanges and three functional flows. Official 2027 Chapter IV informs the ADC baseline. | [A6 report](assignments/a6_system_model_v2/MBSE_A6_Never_Settlers.pdf), [A6 model](assignments/a6_system_model_v2/model/MBSE_A6_Never_Settlers.sysml) | high |
| 2026-11-19 00:52 CET | Repository owner commit `d63ce6f` "initial folder structure & assignment 6" (author and committer `edgar <166285592+EdiDorner@users.noreply.github.com>`): the A6 folder with the submission document and the SysML v2 model, the local 2027 Chapter I rulebook, the A3 model export with its PNG/SVG renderings **and a second copy of the A3 SEM analysis PDF**, the internal A6 discussion draft, and the removal of `misc/NASA_MBSE_a5_human_ai.pdf`. The owner produced A6 during the team pause to meet the slide-52 deadline of 18 November 2026 and sorted the new files together with another agent (context in the owner's chat log with that agent, kept outside this repository). The owner pushed this commit themselves — `origin/main` points at it. | git log `d63ce6f`; owner chat log | high |
| 2026-11-19 | Consolidation phase 1 — cleanup after the owner's commit `d63ce6f`, **no push**: the A3 model export and its PNG/SVG renderings moved byte-identically (`git mv`, Git blob SHAs unchanged) to the canonical path `assignments/a3_sem_rule_change_analysis/model/`; the legacy folder with spaces in its name removed; the byte-identical duplicate A3 SEM analysis PDF removed after an md5 identity check against the canonical copy; the obsolete 231 kB internal A6 discussion draft removed on the owner's explicit order; the three legacy links in the A6 contract repaired (two retargeted to the canonical A3 path, the dead draft link replaced by a truthful provenance note); README, AGENTS, HISTORY and INVENTORY updated to the new state — no assignment folder with spaces, no duplicated A3 PDF, A6 deliverables byte-identical. | this consolidation round; `git log`; md5 sums | high |
| 2026-11-19 | Consolidation commit `cd95afa` (parent `d63ce6f`): a single commit carrying consolidation phase 1 (asset moves/deletions + contract edits) AND phase 2 (verifier checks (d)/(i) repair, a4 truth-fix, `misc/VERIFICATION.md` Run 5); amend transparency `cbf173b` -> `cd95afa` (same parent, same tree plus the added Run-5 entry); initially unpushed, then pushed by the owner (next row). | git log; git reflog; md5 sums | high |
| 2026-11-19 02:32:42 CET | Repository owner pushed `cd95afa` to `origin/main` under `edgar <166285592+EdiDorner@users.noreply.github.com>` (the same identity as his pushes at 19:37:23 and 00:52:33); evidence: raw remote reflog `.git/logs/refs/remotes/origin/main` ("update by push d63ce6f -> cd95afa") and the owner's untracked note `temp.txt`. | raw remote reflog; `temp.txt` | high |

## Assumption on record (not a fact)

- The user's original instruction message of 2026-11-18 ended mid-sentence,
  so the **current group state was adopted as an assumption**: "A3 done,
  A4 documented, the SysML model was never exported." This reading was
  adopted on 2026-11-18, when no model file existed on this machine; since
  then the owner has added the A3 model
  (`assignments/a3_sem_rule_change_analysis/model/MBSE_A3_Never_Settlers_model.sysml`)
  and the A6 model
  (`assignments/a6_system_model_v2/model/MBSE_A6_Never_Settlers.sysml`);
  only the A4 model is still absent. The assumption itself remains on
  record for the 2026-11-18 state and is not independently confirmed by
  the group. Source: `misc/INVENTORY.md` §3 (gaps 1–3); user message of
  2026-11-18.

## Current status (as of 2026-11-19, after the consolidation commit cd95afa)

- **A3:** analysis PDF is in the repo; whether it is the delivered group
  result or provided material is not provable from the file alone — both
  readings documented in `assignments/a3_sem_rule_change_analysis/assignment.md`.
  The whole PDF is AI-generated (disclaimer next to the prompt line) and is
  treated as an unverified draft. The **A3 SysML model file is in the repo**
  at the canonical path
  `assignments/a3_sem_rule_change_analysis/model/MBSE_A3_Never_Settlers_model.sysml`
  (textual SysML v2 export with its PNG and SVG renderings).
- **A4:** analysis PDF is in the repo and documented as the group's own
  submission/analysis document (reading D11, medium confidence); the SysML
  model file is **missing** (never exported) — export guide in
  `assignments/a4_problem_understanding_and_model/model/README.md`.
- **A6:** [submission document and SysML v2 model](assignments/a6_system_model_v2/assignment.md#delivered)
  prepared for team submission; the three open decisions (event, vehicle
  category, energy class) are documented in `README.md` and in the contract.
- **A1/A2/A5:** no artifacts on this machine; no folders invented
  (`misc/INVENTORY.md` §4 D2).
- **Git:** local `main` and `origin/main` were both at the consolidation
  commit `cd95afa` (parent `d63ce6f`) — the owner pushed it personally on
  2026-11-19 02:32:42 CET. The number of unpushed local commits is
  `git rev-list --count origin/main..HEAD` (0 as of commit `cd95afa`).
  **No push performed by this session** — the repository owner pushes
  personally.
- **Open gaps:** see `misc/INVENTORY.md` §3 and the Open sections of the
  `assignment.md` files. The documented repo state can be re-verified
  at any time with `bash misc/verify_repo.sh`
  (`misc/VERIFICATION.md`).
