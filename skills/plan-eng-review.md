---
name: plan-eng-review
source: vendor/gstack/plan-eng-review/SKILL.md
version: gstack@1.0.0
description: |
  Eng manager-mode plan review. Lock in execution plan — architecture,
  data flow, diagrams, edge cases, test coverage, performance.
  Walks through issues interactively with opinionated recommendations.
tags: [planning, review, engineering, architecture]
---

# Skill: plan-eng-review

**Source:** `vendor/gstack/plan-eng-review/SKILL.md`

Review rencana implementasi dari perspektif engineering manager — pragmatis,
opinionated, interaktif satu section per satu.

## Kapan digunakan

- Review plan sebelum eksekusi untuk fitur medium-large
- Saat butuh pandangan teknis yang lebih fokus daripada CEO review
- Ketika scope sudah relatif jelas tapi implementasi perlu dikritisi

## Flow

1. **Step 0: Scope Challenge** — challenge premise, pilih mode
   - SCOPE REDUCTION
   - BIG CHANGE (interaktif per section)
   - SMALL CHANGE (compressed, satu pass)

2. **Review Sections** (setelah scope agreed):
   - Architecture review
   - Code quality review
   - Test review (dengan diagram semua new UX/data flow/codepath)
   - Performance review

## Engineering Preferences yang Berlaku

- DRY aggressively
- Well-tested over well-designed
- Explicit over clever
- Minimal diff
- ASCII diagrams untuk semua non-trivial flow

## Required Outputs

- **NOT in scope** section — deferred work + rationale
- **What already exists** — existing code yang sudah solve sub-problems
- **Test diagram** — semua new UX, data flow, codepath, branching
- **Failure modes** — realistic production failures + test/handling/visibility
- **TODOS.md updates** — satu AskUserQuestion per TODO

## Forge Notes

Versi lebih ringan dari `plan-ceo-review` — cocok untuk plan yang sudah
punya arah jelas dan butuh review teknis focused, bukan scope challenge.

Update via:
```bash
./forge-update.sh gstack
```
