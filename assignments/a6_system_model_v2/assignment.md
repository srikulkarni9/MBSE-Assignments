# Assignment A6 — System model v2

## Required

The team extends its existing vehicle model. In practical terms, agree on the
first set of system requirements, model what the vehicle does at its boundary,
then open the box and show how its internal functions work together.
*(high — [assignment brief, slide 52](../../course_material/scripts/MBSE4B_5_Architecting%2BModelling.pdf#page=52) and [team-work summary, slide 54](../../course_material/scripts/MBSE4B_5_Architecting%2BModelling.pdf#page=54))*

| Task | What it means for our team |
| --- | --- |
| Review previous work with the cheat sheets and update the model. *(high — slide 52)* | Use the A5 cheat-sheet guidance to review the A3 model and A4 problem definition. The lecturer also asks whether the cheat sheets may be shared with the group. |
| Sort the requirements pool. *(high — slide 52)* | Organise candidate requirements by source and applicability to our vehicle. Identify which ones depend on the competition, vehicle category or an unresolved rule version. [Session 4, slide 62](../../course_material/scripts/MBSE4B_4_Functions%2BMoreRequirements.pdf#page=62) |
| Set the first system requirements baseline. *(high — slide 52)* | Agree on the set of applicable, checked requirements the team will design against. Record which candidates still need a decision and preserve their source references. [Session 5, slide 31](../../course_material/scripts/MBSE4B_5_Architecting%2BModelling.pdf#page=31) |
| Model the system as a **black box** and consider alternatives. *(high — slide 52)* | Draw the vehicle boundary and show the external actors, inputs and outputs. For example, show what information enters from the environment and which signals cross the boundary to or from the safety driver. Consider whether alternative scopes would change those exchanges. [Session 5, slide 26](../../course_material/scripts/MBSE4B_5_Architecting%2BModelling.pdf#page=26) |
| Analyse the functions and build a **white-box model** with **at least two functional flows**. Consider alternative system architectures and ways to realise selected functions. *(high — slide 52)* | Identify the internal functions, their sequence and the exchanges between them. Two candidate flows from the lecture are changing direction and avoiding an obstacle. For an architectural alternative, compare how a selected function could be allocated to different subsystems. [Functional analysis, slide 40](../../course_material/scripts/MBSE4B_5_Architecting%2BModelling.pdf#page=40), [example flows, slide 47](../../course_material/scripts/MBSE4B_5_Architecting%2BModelling.pdf#page=47) |
| Share the updated model as `.sysml` or `.capella`. *(high — slide 52)* | A switch to another tool is optional. The slide gives kotar as an example. |

- **Submission** *(high)* — Email the lecturer at the address on slide 52
  by **18 November 2026**. Use the subject `mbse a6` and submit one
  document titled `MBSE_A6_[TEAM NAME]`. Share the updated model in one
  of the formats above. [Assignment brief, slide 52](../../course_material/scripts/MBSE4B_5_Architecting%2BModelling.pdf#page=52)

## Delivered

- **Submission document** *(high)* — [MBSE_A6_Never_Settlers.pdf](MBSE_A6_Never_Settlers.pdf).
  It covers the review of previous work, sorted requirements pool, working v1.0
  baseline, black-box context, white-box functional analysis and architecture options.
- **Updated model** *(high)* — [MBSE_A6_Never_Settlers.sysml](model/MBSE_A6_Never_Settlers.sysml).
  It retains the six A3 logical parts and adds a typed boundary, subsystem
  connections, requirement trace and allocations, and three action flows for
  driving, autonomous disengagement and emergency propulsion isolation.
  The SysML v2 Pilot Implementation 0.62.0 reported zero syntax errors,
  semantic errors and warnings for this file.
- **A3 model available** *(high)* — The downloaded text export defines the
  autonomous vehicle and six parts for perception, autonomous control, vehicle
  motion, safety, electrical energy and the vehicle platform. It provides the
  starting structure for modelling the functions and exchanges.
  [A3 model export](../MBSE_A3_System_model_Autonomous%20Driving_Never_Settlers/Autonomous_Vehicle_Never_Settlers_model%20file)
- **A3 and A4 analysis available** *(high)* — A4 records the stakeholder need,
  goals, measurable objectives and open rule questions. A3 supplies an
  AI-generated rule comparison that can flag candidates for review.
  [A4 analysis, sections 1–2](../a4_problem_understanding_and_model/MBSE_A4_Never_Settlers.pdf),
  [A3 rule comparison, pp. 1–2](../a3_sem_rule_change_analysis/MBSE_A3_Never_Settlers_SEM_Analysis.pdf)

## Open

- **Submission details** *(high)* — Slide 52 leaves the time of day, the
  document's file format and the mechanism for sharing the model unspecified.
  [Assignment brief, slide 52](../../course_material/scripts/MBSE4B_5_Architecting%2BModelling.pdf#page=52)
- **Vehicle and event decisions** *(high for recorded scope)* — The 2027
  Chapter IV source is now available and informs the common A6 baseline.
  Prototype versus Urban Concept, the Battery Electric working assumption,
  Chapter II event values and the initial A4 targets still require confirmation.
  The planned verification covers the model's baseline requirements. Physical
  compliance checks and the full Chapter I comparison remain open.
  [A6 report, pp. 1–3 and 6](MBSE_A6_Never_Settlers.pdf),
  [A4 analysis, section 4](../a4_problem_understanding_and_model/MBSE_A4_Never_Settlers.pdf#page=2)

## Sources

- *(high)* [Session 5, Architecting and Modelling](../../course_material/scripts/MBSE4B_5_Architecting%2BModelling.pdf#page=52).
  Slide 52 is the assignment brief. Slide 54 confirms the team scope and title.
  Slides 26, 31, 40 and 46–47 explain the modelling method.
- *(high)* [Session 4, Functions and More Requirements](../../course_material/scripts/MBSE4B_4_Functions%2BMoreRequirements.pdf#page=62).
  Slide 62 discusses requirement applicability. Slides 64–65 describe the
  A5 cheat-sheet exercise. [Repository copy of an A5 cheat sheet](../../misc/NASA_MBSE_a5_Cheat_Sheet1.pdf)
- *(high for artifact contents)* [A3 rule comparison](../a3_sem_rule_change_analysis/MBSE_A3_Never_Settlers_SEM_Analysis.pdf),
  [downloaded A3 model export](../MBSE_A3_System_model_Autonomous%20Driving_Never_Settlers/Autonomous_Vehicle_Never_Settlers_model%20file),
  and [A4 problem analysis](../a4_problem_understanding_and_model/MBSE_A4_Never_Settlers.pdf).
- *(high for rule text)* [Official SEM 2027 Chapter IV and previous seasons](https://www.shellecomarathon.com/about/global-rules.html)
  and [local 2027 Chapter I](../../course_material/shell_eco/Shell%20Eco-marathon%202027%20Official%20Rules%2C%20Chapter%20I%20-%20shell-eco-marathon-2027-official-rules-chapter-one.pdf).
- *(high for artifact existence)* [Internal A6 discussion draft](../MBSE_A3_System_model_Autonomous%20Driving_Never_Settlers/MBSE_A6_Never_Settlers.pdf).
  Reviewed for candidate concepts and flows. The resulting baseline follows
  the publisher's rules where applicable.
