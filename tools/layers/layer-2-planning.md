# Layer 2 — Planning

**Tools:** GSD (get-shit-done) · Linear MCP · STATE.md · ROADMAP.md

---

## What It Does

Layer 2 mengubah requirements menjadi executable plans. GSD mengelola phase lifecycle (plan → execute → verify). Linear MCP menyimpan issues dan dependencies. STATE.md adalah single source of truth untuk session continuity.

## When to Activate

| Kondisi | Tool |
|---|---|
| BC baru perlu phase breakdown | `/gsd:plan-phase` |
| Cek progress current milestone | `/gsd:progress` |
| Akhir sesi — simpan state | `/sync-state` |
| Baca state di awal sesi | `/catchup` |
| Issue blocking perlu ditambah | `mcp__linear__*` tools |

## Inputs

- Architecture output dari Layer 3 (persona Tech Lead / Arka)
- Owner approval (dari brainstorming)
- PRD dari PM persona

## Outputs

- `PLAN.md` per phase (input untuk Layer 3 executor)
- Linear issues dengan dependencies
- Updated STATE.md
- ROADMAP.md update

## Handoff

```
Layer 2 → Layer 3: PLAN.md siap dieksekusi
Layer 2 ← Layer 1: "Plan [ini]" (Pegagan dispatch)
Layer 2 ← Layer 3: SUMMARY.md setelah eksekusi
```

## GSD Phase Lifecycle

```
/gsd:plan-phase [phase]    → PLAN.md dibuat
/gsd:execute-phase [phase] → executor jalankan tasks dari PLAN.md
/gsd:verify-work           → VERIFICATION.md dibuat
Status: — → 🔄 → ✔ → ✅
```

## Integration Notes

- GSD executor (Layer 3) baca PLAN.md sebagai instruction set
- Linear issues synced dengan GSD phase status
- STATE.md di-update setiap milestone atau sebelum /clear
- `/compact` saat context >50% — GSD state tetap di file
