# Pegagan — Memory Schema

Dokumentasi schema untuk 3 memory files yang Pegagan maintain.

---

## Overview: 3-Layer State

| Layer | File | Update trigger | Isi |
|---|---|---|---|
| L1 Session | `pegagan-state.md` | Setiap sesi selesai (via Stop hook) | Active task, last/next action |
| L2 Project | `.planning/STATE.md` | Milestone, /clear, /sync-state | Quick Summary + ADR |
| L3 Patterns | `MEMORY.md` + topic files | Saat menemukan pattern/keputusan | Routing patterns, preferences |

---

## pegagan-state.md

**Path:** `~/.claude/projects/<project-slug>/memory/pegagan-state.md`
**Type:** `project`
**Auto-updated:** Ya, via Stop hook

```markdown
---
name: pegagan_state
description: Session continuity — active task, last action, next action per session
type: project
---

# Pegagan State

**Last session:** YYYY-MM-DD
**Active:** [task yang sedang dikerjakan]
**Last action:** [action terakhir yang dikerjakan]
**Next action:** [action konkret berikutnya]
**Key files:** [file penting yang relevan]

---

## Session Log (5 terbaru)

### YYYY-MM-DD sesi N
**Active:** [task/BC/milestone]
**Completed:** [apa yang selesai]
**Next:** [next specific action]
```

**Fields wajib:** Last session, Active, Last action, Next action
**Session log:** Rolling 5 entries terbaru, hapus yang lama

---

## pegagan-metrics.md

**Path:** `~/.claude/projects/<project-slug>/memory/pegagan-metrics.md`
**Type:** `project`
**Updated:** Manual, saat Mode 5 META

```markdown
---
name: pegagan_metrics
description: Token usage, workflow stats, system health metrics
type: project
---

# Pegagan Metrics

## Token Usage

| Tanggal | Workflow | Tier | Est. Tokens | Model |
|---|---|---|---|---|
| YYYY-MM-DD | [workflow] | [S/M/L] | [angka] | [model] |

## Workflow Stats

| Workflow | Kali dipakai | Avg selesai | Revision cycles |
|---|---|---|---|
| GSD quick | 0 | — | — |
| BMAD Barry QD | 0 | — | — |
| BMAD John PRD | 0 | — | — |
| NEXUS-lite | 0 | — | — |

## System Health

**Last check:** YYYY-MM-DD
**Phase stuck:** [phase yang tidak bergerak > 3 hari]
**Linear stale:** [issues > 7 hari tidak diupdate]
**STATE outdated:** [STATE.md > 3 hari tidak diupdate]

## Rekomendasi Aktif

[Pegagan isi saat Mode 5 META]
```

---

## pegagan-learnings.md

**Path:** `~/.claude/projects/<project-slug>/memory/pegagan-learnings.md`
**Type:** `feedback`
**Updated:** Saat Pegagan observe pattern baru

```markdown
---
name: pegagan_learnings
description: Pattern dan insight yang Pegagan temukan dari observasi workflow
type: feedback
---

# Pegagan Learnings

## Routing Patterns

[Pattern yang sering muncul dalam routing decisions]
Contoh: "Owner selalu prefer Barry QD untuk fitur kecil, skip NEXUS"

## Workflow Insights

[Insight tentang efisiensi workflow tertentu]
Contoh: "/gsd:plan-phase butuh ~2 iterasi rata-rata sebelum plan disetujui"

## Owner Preferences

[Preferensi kerja owner yang terobservasi]
Contoh: "Prefer Bahasa Indonesia, toleransi rendah untuk verbose output"

## Tool Effectiveness

[Evaluasi tool mana yang paling/kurang efektif]
Contoh: "context-mode jarang dipakai manual, lebih efektif via hook auto"
```

---

## MEMORY.md Index

File index yang selalu di-load otomatis (max 200 baris).

```markdown
# MEMORY INDEX

## User
- [user_resources.md](user_resources.md) — Subscription & resource AI

## Pegagan State
- [pegagan-state.md](pegagan-state.md) — Session continuity, active task, last/next action
- [pegagan-metrics.md](pegagan-metrics.md) — Token usage, workflow stats, system health
- [pegagan-learnings.md](pegagan-learnings.md) — Routing patterns, workflow insights, owner preferences
```
