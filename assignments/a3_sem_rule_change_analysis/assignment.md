# Assignment A3 — SEM rule-change analysis

Folder: `assignments/a3_sem_rule_change_analysis/`
Files in this folder: `MBSE_A3_Never_Settlers_SEM_Analysis.pdf`

> Confidence legend used in this file:
> **high** = directly evidenced by a file in this repo or by its metadata ·
> **medium** = plausible reading of the evidence, alternatives possible ·
> **low** = reconstruction / assumption.

## Required

*(The original A3 assignment sheet is not in the repository — this section
is a reconstruction from indirect evidence. Nothing here is proven.)*

- Analyse the rule/regulation changes of the Shell Eco-marathon between
  seasons (2025 → 2026 → 2027), especially for the autonomous competition.
  *(low — reconstructed from the delivered PDF's content and the folder
  name; the task text itself is missing)*
- Produce an analysis document that later assignments can cite as evidence
  for rule changes. *(medium — the A4 PDF cites "A3 comparison" as evidence
  for CR-3, CR-4 and CR-7)*
- Deliver a SysML v2 model element set (the A4 PDF refers to "the A3
  model", which contains an `ElectricalEnergySystem`). *(medium —
  referenced by the A4 PDF; no A3 model file exists in the repo, so this
  cannot be verified)*

## Delivered

- `MBSE_A3_Never_Settlers_SEM_Analysis.pdf` (2 pages, A4) with two
  comparison tables: *(high — full text extracted from the PDF)*
  1. "Key Rule Changes: Shell Eco-marathon Autonomous Competition
     (2025 vs. 2026)": competition scope & structure (two sub-challenges
     APC/AUC → unified ADC, virtual CARLA/ROS simulation challenge removed,
     100 % focus on the physical vehicle); vehicle eligibility (urban
     concept only, max. 12 teams → prototype and urban concept across all
     energy classes); safety driver & control protocol (safety driver
     inside, hands on two independent hand-grip safety devices away from
     the steering wheel); autonomous state signalling (top-mounted orange
     indicator light visible from 50 m in daylight, ICS-controlled, plus a
     normally-open relay for judges); evaluation & ranking (separate
     virtual/physical scoring → unified ranking by efficiency, sectors
     completed and business presentation).
  2. "Evolution of Shell Eco-marathon Rules (2025 vs. 2026 vs. 2027)":
     energy classes & fuel scope (hydrogen added as fuel type within ICE);
     team entry & multi-vehicle exceptions (temporary exception through
     2028: second ICE vehicle in the same category running on hydrogen);
     driver weight & ballast (max. three locations, 7 mm seal hole for
     tamper-proof wire seal); emergency shutdown & dead-man switch
     (physical air gap, normally-open relays, hand-operated dead-man
     device, foot-operated pedals banned); global championship
     qualification (70 % on-track efficiency + 30 % off-track awards for
     SEM Poland 2026 slots; 2027 fully integrated global structure).
- The PDF carries the disclaimer **"AI generated content using Gemini
  AI"** — the 2027 column is therefore an **unverified baseline**, not
  authoritative rule text. *(high — printed in the PDF itself; see also
  `misc/INVENTORY.md` §3.3)*
- File metadata: created 2026-10-26 16:36 CET, author field "sridhar
  kulkarni", Microsoft Word for Microsoft 365. *(high — `pdfinfo`)*
- Uploaded to the GitHub repository on 2026-11-16 by account srikulkarni9
  (commit `49589aa`, "Add files via upload"); moved into this folder via
  `git mv` in commit `92e94b5` with history preserved. *(high — git log)*

## Open

- **The reading of the PDF is not provable from the file alone** — whether
  it is (a) the **delivered group result** or (b) **provided material**
  (e.g. an example analysis by the lecturer). Both readings with their
  evidence:
  - (a) **Delivered group result** *(medium — the more likely reading)*:
    the file name contains the team name ("Never_Settlers"); the content
    is an analysis product, not a task description (no tasks, deadlines or
    deliverable lists); it carries an AI-generated disclaimer together
    with the prompt used — typical of group-produced work; the A4 PDF
    cites it as prior team work ("A3 comparison"); it was uploaded into
    the group's own GitHub repo by the repo owner account.
  - (b) **Provided material** *(low — cannot be excluded)*: the PDF
    metadata author "sridhar kulkarni" matches the GitHub account name
    that owns the repo (srikulkarni9, commit `49589aa`); if that person is
    the lecturer rather than a group member, the file could be
    lecturer-provided. The repository alone cannot settle the person's
    role. *(low — open question, needs confirmation from the team)*
- The original A3 assignment sheet (task text) is not in the repo — the
  Required section above is a reconstruction. *(high that it is missing)*
- The "A3 model" referenced by the A4 PDF (SysML v2, contains an
  `ElectricalEnergySystem`) has no file in the repo — unknown whether it
  was ever exported or exists only inside a modelling tool. *(medium —
  gap; `misc/INVENTORY.md` §3.1 verified no model file on this machine)*
- No dedicated Shell Eco-marathon rulebook PDF exists in the repo; the
  analysis had to work from the sources it cites. *(high —
  `misc/INVENTORY.md` §3.2)*
- The 2027 column of the tables is AI-generated (disclaimer in the PDF) —
  a real 2027 rules check is still open; matches uncertainty U-1 in the
  A4 PDF. *(high that it is unverified)*

## Sources

- `assignments/a3_sem_rule_change_analysis/MBSE_A3_Never_Settlers_SEM_Analysis.pdf`
  — full text and metadata (pdftotext / pdfinfo, extracted 2026-11-18).
  *(high)*
- `assignments/a4_problem_understanding_and_model/MBSE_A4_Never_Settlers.pdf`
  — cross-references ("A3 comparison" as evidence for CR-3/CR-4/CR-7, "the
  A3 model", U-1). *(high)*
- `misc/INVENTORY.md` §3 — documented gaps (no model file, no rulebook
  PDF, AI disclaimer). *(high)*
- Git history: `49589aa` (upload), `92e94b5` (git mv into this folder).
  *(high)*
