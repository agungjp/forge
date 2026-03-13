# Forge — Workflow Standard

Engineering OS untuk solo developer yang membangun produk serius.

---

## Konsep

**Forge** adalah *engineering operating system* yang:
- **Tool-agnostic** — workflow tidak berubah kalau tools diganti
- **Startup-grade** — mencakup seluruh siklus: Bisnis → Produk → Engineering → Ops → Bisnis
- **Template** — generate skeleton untuk proyek baru (`forge init`)
- **Orchestrated by Pegagan** — satu interface untuk semua workflows

---

## Layer Architecture

```
┌─────────────────────────────────────────────────────────────┐
│  Layer 1 — ORCHESTRATION                                    │
│  agency-agents (NEXUS doctrine)                             │
│  Quality gates, phase advance, evidence tracking            │
│  Reality Checker (default: NEEDS WORK)                      │
│  Evidence Collector (bukti konkret per task)                │
└─────────────────────────┬───────────────────────────────────┘
                          │
┌─────────────────────────▼───────────────────────────────────┐
│  Layer 2 — PLANNING                                         │
│  GSD + Linear MCP                                           │
│  ROADMAP.md, PLAN.md, STATE.md, Linear issues               │
└─────────────────────────┬───────────────────────────────────┘
                          │
┌─────────────────────────▼───────────────────────────────────┐
│  Layer 3 — EXECUTION                                        │
│  BMAD (John PM · Barry QS/QD/CR · Amelia dev · Quinn QA)    │
└─────────────────────────┬───────────────────────────────────┘
                          │
┌─────────────────────────▼───────────────────────────────────┐
│  Layer 4 — SAFEGUARDS                                       │
│  Superpowers skills                                         │
│  TDD · debugging · verification · code-review               │
└─────────────────────────┬───────────────────────────────────┘
                          │
┌─────────────────────────▼───────────────────────────────────┐
│  Layer 5 — CONTEXT                                          │
│  context-mode + context7                                    │
└─────────────────────────┬───────────────────────────────────┘
                          │
┌─────────────────────────▼───────────────────────────────────┐
│  Layer 6 — DESIGN                                           │
│  ui-ux-pro-max + Figma MCP + design-research skill          │
└─────────────────────────────────────────────────────────────┘
```

---

## Personas

Role-based, nama disesuaikan per proyek.

| Role | Base Dari | Fungsi |
|---|---|---|
| PM | BMAD John | PRD, user research, feedback loop, prioritasi |
| Tech Lead | BMAD Barry (QS/QD/CR) | Tech spec, quick dev, code review |
| Developer | BMAD Amelia | Implementasi story per story |
| QA Engineer | BMAD Quinn | QA, generate E2E tests |
| Backend Architect | agency-agents | Schema, API contracts, ADRs, scalability |
| Security Engineer | agency-agents | Security review, OWASP audit, gate |
| DevOps Automator | agency-agents | CI/CD, infra, observability, k6 load test |
| Mobile App Builder | agency-agents | Flutter-specific guidance |
| Incident Response Commander | agency-agents | Hotfix triage, post-mortem |
| Reality Checker | custom | Gate skeptis default NEEDS WORK |
| Evidence Collector | custom | Kumpul bukti konkret per task |
| AI Resource Analyst | custom | Token usage audit, efisiensi, subscription sizing |

> Nama persona bisa diganti per proyek. Contoh ORBIT: "Arka" = Backend Architect, "Raka" = DevOps Automator.

---

## Tool Bindings

Tool-agnostic standard. Binding bisa diganti tanpa ubah pipeline.

| Step | Layer | Tool Default |
|---|---|---|
| [0-1] Discovery | 3 | BMAD John (PM) |
| [3] Technical Spec | 3 | Barry QS (BMAD Quick Flow) |
| [4a] Arch Discussion | 1 | Backend Architect (agency-agents) |
| [4] Architecture | 1 | Backend Architect (agency-agents) |
| [4b] Security Review | 1 | Security Engineer (agency-agents) |
| [5] UI/UX | 6 | ui-ux-pro-max + Figma MCP |
| [6] Phase Breakdown | 2 | GSD + Linear MCP |
| [7] Context Pre-load | 5 | context-mode ctx_fetch_and_index |
| [8] TDD | 4 | Superpowers TDD |
| [9] Implementation | 3 | BMAD Amelia + GSD execute-phase |
| [9] Library Docs | 5 | context7 |
| [10] Evidence | 1 | Evidence Collector (custom persona) |
| [11] Self-Audit | 3+4 | Barry CR + Superpowers verify |
| [12] QA | 3 | BMAD Quinn + /gsd:verify-work |
| [12b] Load Testing | 1 | DevOps Automator + k6 |
| [13] Reality Check | 1 | Reality Checker (custom persona) |
| [13b] Security Gate | 1 | Security Engineer (agency-agents) |
| [14] Code Review | 4 | Superpowers code-review |
| [15-17] Deploy | — | GitHub Actions |
| [18-19] Observability | 1 | DevOps Automator |
| [20] AI Audit | custom | AI Resource Analyst persona |
| [H1] Triage | 1+4 | Incident Response Commander + Superpowers debug |
| [H2] Fix | 2 | GSD quick |

---

## Quick Reference

| Kondisi | Tool |
|---|---|
| Mulai sesi | `/catchup` |
| BC baru, perlu spec | BMAD John → Barry QS |
| Phase dalam milestone existing | Barry QD langsung |
| Ragu dengan arsitektur | Backend Architect [4a] discussion mode |
| Ada UI/mobile screen baru | ui-ux-pro-max + Figma MCP |
| Plan phase teknis | GSD plan-phase + Linear |
| Load library docs besar | context-mode ctx_fetch_and_index |
| Implement fase | BMAD Amelia + GSD execute-phase |
| Debugging | Superpowers systematic-debugging |
| Bug production | SLOT H (Hotfix pipeline) |
| >30% timeline slip | SLOT CC (Correct Course) |
