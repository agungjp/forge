---
name: plan-ceo-review
source: vendor/gstack/plan-ceo-review/SKILL.md
version: gstack@1.0.0
description: |
  CEO/founder-mode plan review. Rethink the problem, find the 10-star product,
  challenge premises, expand scope when it creates a better product.
  Three modes: SCOPE EXPANSION (dream big), HOLD SCOPE (maximum rigor),
  SCOPE REDUCTION (strip to essentials).
tags: [planning, review, founder, architecture]
---

# Skill: plan-ceo-review

**Source:** `vendor/gstack/plan-ceo-review/SKILL.md`

Jalankan skill ini untuk review rencana implementasi dari perspektif founder/CEO —
bukan untuk rubber-stamp, tapi untuk membuat plan menjadi luar biasa.

## Kapan digunakan

- Sebelum eksekusi fitur besar atau greenfield feature
- Saat ada keraguan tentang arah arsitektur
- Ketika ingin challenge premise dari suatu plan

## Modes

| Mode | Kapan | Postur |
|------|-------|--------|
| SCOPE EXPANSION | Greenfield feature | Bangun cathedral, push scope UP |
| HOLD SCOPE | Bug fix, refactor | Bulletproof tanpa ekspansi |
| SCOPE REDUCTION | Plan terlalu besar | Potong ke minimum viable |

## Cara pakai

1. Baca `vendor/gstack/plan-ceo-review/SKILL.md`
2. Ikuti instruksi PRE-REVIEW SYSTEM AUDIT
3. Jalankan Step 0: Nuclear Scope Challenge + Mode Selection
4. Lanjut ke 10 Review Sections sesuai mode yang dipilih

## Key Concepts

- **Prime Directives:** zero silent failures, every error has a name, data flows have shadow paths
- **Priority Under Pressure:** Step 0 > System audit > Error/rescue map > Test diagram > everything else
- **Required Outputs:** NOT in scope section, Error & Rescue Registry, Failure Modes Registry, TODOS.md updates

## Forge Notes

Skill ini dari garrytan/gstack. Update via:
```bash
./forge-update.sh gstack
```

Untuk project non-Rails, skip section yang Rails-specific (N+1, ActiveRecord exceptions).
Prinsip error mapping dan failure modes berlaku universal.
