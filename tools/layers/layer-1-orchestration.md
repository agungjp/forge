# Layer 1 — Orchestration

**Tools:** Pegagan (Chief of Staff) · Reality Checker · Evidence Collector · Incident Commander

---

## What It Does

Layer 1 adalah command center. Pegagan menerima intent dari owner, routing ke workflow yang tepat, dan menjaga kualitas gate. Reality Checker memastikan tidak ada klaim "done" yang lolos tanpa bukti. Evidence Collector mengumpulkan bukti per task. Incident Commander menghandle hotfix.

## When to Activate

| Kondisi | Tool |
|---|---|
| Setiap sesi mulai | Pegagan (auto via /catchup) |
| Owner describe task baru | Pegagan Mode 1 INTENT |
| Setelah implementasi selesai | Reality Checker (gate [13]) |
| Setelah setiap task | Evidence Collector (step [10]) |
| Bug production / incident | Incident Commander (SLOT H) |

## Inputs

- Owner intent (natural language)
- STATE.md (project state)
- Evidence dari Layer 3 (implementation results)
- Alert dari observability stack

## Outputs

- Workflow dispatch ke layer yang tepat
- READY / NEEDS WORK verdict (Reality Checker)
- Evidence report per task (Evidence Collector)
- Incident timeline + post-mortem (Incident Commander)

## Handoff

```
Layer 1 → Layer 2: "Plan [feature/phase] ini"
Layer 1 → Layer 3: "Execute [phase] ini"
Layer 1 → Layer 4: "Verify [implementation] ini"
Layer 1 → Layer 4: "Debug [issue] ini"
```

## Integration Notes

- Pegagan baca STATE.md (Layer 2) untuk context sebelum routing
- Reality Checker butuh evidence dari Layer 3 (via Evidence Collector)
- Incident Commander spawn Layer 2 (GSD quick) untuk hotfix planning
- Model selection: Haiku untuk monitoring, Sonnet untuk medium, Opus untuk gate kompleks
