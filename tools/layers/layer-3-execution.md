# Layer 3 — Execution

**Tools:** BMAD personas (PM · Tech Lead · Amelia · Quinn) · agency-agents personas (Arka · Security · Mobile Builder) · GSD executor

---

## What It Does

Layer 3 adalah lapisan kerja aktual. BMAD personas menangani product dan technical work. agency-agents personas menangani architecture, security, dan mobile. GSD executor menjalankan tasks dari PLAN.md secara atomic.

## Persona Map

| Persona | Role | Trigger |
|---|---|---|
| PM | PRD, user research | BC baru, requirement unclear |
| Tech Lead (Barry) | Technical spec, code review | Phase baru, PR review |
| Amelia | Implementation per task | `/gsd:execute-phase` |
| Quinn | QA, acceptance testing | Setelah implementation selesai |
| Arka | Schema, API contracts, ADRs | Architecture decision, schema change |
| Security | Security review, OWASP | Sebelum staging ([4b], [13b]) |
| Mobile Builder | Flutter guidance | orbit-mobile implementation |

## When to Activate

| Kondisi | Persona |
|---|---|
| BC baru, perlu PRD | PM |
| Ada PLAN.md, mulai eksekusi | Amelia + GSD executor |
| Schema change atau ADR baru | Arka |
| Phase siap ke staging | Security |
| Bug investigation | Tech Lead (CR mode) |
| Flutter-specific issue | Mobile Builder |

## Inputs

- PLAN.md dari Layer 2
- PRD dari PM
- Architecture dari Arka
- Technical Spec dari Tech Lead

## Outputs

- Code implementation (Amelia)
- Test results + evidence (per task)
- QA report (Quinn)
- ADRs (Arka)
- Security report (Security)
- SUMMARY.md (GSD executor)

## Handoff

```
Layer 3 → Layer 4: "Verify ini" (hasil implementasi ke Superpowers)
Layer 3 → Layer 1: Evidence per task → Evidence Collector aggregates
Layer 3 ← Layer 2: PLAN.md (input)
```

## Integration Notes

- GSD executor commit setiap task atomic
- Amelia TIDAK skip TDD — test dulu, implement kemudian
- Arka butuh akses ke staging DB untuk schema validation
- Security review WAJIB sebelum deploy ke staging (gate [4b] dan [13b])
