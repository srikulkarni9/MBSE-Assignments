# INVENTORY.md — Provenance & Decision Log

This file documents where every adopted file came from, what was deliberately
**not** adopted (and why), which gaps exist, and which decisions were made
while restructuring this repository. It is written so that both humans and
AI agents can trace every artifact back to its origin — and so that nothing
invented ever enters the repo.

- Run / date: 2026-11-18, session `lightning_122`, agent `lightning_122_worker_agent`
- Working tree: `/home/edgar/vs_code/MBSE-Assignments` (branch `main`)
- Originals outside the repo (in `~/Downloads` and in
  `~/vs_code/infotechnik/module/mbse/`) were **never modified** — only read/copied.
- No push was performed; the repository owner does the final push themselves.

## 1. Files in `~/Downloads` with mtime ≥ 2026-11-18 19:15 (user's relevance cutoff)

5 files matched at inventory time (rows 1–5); one further session artifact
was observed during the session and is recorded as row 6 so the count stays
honest — see the state-update note below the table. Each file got an
explicit decision:

| # | File (original name in `~/Downloads`) | mtime (2026-11-18) | Decision | Destination / Reason |
|---|---------------------------------------|--------------------|----------|----------------------|
| 1 | `MBSE_A4_Never_Settlers.pdf` | 19:24 | **Adopted (copy)** | → `assignments/a4_problem_understanding_and_model/MBSE_A4_Never_Settlers.pdf`. The group's own A4 submission/analysis document (reading adopted as D11, confidence medium — evidence recorded there); the lecturer's original A4 task sheet is **not** in the repo. Original stays untouched in `~/Downloads`. |
| 2 | `WhatsApp Image 2026-11-05 at 13.10.45.jpeg` | 19:25 | **Not adopted** | Screenshot of A3-PDF pages — redundant; the A3 PDF itself is in the repo (in Git history since commit `49589aa`). |
| 3 | `WhatsApp Image 2026-11-05 at 13.10.45(1).jpeg` | 19:25 | **Not adopted** | Same as #2: screenshot of A3-PDF pages, redundant. |
| 4 | `tabs_backup_2026-11-18T18-31-42-857Z.txt` | 19:31 | **Not adopted** | Browser tab-list backup with no MBSE relevance. |
| 5 | `Allgemeiner_Dateiordner.zip` | 19:42 | **Not adopted as ZIP; contents partially adopted** | The 6 course-script PDFs inside were extracted and copied to `course_material/scripts/` (see §2). The ZIP itself is NOT in the repo because it also contains `archive_filelist.csv` (see below). |
| 6 | `tabs_backup_2026-11-18T19-34-30-602Z.txt` | 20:34 | **Not adopted** (session artifact) | Second browser tab-list backup, observed during the session (mtime 2026-11-18 20:34:30); no MBSE relevance, deliberately never adopted or committed. |

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
relevance and were never adopted. The four remaining relevant files
(rows 1–3 and 5) are still present unchanged. Recorded here so the file
count and the folder state stay honest (see D3).

## 2. Adopted files — provenance (source → destination, md5 for binary copies)

| Source path (outside repo, untouched) | Destination in repo | md5 |
|---------------------------------------|---------------------|-----|
| `/home/edgar/Downloads/MBSE_A4_Never_Settlers.pdf` | `assignments/a4_problem_understanding_and_model/MBSE_A4_Never_Settlers.pdf` | `2836e79b6864f93f6eaff29185a22788` |
| `/home/edgar/vs_code/infotechnik/module/mbse/NASA_MBSE_a5_Cheat_Sheet1.pdf` | `misc/NASA_MBSE_a5_Cheat_Sheet1.pdf` | `76bbbfcfe2d47566ae5ae97594fba356` |
| `/home/edgar/vs_code/infotechnik/module/mbse/NASA_MBSE_a5_human_ai.pdf` | `misc/NASA_MBSE_a5_human_ai.pdf` | `8ff50596a8c28821abeb56ca3abfe3fa` |
| `/home/edgar/vs_code/infotechnik/module/mbse/NASA_Systems_Modeling_Handbook_Kurzfassung.pdf` | `misc/NASA_Systems_Modeling_Handbook_Kurzfassung.pdf` | `90019c0886ce1307406bcb84a73d929f` |
| `/home/edgar/Downloads/Allgemeiner_Dateiordner.zip` → entry `MBSE4B_0_Course-Intro.pdf` | `course_material/scripts/MBSE4B_0_Course-Intro.pdf` | `f5f66d6313cca8303ddd58a3411b4472` |
| `/home/edgar/Downloads/Allgemeiner_Dateiordner.zip` → entry `MBSE4B_1_Fundamentals+Methodologies.pdf` | `course_material/scripts/MBSE4B_1_Fundamentals+Methodologies.pdf` | `3a61854dc9f266b3dbccceb698cb38aa` |
| `/home/edgar/Downloads/Allgemeiner_Dateiordner.zip` → entry `MBSE4B_2_Lifecycles+Languages.pdf` | `course_material/scripts/MBSE4B_2_Lifecycles+Languages.pdf` | `a34260621150f2b177633874a0c3d7bc` |
| `/home/edgar/Downloads/Allgemeiner_Dateiordner.zip` → entry `MBSE4B_3_NGO+Requirements.pdf` | `course_material/scripts/MBSE4B_3_NGO+Requirements.pdf` | `1f8a729a6a1e18075965bdc4f263ef50` |
| `/home/edgar/Downloads/Allgemeiner_Dateiordner.zip` → entry `MBSE4B_4_Functions+MoreRequirements.pdf` | `course_material/scripts/MBSE4B_4_Functions+MoreRequirements.pdf` | `43133f9b368f39c8ee7716b3f4f2f864` |
| `/home/edgar/Downloads/Allgemeiner_Dateiordner.zip` → entry `MBSE4B_5_Architecting+Modelling.pdf` | `course_material/scripts/MBSE4B_5_Architecting+Modelling.pdf` | `75aaa0aa5437087be5a0460ddc846ad0` |

**Moved (not copied) inside the repo:**
`MBSE_A3_Never_Settlers_SEM_Analysis.pdf` — moved with `git mv` from the repo
root to `assignments/a3_sem_rule_change_analysis/`. Git blob SHA
`3fcf0f319e8b18c191de36a9deade190de74baa1` unchanged (md5
`6d57e24cc5135352335bd2621fe45cbb`), file history traceable back to commit
`49589aa` via `git log --follow`.

## 3. Documented gaps (honest state — nothing invented, nothing backfilled)

1. **No SysML model file exists anywhere on this machine.** No `.sysml`,
   `.sysmlx`, `.xmi` or `.kerml` file was found (verified at startup gate,
   re-checked 2026-11-18). The SysML model referenced in
   `MBSE_A4_Never_Settlers.pdf` (`MBSE_A4_Never_Settlers_model.sysml`,
   Part A) was never exported — it presumably existed only inside kotar.app.
   Therefore `assignments/a4_problem_understanding_and_model/model/` is
   currently empty; export instructions follow in Phase 2
   (`model/README.md`).
2. **No separate PDF with the Shell Eco Marathon rulebook exists.**
   The rule-change analysis (Assignment A3) has to work from the A3 PDF and
   its cited sources; no dedicated rulebook document was found or downloaded.
3. **The A3 PDF is AI-generated as a whole — not only its "2027 Rules"
   column.** The PDF itself carries the disclaimer *"AI generated content
   using Gemini AI"*, printed directly next to the prompt line
   ("Comparison of rule/regulation changes between 2025 Vs 2026 Vs 2027");
   the disclaimer therefore covers the entire document, the 2025/2026
   contents included. Treat the whole A3 document as an **unverified
   draft**, not as authoritative rule text.

## 4. Documented decisions

- **D1 — Documentation language: English.** The group's artifacts (A3/A4
  PDFs) and the course material are in English; the repo is public and
  agent-facing. Switching the language later is pure text work.
- **D2 — Only A3 and A4 get assignment subfolders.** Those are the group
  assignments with actual artifacts (evidence). A1/A2/A5 have no artifacts
  on this machine; no folders are invented for them — they are recorded as
  gaps in README/HISTORY instead (Phase 2).
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
- **D8 — No push.** The repository owner performs the final push themselves;
  `origin/main` remains `6fffee1144a839df98e63976391c9d5f620e73e3`.
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
