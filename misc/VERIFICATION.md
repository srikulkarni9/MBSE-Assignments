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

## Run 6 — re-verification after the documentation-truth repair (2026-11-19)

- **Recorded run:** 2026-11-19 (local), executed directly after the
  documentation-repair commit — the commit that carries this entry (parent
  commit: `cd95afa5a375acb157ec2756468bf740f5d290f6`; the commit's own
  hash is `git log --oneline -1` at read time, because a file cannot
  contain the hash of the commit that contains it).
- **HEAD at the recorded run:** `ff2b395c99de1c0fe5ad3cb3401ee49b6a00252d`
  (measured with `git rev-parse HEAD` after the repair commit was
  created). This entry was written *after* that run, and the commit was
  then amended (same parent; the tree gained only this entry and a
  paragraph re-wrap in the A4 model placeholder README — no word added,
  removed or changed) so that the working tree ends clean — an amend
  changes the commit's own sha, not the measured state. The sha of the
  commit that carries this entry is `git log --oneline -1` at read time;
  the intermediate versions stay visible in the local reflog.
- **Purpose of this round:** repair the centrally verified false/stale
  documentation claims — HISTORY.md git bullet (M1), HISTORY.md
  chronology (M2), the A4 "not created or exported" wording in both A4
  files (M3), `misc/INVENTORY.md` D8/D9 (M6/M5), the A3 rulebook bullet
  and its Sources line (M7), the HISTORY.md assumption block and the A4
  chronology narrative (M8) — and restore the missing presence assertion
  in verifier check (d) (M4).
- **Result:** 8/9 checks PASS — the single FAIL is (h), by design (see
  below); script exit code 1.
- **Measured state at that run:** `origin/main` ==
  `cd95afa5a375acb157ec2756468bf740f5d290f6` — unchanged, nothing was
  pushed by this session; check (i) PASS (`origin/main` is an ancestor of
  the local `HEAD`); the local `main` is **1 commit ahead** of
  `origin/main` (unpushed); the working tree shows exactly one entry —
  the repository owner's untracked note `temp.txt`.
- **Why (h) FAILs — by design, not a defect:** the owner's untracked note
  `temp.txt` (199 B) is deliberately left in place by this session — it is
  not deleted, not committed and not git-ignored — so `git status
  --porcelain` is not empty and check (h) reports FAIL. Every other check
  is green, including (d) (the canonical layout is intact) and (i) (no
  push, fast-forward history).
- **Check-set change since Run 5:** only check (d) changed — it now also
  asserts the *presence* of every expected canonical folder
  (`a3_sem_rule_change_analysis`, `a4_problem_understanding_and_model`,
  `a6_system_model_v2`). Before the repair a deleted canonical folder was
  silently accepted and (d) still reported PASS (reproduced in a
  throwaway copy: deleting `assignments/a6_system_model_v2` yielded 9/9
  PASS); after the repair the same deletion is reported as `missing
  canonical folder 'a6_system_model_v2'`. Checks (a), (b), (c), (e), (f),
  (g), (h) and (i) are unchanged — still exactly 9 checks.
- **Transparency note:** the script was re-run after the amend described
  above with the identical result — 8/9 PASS, the single (h) FAIL by
  design.
- **Scope note:** this round changed documentation text only, plus the
  (d) block of `misc/verify_repo.sh`; no assignment deliverable, no
  README.md, no AGENTS.md, no asset and no model file was touched.

## Run 7 — re-verification after the history-truthfulness and self-record fix (2026-11-19)

- **Recorded run:** 2026-11-19 (local), executed directly after the
  history-truthfulness/self-record commit — the commit that carries this
  entry (parent commit: `2ec3bdad82d46ecee5a00b03cd8ca6e4874b48b5`; the
  commit's own hash is `git log --oneline -1` at read time, because a file
  cannot contain the hash of the commit that contains it).
- **HEAD at the recorded run:** `7fc5766cff413a136511b056b7c27d8bcc0e4447`
  (measured with `git rev-parse HEAD` after the commit was created). This
  entry was written *after* that run, and the commit was then amended
  (same parent; the tree gained only this entry) so that the working tree
  ends clean — an amend changes the commit's own sha, not the measured
  state. The sha of the commit that carries this entry is
  `git log --oneline -1` at read time; the intermediate version stays
  visible in the local reflog.
- **Purpose of this round:** repair the two findings left open by the
  review of the previous round — F-A: the two surviving present-tense
  `origin/main` position claims in the `HISTORY.md` chronology (the
  2026-11-18 19:37 CET row and the 2026-11-19 00:52 CET row) converted
  to dated past tense; F-B: the missing self-record — the review-findings
  repair round `2ec3bda` and this round added to the `HISTORY.md`
  chronology, the Current-status heading extended, and the
  `misc/INVENTORY.md` run/date bullet extended to name both 2026-11-19
  repair rounds.
- **Result:** 8/9 checks PASS — the single FAIL is (h), by design (see
  below); script exit code 1.
- **Measured state at that run:** `origin/main` ==
  `cd95afa5a375acb157ec2756468bf740f5d290f6` — unchanged, nothing was
  pushed by this session; check (i) PASS (`origin/main` is an ancestor of
  the local `HEAD`); the local `main` is **2 commits ahead** of
  `origin/main` (unpushed: `2ec3bda` plus this commit); the working tree
  shows exactly one entry — the repository owner's untracked note
  `temp.txt`.
- **Why (h) FAILs — by design, not a defect:** the owner's untracked note
  `temp.txt` (199 B) is deliberately left in place by this session — it is
  not deleted, not committed and not git-ignored — so `git status
  --porcelain` is not empty and check (h) reports FAIL (`?? temp.txt`).
  Every other check is green, including (d) (the canonical layout is
  intact), (e) (no absolute user-home path in any of the 7 contract
  files), (f) (dated entries and the Current-status section) and (i) (no
  push, fast-forward history).
- **Check-set change since Run 6:** none — `misc/verify_repo.sh` was **not**
  modified; still exactly 9 checks (a)–(i).
- **Transparency note:** the script was re-run after the amend described
  above with the identical result — 8/9 PASS, the single (h) FAIL by
  design, exit code 1.
- **Scope note:** this round changed documentation text only
  (`HISTORY.md`, `misc/INVENTORY.md` and this file); `misc/verify_repo.sh`,
  `README.md`, `AGENTS.md`, every assignment deliverable, every asset and
  every model file were **not** touched.

## Run 8 — re-verification after the final-review closure round (2026-11-19)

- **Recorded run:** 2026-11-19 (local), executed directly after the
  final-review closure commit — the commit that carries this entry (parent
  commit: `01d3f085f7c5730fe975afec71a5192240e33f99`; the commit's own hash
  is `git log --oneline -1` at read time, because a file cannot contain the
  hash of the commit that contains it).
- **HEAD at the recorded run:**
  `f3c0652d3f9bc54d824fc3b8c4481fd2bcbaa974` (measured with `git rev-parse
  HEAD` after the commit that carries this round's file changes was created;
  its parent is `01d3f08`). This entry was written *after* that run and added
  to the same commit by an amend (same parent; the tree gained only this
  entry) so that the working tree ends clean — an amend changes the
  commit's own sha, not the measured state. The sha of the commit that
  carries this entry is `git log --oneline -1` at read time; the intermediate
  version stays visible in the local reflog.
- **Purpose of this round:** close the one closable core of the final review
  — the user's literal ask ("inwiefern ist die Shell Eco-marathon PDF fuer
  uns relevant") was documented as *coverage* (`misc/INVENTORY.md` §4 D14,
  README Known gaps item 2) but never answered as a conclusive, dated
  verdict. This round adds that verdict (README Known gaps item 2, mirrored
  in `misc/INVENTORY.md` §4 D14) and adds the local 2027 Chapter I PDF to the
  Sources of the A4 `assignment.md`.
- **Result:** 8/9 checks PASS — the single FAIL is (h), by design (see
  below); script exit code 1.
- **Measured state at that run:** `origin/main` ==
  `cd95afa5a375acb157ec2756468bf740f5d290f6` — unchanged, nothing was
  pushed by this session; check (i) PASS (`origin/main` is an ancestor of
  the local `HEAD`); the local `main` is **3 commits ahead** of
  `origin/main` (unpushed: `2ec3bda`, `01d3f08` and this commit); the
  working tree shows exactly one entry — the repository owner's untracked
  note `temp.txt` (199 B, md5 `8ec54a4013e69ceccca8256d5903f432`).
- **Why (h) FAILs — by design, not a defect:** the owner's untracked note
  `temp.txt` (199 B) is deliberately left in place by this session — it is
  not deleted, not committed and not git-ignored — so `git status
  --porcelain` is not empty and check (h) reports FAIL (`?? temp.txt`).
  Every other check is green, including (d) (the canonical layout is
  intact), (e) (no absolute user-home path in any of the 7 contract
  files), (f) (dated entries and the Current-status section) and (i) (no
  push, fast-forward history).
- **Check-set change since Run 7:** none — `misc/verify_repo.sh` was **not**
  modified; still exactly 9 checks (a)–(i).
- **Transparency note:** the script was re-run after the amend described
  above with the identical result — 8/9 PASS, the single (h) FAIL by
  design, exit code 1.
- **Scope note:** this round changed documentation text only (`README.md`,
  `HISTORY.md`, `misc/INVENTORY.md`, the A4 `assignment.md` and this file);
  `misc/verify_repo.sh`, `AGENTS.md`, every assignment deliverable, every
  asset and every model file were **not** touched. The A4 model file was
  neither created nor extracted — that gap stays documented and open.

## Intentionally open gap (documented, NOT a failure)

The A4 SysML model file `MBSE_A4_Never_Settlers_model.sysml` is **not**
in the repository — it was never exported from the modelling tool. This
is a **documented, intentionally left-open gap**; it is deliberately not
counted as a FAIL by any check and must not be invented or fabricated.
Details and the export guide:
`assignments/a4_problem_understanding_and_model/model/README.md`;
provenance and decision trail: `misc/INVENTORY.md` §3.1 and §4.
