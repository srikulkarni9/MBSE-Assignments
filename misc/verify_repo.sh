#!/usr/bin/env bash
# verify_repo.sh — re-runnable integrity checks for this repository.
#
# Usage:   bash misc/verify_repo.sh   (works from any cwd; all paths repo-relative)
# Exit:    0 = all checks PASS, 1 = at least one check FAILed.
# Purpose: standing tool for humans and AI agents to re-verify the documented
#          repo state at any time. A recorded run lives in misc/VERIFICATION.md.
#
# Note: the A4 SysML model file is an intentionally documented open gap
# (see assignments/a4_problem_understanding_and_model/model/README.md).
# It is deliberately NOT checked here and must NOT be fabricated.

set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

# Documented constant: md5 of misc/NASA_MBSE_a5_Cheat_Sheet1.pdf.
CHEATSHEET_MD5="76bbbfcfe2d47566ae5ae97594fba356"
# No remote SHA is pinned here: check (i) asserts a state-agnostic invariant
# (origin/main stays an ancestor of the local HEAD) instead of a transient hash.
A3_PDF="assignments/a3_sem_rule_change_analysis/MBSE_A3_Never_Settlers_SEM_Analysis.pdf"

FAILURES=0
pass() { echo "PASS  $*"; }
fail() { echo "FAIL  $*"; FAILURES=$((FAILURES + 1)); }

# (a) exactly the 6 lecture scripts in course_material/scripts/, no *.zip in the tree
EXPECTED_SCRIPTS=(
  "MBSE4B_0_Course-Intro.pdf"
  "MBSE4B_1_Fundamentals+Methodologies.pdf"
  "MBSE4B_2_Lifecycles+Languages.pdf"
  "MBSE4B_3_NGO+Requirements.pdf"
  "MBSE4B_4_Functions+MoreRequirements.pdf"
  "MBSE4B_5_Architecting+Modelling.pdf"
)
scripts_actual="$(find course_material/scripts -maxdepth 1 -type f -printf '%f\n' 2>/dev/null | sort)"
scripts_expected="$(printf '%s\n' "${EXPECTED_SCRIPTS[@]}" | sort)"
zips="$(find . -path ./.git -prune -o -type f -name '*.zip' -print 2>/dev/null)"
if [ "$scripts_actual" = "$scripts_expected" ] && [ -z "$zips" ]; then
  pass "(a) course_material/scripts contains exactly the 6 expected lecture scripts; no *.zip in the tree"
else
  fail "(a) course_material/scripts deviates (found: $(echo "$scripts_actual" | tr '\n' ' '))"
  [ -z "$zips" ] || fail "(a) *.zip present in tree: $zips"
fi

# (b) md5 of the NASA cheat sheet equals the documented constant
actual_md5="$(md5sum misc/NASA_MBSE_a5_Cheat_Sheet1.pdf 2>/dev/null | awk '{print $1}')"
if [ "$actual_md5" = "$CHEATSHEET_MD5" ]; then
  pass "(b) md5(misc/NASA_MBSE_a5_Cheat_Sheet1.pdf) == $CHEATSHEET_MD5"
else
  fail "(b) cheat-sheet md5 is '${actual_md5:-<file missing>}', expected $CHEATSHEET_MD5"
fi

# (c) A3 PDF exists exactly once under its assignment folder AND its followed git history contains commit 49589aa
a3_copies="$(find assignments -type f -name 'MBSE_A3_Never_Settlers_SEM_Analysis.pdf' 2>/dev/null | wc -l)"
if [ "$a3_copies" -eq 1 ] && [ -f "$A3_PDF" ] && git log --follow --format=%H -- "$A3_PDF" 2>/dev/null | grep -q '49589aa'; then
  pass "(c) $A3_PDF exists exactly once; git log --follow contains 49589aa (provenance proven)"
else
  fail "(c) A3 PDF count under assignments/ is $a3_copies (expected 1) and/or commit 49589aa missing from its followed history"
fi

# (d) assignments/ holds exactly the canonical group-assignment folders; every
#     folder name follows a<n>_<slug> (no spaces) and carries an assignment.md
assign_expected="$(printf 'a3_sem_rule_change_analysis\na4_problem_understanding_and_model\na6_system_model_v2\n' | sort)"
assign_entries="$(find assignments -mindepth 1 -maxdepth 1 -printf '%f\n' 2>/dev/null | sort)"
d_problems=""
while IFS= read -r entry; do
  [ -n "$entry" ] || continue
  if ! printf '%s\n' "$assign_expected" | grep -qxF -- "$entry"; then
    d_problems="${d_problems}unexpected folder '${entry}' (not part of the canonical layout); "
  fi
  if [[ "$entry" =~ [[:space:]] ]]; then
    d_problems="${d_problems}folder name '${entry}' contains a space; "
  elif [[ ! "$entry" =~ ^a[0-9]+_[a-z0-9]+(_[a-z0-9]+)*$ ]]; then
    d_problems="${d_problems}folder name '${entry}' does not match a<n>_<slug>; "
  fi
  [ -f "assignments/$entry/assignment.md" ] || d_problems="${d_problems}folder '${entry}' has no assignment.md; "
done <<EOF
$assign_entries
EOF
if [ -z "$d_problems" ]; then
  pass "(d) assignments/ contains exactly the 3 group-assignment folders (a3_sem_rule_change_analysis, a4_problem_understanding_and_model, a6_system_model_v2); every name matches a<n>_<slug> without spaces and has an assignment.md"
else
  fail "(d) assignments/ layout deviates:${d_problems}expected exactly: $(echo "$assign_expected" | tr '\n' ' ')"
fi

# (e) README keywords present AND no absolute /home/edgar paths in the contract files
kw_ok=1
for kw in "never settlers" "kotar.app" "SysOn" "misc/NASA_MBSE_a5_Cheat_Sheet1.pdf"; do
  grep -qF -- "$kw" README.md || { kw_ok=0; echo "      missing keyword in README.md: $kw"; }
done
CONTRACT_FILES=(README.md AGENTS.md HISTORY.md \
  assignments/a3_sem_rule_change_analysis/assignment.md \
  assignments/a4_problem_understanding_and_model/assignment.md \
  assignments/a4_problem_understanding_and_model/model/README.md \
  misc/VERIFICATION.md)
files_ok=1
for f in "${CONTRACT_FILES[@]}"; do
  [ -f "$f" ] || { files_ok=0; echo "      contract file missing: $f"; }
done
abs_hits="$(grep -rn -- '/home/edgar' "${CONTRACT_FILES[@]}" 2>/dev/null || true)"
if [ "$kw_ok" -eq 1 ] && [ "$files_ok" -eq 1 ] && [ -z "$abs_hits" ]; then
  pass "(e) README keywords ('never settlers', 'kotar.app', 'SysOn', cheat-sheet ref) each found; no '/home/edgar' in any of the 7 contract files"
else
  fail "(e) missing README keyword(s) and/or '/home/edgar' hit(s) and/or missing contract file(s) — see details above"
fi

# (f) HISTORY.md has dated entries (>=1x 2026-11-18) and a Current-status section
if grep -q '2026-11-18' HISTORY.md && grep -qi '^## .*Current status' HISTORY.md; then
  pass "(f) HISTORY.md contains dated entries (>=1x 2026-11-18) and a Current-status section"
else
  fail "(f) HISTORY.md missing dated entries or Current-status section"
fi

# (g) .gitignore contains no active *.sysml ignore pattern (model files stay tracked);
#     comment lines (starting with #) are documentation, not patterns
if grep -v '^#' .gitignore | grep -qiE '\*\.sysml'; then
  fail "(g) .gitignore contains an active *.sysml pattern — model files would stop being tracked"
else
  pass "(g) .gitignore contains no active *.sysml pattern (model files stay tracked)"
fi

# (h) working tree clean
if [ -z "$(git status --porcelain)" ]; then
  pass "(h) git status --porcelain is empty (clean working tree)"
else
  fail "(h) working tree dirty:"
  git status --porcelain | sed 's/^/      /'
fi

# (i) origin/main stays an ancestor of the local HEAD — a durable, state-agnostic
#     invariant that survives future owner pushes as long as the local history
#     stays a fast-forward of the remote. The ahead-count is reported
#     informationally only; no SHA and no minimum count is asserted.
origin_actual="$(git rev-parse --verify -q origin/main 2>/dev/null || echo 'unavailable')"
if git merge-base --is-ancestor origin/main HEAD 2>/dev/null; then
  ahead="$(git rev-list --count origin/main..HEAD 2>/dev/null || echo 0)"
  pass "(i) origin/main ($origin_actual) is an ancestor of the local HEAD (fast-forward history); local main is $ahead commit(s) ahead of origin/main — unpushed"
else
  fail "(i) origin/main ($origin_actual) is NOT an ancestor of the local HEAD — the local history diverged from the remote (non-fast-forward); reconcile the histories before pushing"
fi

echo
if [ "$FAILURES" -eq 0 ]; then
  echo "RESULT: 9/9 checks PASS — repo state matches its documentation."
  exit 0
else
  echo "RESULT: $FAILURES check(s) FAILed — fix the deviations above, then re-run."
  exit 1
fi
