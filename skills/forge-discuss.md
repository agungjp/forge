---
name: forge-discuss
description: Trigger Party Mode — spawn 3 perspektif paralel untuk diskusi sebelum keputusan besar
---

# Forge: Party Mode Discussion

Kamu akan memfasilitasi diskusi multi-perspektif sebelum keputusan besar.

## Setup

Ambil topic dari input user, lalu spawn 3 perspektif menggunakan Agent tool secara paralel:

1. **Architect** — implikasi sistem, trade-offs teknis, dependency graph
2. **Reality Check** — risiko, effort sebenarnya, apa yang sering salah, constraint nyata
3. **Domain Expert** — PLN/SCADA context, constraint operasional, user impact

## Format Output

```
## Party Mode: [Topic]

### Perspektif Architect
[Analisis sistem dan trade-offs — konkret, bukan abstract]

### Perspektif Reality Check
[Risiko, effort sebenarnya, apa yang sering salah, assumption yang salah]

### Perspektif Domain
[Context PLN/SCADA, constraint operasional, dampak ke operator]

---
## Decision Matrix

| Option | Pros | Cons | Effort | Risk |
|--------|------|------|--------|------|
| A      | ...  | ...  | S/M/L  | L/M/H|
| B      | ...  | ...  | S/M/L  | L/M/H|

**Recommendation:** Option [X] karena [alasan singkat, 1 kalimat]
```

## Auto-Skip Conditions
Party Mode TIDAK dijalankan jika:
- Bugfix dengan root cause yang jelas
- Task estimasi < 30 menit
- Ada precedent yang persis di `~/Sandbox/forge/telos/learned.md`
- Sudah ada PLAN.md yang diapprove untuk task ini

## Setelah Discussion
Selalu tanya: "Approach mana yang kamu pilih? Atau ada pertanyaan sebelum lanjut ke PLAN?"

Jangan mulai implementasi tanpa konfirmasi dari owner.
