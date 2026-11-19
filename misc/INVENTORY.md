# INVENTORY.md — Provenance & Decision Log

This file documents where every adopted file came from, what was deliberately
**not** adopted (and why), which gaps exist, and which decisions were made
while restructuring this repository. It is written so that both humans and
AI agents can trace every artifact back to its origin — and so that nothing
invented ever enters the repo.

- Run / date: 2026-11-18 (initial inventory) and 2026-11-19 (consolidation
  round after the repository owner's commit `d63ce6f`), session
  `lightning_122`, agent `lightning_122_worker_agent`
- Working tree: `/home/edgar/vs_code/MBSE-Assignments` (branch `main`)
- Originals outside the repo (in `~/Downloads` and in
  `~/vs_code/infotechnik/module/mbse/`) were **never modified** — only read/copied.
- No push was performed; the repository owner does the final push themselves.

## 1. Files in `~/Downloads` with mtime ≥ 2026-11-18 19:15 (user's relevance cutoff)

5 files matched at inventory time (rows 1–5); one further session artifact
was observed during the session and is recorded as row 6 so the count stays
honest — see the state-update note below the table. A later owner download
is recorded as row 7 (added in the consolidation round of 2026-11-19). Each
file got an explicit decision:

| # | File (original name in `~/Downloads`) | mtime (2026-11-18) | Decision | Destination / Reason |
|---|---------------------------------------|--------------------|----------|----------------------|
| 1 | `MBSE_A4_Never_Settlers.pdf` | 19:24 | **Adopted (copy)** | → `assignments/a4_problem_understanding_and_model/MBSE_A4_Never_Settlers.pdf`. The group's own A4 submission/analysis document (reading adopted as D11, confidence medium — evidence recorded there); the lecturer's original A4 task sheet is **not** in the repo. Original stays untouched in `~/Downloads`. |
| 2 | `WhatsApp Image 2026-11-05 at 13.10.45.jpeg` | 19:25 | **Not adopted** | Screenshot of A3-PDF pages — redundant; the A3 PDF itself is in the repo (in Git history since commit `49589aa`). |
| 3 | `WhatsApp Image 2026-11-05 at 13.10.45(1).jpeg` | 19:25 | **Not adopted** | Same as #2: screenshot of A3-PDF pages, redundant. |
| 4 | `tabs_backup_2026-11-18T18-31-42-857Z.txt` | 19:31 | **Not adopted** | Browser tab-list backup with no MBSE relevance. |
| 5 | `Allgemeiner_Dateiordner.zip` | 19:42 | **Not adopted as ZIP; contents partially adopted** | The 6 course-script PDFs inside were extracted and copied to `course_material/scripts/` (see §2). The ZIP itself is NOT in the repo because it also contains `archive_filelist.csv` (see below). |
| 6 | `tabs_backup_2026-11-18T19-34-30-602Z.txt` | 20:34 | **Not adopted** (session artifact) | Second browser tab-list backup, observed during the session (mtime 2026-11-18 20:34:30); no MBSE relevance, deliberately never adopted or committed. |
| 7 | `MBSE_A3_System_model_Autonomous Driving_Never_Settlers.zip` | 23:03 | **Adopted (extracted)** | The owner's model export. Its four members — `Autonomous_Vehicle_Never_Settlers_model file`, `System_model_Autonomous Driving_Never_Settlers.png` and `.svg`, plus a copy of `MBSE_A3_Never_Settlers_SEM_Analysis.pdf` — were extracted by the owner into a legacy folder inside the repo on 2026-11-18 and are now consolidated at `assignments/a3_sem_rule_change_analysis/model/` (see §2 and §4 D12). The ZIP's copy of the SEM analysis PDF is the duplicate that was removed (§4 D13). The ZIP itself is **not** in the repo. |

**About `archive_filelist.csv` (inside the ZIP, deliberately not copied anywhere):**
a 737-byte CSV with 7 lines (header + 6 entries), columns
`Name;Size;First name;Last name;Downloads;Date;Path`. It is the download log
export of the file-sharing service the lecturer used and contains a **third
person's real name and per-file download counters**. For privacy reasons it
is not adopted into the repository in any form. The original remains inside
the untouched ZIP in `~/Downloads`. The person's name is intentionally not
reproduced in this file either.

**State update on the `~/Downloads` folder (observed 2026-11-18 ~21:05,
during patch round R1):** both browser-tab backups recorded above (row 4,
mtime 19:31, and row 6, mtime 20:34:30) are **no longer present** in
`~/Downloads` — the folder's contents changed after the inventory (directory
mtime 2026-11-18 21:00:01). They were session artifacts with no MBSE
relevance and were never adopted. The five remaining relevant files
(rows 1–3, 5 and 7) are still present unchanged (re-checked 2026-11-19).
Recorded here so the file count and the folder state stay honest (see D3).

## 2. Adopted files — provenance (source → destination, md5 for binary copies)

| Source path (outside repo, untouched) | Destination in repo | md5 |
|---------------------------------------|---------------------|-----|
| `/home/edgar/Downloads/MBSE_A4_Never_Settlers.pdf` | `assignments/a4_problem_understanding_and_model/MBSE_A4_Never_Settlers.pdf` | `2836e79b6864f93f6eaff29185a22788` |
| `/home/edgar/vs_code/infotechnik/module/mbse/NASA_MBSE_a5_Cheat_Sheet1.pdf` | `misc/NASA_MBSE_a5_Cheat_Sheet1.pdf` | `76bbbfcfe2d47566ae5ae97594fba356` |
| `/home/edgar/vs_code/infotechnik/module/mbse/NASA_MBSE_a5_human_ai.pdf` | **no longer in the repo** — the repository owner removed the copy in commit `d63ce6f` (2026-11-19); the original outside the repo is untouched | `8ff50596a8c28821abeb56ca3abfe3fa` |
| `/home/edgar/vs_code/infotechnik/module/mbse/NASA_Systems_Modeling_Handbook_Kurzfassung.pdf` | `misc/NASA_Systems_Modeling_Handbook_Kurzfassung.pdf` | `90019c0886ce1307406bcb84a73d929f` |
| `/home/edgar/Downloads/Allgemeiner_Dateiordner.zip` → entry `MBSE4B_0_Course-Intro.pdf` | `course_material/scripts/MBSE4B_0_Course-Intro.pdf` | `f5f66d6313cca8303ddd58a3411b4472` |
| `/home/edgar/Downloads/Allgemeiner_Dateiordner.zip` → entry `MBSE4B_1_Fundamentals+Methodologies.pdf` | `course_material/scripts/MBSE4B_1_Fundamentals+Methodologies.pdf` | `3a61854dc9f266b3dbccceb698cb38aa` |
| `/home/edgar/Downloads/Allgemeiner_Dateiordner.zip` → entry `MBSE4B_2_Lifecycles+Languages.pdf` | `course_material/scripts/MBSE4B_2_Lifecycles+Languages.pdf` | `a34260621150f2b177633874a0c3d7bc` |
| `/home/edgar/Downloads/Allgemeiner_Dateiordner.zip` → entry `MBSE4B_3_NGO+Requirements.pdf` | `course_material/scripts/MBSE4B_3_NGO+Requirements.pdf` | `1f8a729a6a1e18075965bdc4f263ef50` |
| `/home/edgar/Downloads/Allgemeiner_Dateiordner.zip` → entry `MBSE4B_4_Functions+MoreRequirements.pdf` | `course_material/scripts/MBSE4B_4_Functions+MoreRequirements.pdf` | `43133f9b368f39c8ee7716b3f4f2f864` |
| `/home/edgar/Downloads/Allgemeiner_Dateiordner.zip` → entry `MBSE4B_5_Architecting+Modelling.pdf` | `course_material/scripts/MBSE4B_5_Architecting+Modelling.pdf` | `75aaa0aa5437087be5a0460ddc846ad0` |
| `/home/edgar/Downloads/MBSE_A3_System_model_Autonomous Driving_Never_Settlers.zip` → entry `Autonomous_Vehicle_Never_Settlers_model file` | `assignments/a3_sem_rule_change_analysis/model/MBSE_A3_Never_Settlers_model.sysml` | `c5a827abc6f2ac37e6f8b1c6d9eb37e5` |
| `/home/edgar/Downloads/MBSE_A3_System_model_Autonomous Driving_Never_Settlers.zip` → entry `System_model_Autonomous Driving_Never_Settlers.png` | `assignments/a3_sem_rule_change_analysis/model/MBSE_A3_Never_Settlers_model.png` | `38dc8fd67ad7c2c8c64a0ae5262305f1` |
| `/home/edgar/Downloads/MBSE_A3_System_model_Autonomous Driving_Never_Settlers.zip` → entry `System_model_Autonomous Driving_Never_Settlers.svg` | `assignments/a3_sem_rule_change_analysis/model/MBSE_A3_Never_Settlers_model.svg` | `1de41bf0407552bc2d5bb79917deacaa` |
| owner download, rendered via Firefox (PDF metadata: Creator `Mozilla Firefox 156.0`, creation date 2026-11-18 22:58:38 CET) and placed by the owner directly into the repo; the downloaded source file was **not identifiable** in `~/Downloads` on 2026-11-19 | `course_material/shell_eco/Shell Eco-marathon 2027 Official Rules, Chapter I - shell-eco-marathon-2027-official-rules-chapter-one.pdf` | `269ad7ea68d2b7d39381a83af040e7dd` |

**Moved (not copied) inside the repo:**

- `MBSE_A3_Never_Settlers_SEM_Analysis.pdf` — moved with `git mv` from the repo
  root to `assignments/a3_sem_rule_change_analysis/`. Git blob SHA
  `3fcf0f319e8b18c191de36a9deade190de74baa1` unchanged (md5
  `6d57e24cc5135352335bd2621fe45cbb`), file history traceable back to commit
  `49589aa` via `git log --follow`.
- A3 model assets — moved with `git mv` on 2026-11-19 from the legacy folder
  `assignments/MBSE_A3_System_model_Autonomous Driving_Never_Settlers/` to
  `assignments/a3_sem_rule_change_analysis/model/`: the textual SysML v2
  export as `MBSE_A3_Never_Settlers_model.sysml` (Git blob SHA
  `ffcb5f6cba788e4a3c43ffcef43f2502222878a5`) and the renderings as
  `MBSE_A3_Never_Settlers_model.png` (blob SHA
  `ce1e818bdff811952d55c877718323e9bdedbef0`) and
  `MBSE_A3_Never_Settlers_model.svg` (blob SHA
  `fe3ee1ad39f604ff97f304a94b0170d809feb930`). All three blob SHAs are
  unchanged — the files are byte-identical to their state in commit
  `d63ce6f`; only the path and the file names changed.

## 3. Documented gaps (honest state — nothing invented, nothing backfilled)

The numbered entries below record the initial inventory. In the working tree
on 2026-11-18, the user supplied an A3 textual model export and a 2027 Chapter I
PDF. The A6 report and model use these inputs and the official 2027 Chapter
IV. The original A4 model file remains outstanding. The A6 category, energy
class, event details and verification gaps are listed in
[the A6 contract](../assignments/a6_system_model_v2/assignment.md#open).

1. **The A4 SysML model file is still missing — other model files exist.**
   The SysML model referenced in `MBSE_A4_Never_Settlers.pdf`
   (`MBSE_A4_Never_Settlers_model.sysml`, Part A) was never exported — it
   presumably existed only inside kotar.app. Therefore
   `assignments/a4_problem_understanding_and_model/model/` contains only the
   placeholder `model/README.md` — the model file itself is missing; export
   instructions: `model/README.md`. *(The earlier wording of this gap — "no
   `.sysml`, `.sysmlx`, `.xmi` or `.kerml` file exists anywhere on this
   machine" — was true on 2026-11-18 and is stale since: the repo now holds
   the A3 model export and the A6 model.)*
2. **The complete rulebook is not in the repo.** The 2027 **Chapter I** is
   available locally (`course_material/shell_eco/`). The event-specific
   **Chapter II** and the **Chapter IV** (Autonomous Driving Competition)
   are referenced by the A6 contract and were consulted from the publisher's
   site, but they are **not** stored in this repository — so no claim about
   the complete rule set can be made from the repo alone. The A3 rule-change
   analysis still has to work from the A3 PDF and its cited sources.
3. **The A3 PDF is AI-generated as a whole — not only its "2027 Rules"
   column.** The PDF itself carries the disclaimer *"AI generated content
   using Gemini AI"*, printed directly next to the prompt line
   ("Comparison of rule/regulation changes between 2025 Vs 2026 Vs 2027");
   the disclaimer therefore covers the entire document, the 2025/2026
   contents included. Treat the whole A3 document as an **unverified
   draft**, not as authoritative rule text.
4. **The A3 model export is a raw tool export.** It defines the vehicle and
   its six logical parts (perception, autonomous control, vehicle motion,
   safety, electrical energy, vehicle platform) but carries no requirements,
   no allocations and no functional flows. The requirement baseline and the
   functional analysis live in the A6 model
   (`assignments/a6_system_model_v2/model/MBSE_A6_Never_Settlers.sysml`).

## 4. Documented decisions

- **D1 — Documentation language: English.** The group's artifacts (A3/A4
  PDFs) and the course material are in English; the repo is public and
  agent-facing. Switching the language later is pure text work.
- **D2 — Only assignments with actual artifacts get assignment subfolders.**
  Those are the group assignments with artifacts on this machine: A3, A4 and
  A6 (A6 added by the repository owner in commit `d63ce6f`). A1/A2/A5 have
  no artifacts on this machine; no folders are invented for them — they are
  recorded as gaps in README/HISTORY instead (see README/HISTORY gaps).
- **D3 — No false statements: gaps are documented, not invented.** Wherever
  evidence is missing, the documentation records the gap with its
  confidence level instead of filling it with plausible-sounding content
  (missing model file, missing original task sheets, A1/A2/A5 with no
  artifacts, dates that cannot be proven). The same applies to file counts
  and folder state: the `~/Downloads` contents changed during the session
  (the tab backups were gone by ~21:00) and this is recorded as a state
  update in §1 rather than silently keeping a stale count.
- **D4 — NASA cheat sheet adopted as a copy.** The original at
  `/home/edgar/vs_code/infotechnik/module/mbse/NASA_MBSE_a5_Cheat_Sheet1.pdf`
  stays untouched.
- **D5 — `git mv` for the A3 PDF (history preservation), copies for
  everything from `~/Downloads`.** Renaming via Git keeps the file history
  traceable; downloads are copied so the originals stay untouched.
- **D6 — Privacy exclusions.** Three classes of material are deliberately
  kept out of the repository in any form: `archive_filelist.csv` (a third
  person's real name plus per-file download counters, §1), the two
  WhatsApp JPEGs (screenshots of the A3 PDF — redundant because the PDF
  itself is in Git history since `49589aa`, and the private chat context
  is not ours to publish), and the browser-tab backups (private session
  artifacts, §1 rows 4 and 6).
- **D7 — `*.sysml` is NOT ignored in `.gitignore`.** Assignment A4 explicitly
  requires keeping model files in Git for history and diffs.
- **D8 — No push by this session; the owner performs the push.** The
  repository owner pushed commit `d63ce6f` ("initial folder structure &
  assignment 6", 2026-11-19 00:52 CET) themselves, so `origin/main` is
  `d63ce6fb838bcff8df436a459b47196dd044306f`. This session never pushes and
  never rewrites history.
- **D9 — Commit author convention.** Every commit executed by this session
  uses the author and committer identity
  `lightning_122_worker_agent <166285592+EdiDorner@users.noreply.github.com>`
  (template_session_agent convention), so the Git history shows who
  executed what; the repository owner's own commits keep their original
  identity (see `49589aa`).
- **D10 — Rights notice.** The rights situation of the adopted course
  material is addressed in the `## Rights notice` section of `README.md`
  (added in commit `bed4efd`): the material is kept for the internal use
  of team never settlers, and the repository owner confirms the
  distribution rights before any push to the public remote. No legal
  advice is given.
- **D11 — Reading of the A4 PDF: the group's own submission, not the task
  sheet.** The A4 PDF is documented as the group's own A4
  submission/analysis document (confidence: medium). Evidence: the PDF is
  structured as an analysis product — "3. Key steps we took",
  "4. Where we are uncertain", "Model mapping (Session 3)" — and contains
  no task list, no deadlines and no grading criteria; the author field is
  "Un-named" (`pdfinfo`). The lecturer's original A4 task sheet is not in
  the repo and its location is unknown. Cross-referenced in
  `assignments/a4_problem_understanding_and_model/assignment.md` (Open)
  and in the README status table.
- **D12 — The A3 model assets live in
  `assignments/a3_sem_rule_change_analysis/model/`.** The owner's model
  export (textual SysML v2) and its PNG/SVG renderings were moved with
  `git mv` from the legacy folder
  `assignments/MBSE_A3_System_model_Autonomous Driving_Never_Settlers/`
  — whose name contained spaces — to the canonical A3 path
  `assignments/a3_sem_rule_change_analysis/model/`, renamed to
  `MBSE_A3_Never_Settlers_model.sysml`, `…_model.png` and `…_model.svg`.
  All three files are byte-identical to their state in commit `d63ce6f`
  (Git blob SHAs unchanged); nothing was edited. Reason: one folder per
  group assignment, model files under `model/`, no spaces in folder names
  (AGENTS.md naming rule) — and the A3 model belongs next to the A3
  analysis it belongs to.
- **D13 — Obsolete and redundant material removed on the owner's explicit
  order of 2026-11-19.** Two files were deleted:
  (a) the internal A6 discussion draft `MBSE_A6_Never_Settlers.pdf`
  (231 646 bytes, md5 `893756bea95d7534d90f97a020f950d8`) from the legacy
  folder — named by the owner as obsolete material. It was a colleague's
  worked-out solution, reviewed as an input for A6 and cited as source [8]
  in the A6 report; it remains retrievable in Git history at commit
  `d63ce6f`.
  (b) the byte-identical duplicate of `MBSE_A3_Never_Settlers_SEM_Analysis.pdf`
  (md5 `6d57e24cc5135352335bd2621fe45cbb`, verified identical to the
  canonical copy in `assignments/a3_sem_rule_change_analysis/`) from the
  legacy folder. The canonical copy is untouched and its history stays
  traceable to commit `49589aa`.
  The A6 deliverables themselves (`assignments/a6_system_model_v2/MBSE_A6_Never_Settlers.pdf`
  and `model/MBSE_A6_Never_Settlers.sysml`) were **not** touched — they
  remain byte-identical to commit `d63ce6f`.
- **D14 — Rulebook coverage is Chapter I only.** The repo stores the 2027
  Chapter I under `course_material/shell_eco/`. Chapter II (event-specific
  values) and Chapter IV (Autonomous Driving Competition) are referenced by
  the A6 contract but are not stored, so no repo document claims the
  complete rule set is present. The three open decisions — event, vehicle
  category and energy class — are documented in `README.md` and in the A6
  contract (Open section).
