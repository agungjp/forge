---
name: retro
source: vendor/gstack/retro/SKILL.md
version: gstack@2.0.0
description: |
  Weekly engineering retrospective. Analyzes commit history, work patterns,
  and code quality metrics with persistent history and trend tracking.
  Team-aware dengan per-person contributions, praise, dan growth areas.
tags: [retro, metrics, team, velocity]
---

# Skill: retro

**Source:** `vendor/gstack/retro/SKILL.md`

Generate engineering retrospective yang komprehensif dari git history.

## Kapan digunakan

- Weekly review — apa yang sudah di-ship, pola kerja, quality signals
- Sebelum sprint planning untuk lihat velocity
- Untuk team feedback yang spesifik dan berbasis data

## Arguments

```
/retro              — default: last 7 days
/retro 24h          — last 24 hours
/retro 14d          — last 14 days
/retro 30d          — last 30 days
/retro compare      — compare this period vs prior period
/retro compare 14d  — compare with explicit window
```

## Output Sections

1. **Tweetable summary** — single line overview
2. **Summary Table** — commits, contributors, PRs, LOC, test ratio, sessions
3. **Per-author leaderboard** — commits + LOC per person
4. **Time & Session Patterns** — peak hours, session depth
5. **Shipping Velocity** — commit type mix, PR size discipline
6. **Code Quality Signals** — test ratio, hotspots, churn
7. **Your Week** — personal deep-dive
8. **Team Breakdown** — praise + growth per teammate
9. **Top 3 Wins + 3 Things to Improve + 3 Habits for Next Week**
10. **Trends** (jika window >= 14d)

## Persistence

Saves snapshot ke `.context/retros/YYYY-MM-DD-N.json` untuk trend tracking.
Semua narrative output langsung ke conversation — tidak ke filesystem.

## Forge Notes

Skill terbaik untuk refleksi engineering berkala.
Timestamps display dalam timezone user (default Pacific — adjust jika WIB needed).

Update via:
```bash
./forge-update.sh gstack
```
