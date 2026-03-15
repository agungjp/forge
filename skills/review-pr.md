---
name: review-pr
source: vendor/gstack/review/SKILL.md
version: gstack@1.0.0
description: |
  Pre-landing PR review. Analyzes diff against main for SQL safety,
  LLM trust boundary violations, conditional side effects, and structural issues.
  Two-pass: CRITICAL then INFORMATIONAL.
tags: [review, pr, pre-merge, safety]
---

# Skill: review-pr

**Source:** `vendor/gstack/review/SKILL.md`

Review PR diff sebelum merge untuk structural issues yang tidak tertangkap tests.

## Kapan digunakan

- Sebelum merge PR ke main
- Saat ingin audit code changes dengan perspektif keamanan dan kualitas
- Sebagai gate sebelum deploy ke staging/production

## Flow

1. Check current branch (stop jika di main)
2. Read review checklist
3. Fetch + get full diff against origin/main
4. **Pass 1 (CRITICAL):** SQL & Data Safety, LLM Output Trust Boundary
5. **Pass 2 (INFORMATIONAL):** Conditional Side Effects, Magic Numbers, Dead Code, Test Gaps, View/Frontend
6. Output findings + AskUserQuestion per critical issue
7. TODOS cross-reference

## Output Format

- `Pre-Landing Review: N issues (X critical, Y informational)`
- Per critical issue: `AskUserQuestion` → A) Fix now, B) Acknowledge, C) False positive
- Jika tidak ada issue: `Pre-Landing Review: No issues found.`

## Rules

- Read-only by default — hanya modifikasi jika user pilih "Fix it now"
- Never commit, push, atau create PR
- One line problem, one line fix — no preamble

## Forge Notes

Skill ini bergantung pada `vendor/gstack/review/checklist.md` untuk checklist items.
Baca file tersebut sebagai referensi saat menjalankan review.

Update via:
```bash
./forge-update.sh gstack
```
