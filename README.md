# forge

**Engineering OS for solo fullstack + mobile + devops developer.**

Standar workflow end-to-end yang tool-agnostic — dari User Story sampai Observability. Bisa dipakai sebagai template untuk proyek baru.

---

## Konsep

```
Standard (tool-agnostic)
  └── Playbook (how-to per phase)
        └── Tool Bindings (implementasi konkret, bisa diganti)
              └── Templates (generator untuk proyek baru)
```

**6-Layer Architecture:**

| Layer | Fungsi | Tool Default |
|---|---|---|
| 1 — Orchestration | Quality gates, phase advance, evidence | NEXUS (agency-agents) |
| 2 — Planning | ROADMAP, PLAN, STATE, PM tracking | GSD + Linear |
| 3 — Execution | Spec, implement, QA | BMAD (Barry/Amelia/Quinn) |
| 4 — Safeguards | TDD, debug, verify, review | Superpowers |
| 5 — Context | Token efficiency, library docs | context-mode + context7 |
| 6 — Design | UI/UX, design system | ui-ux-pro-max + Figma |

---

## Pipelines

- **Pipeline 1: Feature/Milestone** — 19 steps, User Story → Observability
- **Pipeline 2: Hotfix** — 4 steps, Triage → Post-mortem

Detail: `standard/`

---

## Reference Implementation

- **ORBIT** — Sistem inspeksi RTU untuk PLN SCADA UP2D Jawa Barat
  `implementations/orbit/`

---

## Status

> Work in progress. Brainstorm doc: lihat ORBIT `docs/plans/2026-03-12-forge-workflow-brainstorm.md`
