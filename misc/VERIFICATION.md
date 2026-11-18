# VERIFICATION.md — Recorded verification run

Automated verification of this repository with `misc/verify_repo.sh`.
The script is **re-runnable** (`bash misc/verify_repo.sh` from any
working directory) and is intended as a standing tool for humans and
AI agents: it re-checks the documented repo state — as recorded in
`README.md`, `AGENTS.md`, `HISTORY.md` and `misc/INVENTORY.md` — at any
time, without having to trust prose.

- **Recorded run:** 2026-11-18 (local), immediately after the commit that
  introduced this file (see `git log --oneline -1`)
- **Result:** 9/9 checks PASS, script exit code 0

| Check | Executed command | Observed result | Verdict |
|---|---|---|---|
| (a) | `find course_material/scripts -maxdepth 1 -type f -printf '%f\n'`; `find . -path ./.git -prune -o -type f -name '*.zip' -print` | exactly the 6 scripts `MBSE4B_0_Course-Intro.pdf` … `MBSE4B_5_Architecting+Modelling.pdf`; no `*.zip` anywhere in the tree | PASS |
| (b) | `md5sum misc/NASA_MBSE_a5_Cheat_Sheet1.pdf` | `76bbbfcfe2d47566ae5ae97594fba356` — equals the documented constant | PASS |
| (c) | `find assignments -type f -name 'MBSE_A3_Never_Settlers_SEM_Analysis.pdf' \| wc -l`; `git log --follow --format=%H -- assignments/a3_sem_rule_change_analysis/MBSE_A3_Never_Settlers_SEM_Analysis.pdf` | exactly 1 copy under `assignments/a3_sem_rule_change_analysis/`; followed history contains commit `49589aa` ("Add files via upload") — provenance proven | PASS |
| (d) | `find assignments -mindepth 1 -maxdepth 1 -printf '%f\n'`; `test -f …/assignment.md` | exactly `a3_sem_rule_change_analysis` + `a4_problem_understanding_and_model`, both contain `assignment.md` | PASS |
| (e) | `grep -qF` per keyword on `README.md`; `grep -rn` of the absolute user-home prefix `/home/<username>` over `README.md`, `AGENTS.md`, `HISTORY.md`, both `assignment.md`, `model/README.md`, `misc/VERIFICATION.md` | each keyword (`never settlers`, `kotar.app`, `SysOn`, `misc/NASA_MBSE_a5_Cheat_Sheet1.pdf`) found ≥ 1x; 0 hits for the user-home prefix in all 7 contract files | PASS |
| (f) | `grep -c '2026-11-18' HISTORY.md`; `grep -qi '^## .*Current status' HISTORY.md` | 9 dated-entry hits; `## Current status` section present | PASS |
| (g) | `grep -v '^#' .gitignore \| grep -iE '\*\.sysml'` | no match — `.gitignore` has no active `*.sysml` pattern (comment lines only mention that `*.sysml` stays tracked); model files remain trackable | PASS |
| (h) | `git status --porcelain` | empty output — clean working tree after the final commit | PASS |
| (i) | `git rev-parse origin/main`; `git rev-list --count origin/main..HEAD` | `6fffee1144a839df98e63976391c9d5f620e73e3` — untouched since initialization; local `main` is 4 commits ahead — proxy proof that no push took place | PASS |

## Intentionally open gap (documented, NOT a failure)

The A4 SysML model file `MBSE_A4_Never_Settlers_model.sysml` is **not**
in the repository — it was never exported from the modelling tool. This
is a **documented, intentionally left-open gap**; it is deliberately not
counted as a FAIL by any check and must not be invented or fabricated.
Details and the export guide:
`assignments/a4_problem_understanding_and_model/model/README.md`;
provenance and decision trail: `misc/INVENTORY.md` §3.1 and §4.
