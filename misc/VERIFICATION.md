# VERIFICATION.md — Recorded verification runs

Automated verification of this repository with `misc/verify_repo.sh`.
The script is **re-runnable** (`bash misc/verify_repo.sh` from any
working directory) and is intended as a standing tool for humans and
AI agents: it re-checks the documented repo state — as recorded in
`README.md`, `AGENTS.md`, `HISTORY.md` and `misc/INVENTORY.md` — at any
time, without having to trust prose.

### Scope of the checks (what the script does and does not prove)

The script verifies **presence and consistency markers**: documented
keywords, section headings, date entries, file counts, a checksum, the
tracked/untracked pattern of `*.sysml`, a clean working tree and the
relation between the remote ref and the local history. It does **not**
re-validate every factual statement made in the prose documentation —
those remain subject to review.

By design, two situations are expected to turn checks FAIL — that is the
script working as intended, not a defect:

- check (i) fails only on **real divergence**: it asserts that `origin/main`
  stays an ancestor of the local `main`
  (`git merge-base --is-ancestor origin/main HEAD`). A normal push by the
  repository owner keeps that true, so (i) stays green across owner pushes;
  it turns red only if the remote is force-updated or the local history is
  rewritten. The ahead-count is reported informationally — no remote SHA and
  no minimum ahead-count is asserted any more.
- check (d) fails if a **fourth** group-assignment folder appears under
  `assignments/` (or if one of the three canonical folders is renamed or
  loses its `assignment.md`); the canonical layout then has to be updated.

Needle note: check (e) documents the absolute-path needle as
`/home/<username>` to keep this documentation from self-matching; the
actual grep pattern lives in `misc/verify_repo.sh`.

## Run 1 — initial verification (2026-11-18)

- **Recorded run:** 2026-11-18 (local), immediately after the commit that
  introduced this file (that commit: `bed4efd`; see `git log --oneline -1`
  at the time of the run)
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

## Run 2 — re-verification after the R1 documentation patch (2026-11-18)

- **Recorded run:** 2026-11-18 (local), executed directly after the R1
  documentation-patch commit — the commit that carries this entry (parent
  commit: `bed4efd`; the commit's own hash is recorded as
  `git log --oneline -1` at read time, because a file cannot contain the
  hash of the commit that contains it)
- **Check set:** identical to the Run 1 table above (same commands)
- **Result:** 9/9 checks PASS, script exit code 0
- **Scope note:** the R1 patch touched documentation text only
  (`README.md`, `AGENTS.md`, `HISTORY.md`, both `assignment.md` files,
  `misc/INVENTORY.md`, this file); `misc/verify_repo.sh` itself was
  **not** modified.

## Run 3 — re-verification after the R2 truthfulness patch (2026-11-18)

- **Recorded run:** 2026-11-18 (local), executed directly after the R2
  truthfulness-patch commit — the commit that carries this entry (parent
  commit: `4739c9d`; the commit's own hash is recorded as
  `git log --oneline -1` at read time, because a file cannot contain the
  hash of the commit that contains it)
- **Check set:** identical to the Run 1 table above (same commands)
- **Result:** 9/9 checks PASS, script exit code 0
- **Scope note:** the R2 patch touched documentation text only
  (`README.md`, `AGENTS.md`, `HISTORY.md`, `misc/INVENTORY.md`, this
  file); `misc/verify_repo.sh` itself was **not** modified.

## Run 4 — re-verification after the R3 robust-status fix (2026-11-18)

- **Recorded run:** 2026-11-18 (local), executed directly after the R3
  robust-status-fix commit — the commit that carries this entry (parent
  commit: `3ac349c`; the commit's own hash is recorded as
  `git log --oneline -1` at read time, because a file cannot contain the
  hash of the commit that contains it)
- **Check set:** identical to the Run 1 table above (same commands)
- **Result:** 9/9 checks PASS, script exit code 0
- **Scope note:** the R3 patch touched documentation text only
  (`HISTORY.md` and `misc/VERIFICATION.md` — this file, both plain
  Markdown); `misc/verify_repo.sh` itself was **not** modified.

## Run 5 — re-verification after the consolidation + verifier-repair commit (2026-11-19)

- **Recorded run:** 2026-11-19 (local), executed directly after the
  consolidation-and-verifier-repair commit — the commit that carries this
  entry (parent commit: `d63ce6fb838bcff8df436a459b47196dd044306f`; the
  commit's own hash is recorded as `git log --oneline -1` at read time,
  because a file cannot contain the hash of the commit that contains it)
- **Result:** 9/9 checks PASS, script exit code 0
- **Measured state at that run:** `origin/main` ==
  `d63ce6fb838bcff8df436a459b47196dd044306f` — unchanged, nothing was
  pushed; the local `main` is **1 commit ahead** of `origin/main`
  (unpushed); the working tree was clean.
- **Check-set change since Run 4 (measured, not historical):** check (d)
  now asserts the canonical layout — exactly the three group-assignment
  folders `a3_sem_rule_change_analysis`,
  `a4_problem_understanding_and_model` and `a6_system_model_v2`, each
  named `a<n>_<slug>` without spaces and each with an `assignment.md` (a
  fourth folder still fails the check with a useful message); check (i)
  now asserts the fast-forward invariant
  `git merge-base --is-ancestor origin/main HEAD` instead of a pinned
  `origin/main` SHA and a minimum ahead-count, so it survives future owner
  pushes and reports the ahead-count informationally only. Checks (a),
  (b), (c), (e), (f), (g) and (h) are unchanged — still exactly 9 checks.
- **Why (h), (d) and (i) were red before that commit — and only then:**
  (h) failed because the Phase-1 consolidation was still uncommitted in the
  working tree (the expected intermediate state, not a defect); (d) and (i)
  failed because they still carried the pre-consolidation assertions (two
  assignment folders, pinned remote SHA `6fffee1…`, ahead-count >= 3).
  After the (d)/(i) adaptation both were green before the commit; (h)
  turned green with the commit itself.
- **Transparency note:** this entry was added *after* the run above; the
  commit was then amended once (same parent, same tree plus this entry) so
  that the working tree ends clean. The script was re-run after the amend
  with the same result — 9/9 PASS, exit code 0.
- **Scope note:** that single commit carried the Phase-1 consolidation and
  the Phase-2 verifier repair together; `misc/verify_repo.sh` was modified
  in the (d) and (i) checks only.

## Intentionally open gap (documented, NOT a failure)

The A4 SysML model file `MBSE_A4_Never_Settlers_model.sysml` is **not**
in the repository — it was never exported from the modelling tool. This
is a **documented, intentionally left-open gap**; it is deliberately not
counted as a FAIL by any check and must not be invented or fabricated.
Details and the export guide:
`assignments/a4_problem_understanding_and_model/model/README.md`;
provenance and decision trail: `misc/INVENTORY.md` §3.1 and §4.
