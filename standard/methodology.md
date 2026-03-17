# Forge Engineering Methodology

**Version:** 1.0
**Last updated:** 2026-03-17
**Status:** Active — reference implementation di orbit

---

## Engineering Lifecycle

```
Discovery → Architecture → Planning → Build → QA → Deploy → Operate
```

### 1. Discovery
- User story / Linear issue dibuat
- Pegagan classify scope (bugfix / feature kecil / feature besar)
- Quick Spec (QS) 15 menit untuk feature ≤ 1 hari

### 2. Architecture
- Arka design schema + API contract
- ADR kalau ada keputusan signifikan
- Tech Lead review kalau menyentuh >1 BC

### 3. Planning
- `/gsd:plan-phase` → PLAN.md
- NEXUS handoff template ke Amelia
- Gate check: scope clear, acceptance criteria ada

### 4. Build
- Amelia implementasi dengan TDD
- Atomic commits per task
- Isolation: worktree untuk feature besar

### 5. QA
- Quinn acceptance test
- Coverage check
- Reality Checker untuk production-grade feature

### 6. Deploy
- Raka deploy ke staging dulu
- Backup DB sebelum migration
- Agung approve sebelum production (HARD GATE)

### 7. Operate
- Monitor via Grafana + Loki + Sentry
- Linear issue → Done setelah deploy production
- Retrospective kalau ada incident

---

## Scale Routing

```
Ukuran task → Workflow

Bugfix / < 2 jam    → /gsd:quick langsung (Amelia)
Feature 1 hari      → Quick Spec → /gsd:plan-phase → execute
Feature > 1 hari    → Full BMAD: Brief → PRD → Arch → Sprint
BC baru             → Full BMAD + ADR + Arka review
Hotfix production   → /gsd:debug + Incident Commander
```

---

## Quality Gates per Stage

| Stage | Gate | Owner |
|-------|------|-------|
| Planning | Acceptance criteria terukur | Pegagan |
| Build | Tests pass, no N+1 | Amelia |
| QA | Coverage > 80%, E2E pass | Quinn |
| Deploy staging | Health check 200 | Raka |
| Deploy production | Agung approval | Agung (HARD GATE) |

---

## AI-Agnostic Principles

Format ini bisa dibaca tool apapun (tidak Claude-specific):

1. **Scaffolding beats model selection** — workflow architecture > prompt engineering
2. **Evidence over assumption** — test output, tidak cukup "sudah diimplementasi"
3. **Atomic commits** — satu commit per task selesai
4. **State as source of truth** — STATE.md + Linear, bukan memory agent
5. **Gate before destructive** — konfirmasi sebelum production, migration, schema drop
