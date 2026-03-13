# Pegagan — Routing Logic

Decision tree lengkap untuk Mode 1 INTENT.

---

## Primary Decision Tree

```
Input dari owner
│
├─ research/brainstorm/explore ide?
│   └─→ Mode 4 BRAINSTORM
│       → Invoke superpowers:brainstorming
│
├─ bug/incident/error/tidak bisa?
│   └─→ /gsd:debug + SLOT H (Hotfix pipeline)
│
├─ evaluasi/metrics/token/efisiensi?
│   └─→ Mode 5 META
│
├─ jelaskan/apa itu/gimana cara?
│   └─→ Mode 3 LEARN
│
├─ fitur/story/implementasi?
│   └─→ Cek scope (lihat bawah)
│
└─ tidak jelas?
    └─→ Tanya 1 clarifying question
        "Ini fitur baru, bug, atau mau brainstorm dulu?"
```

---

## Scope Check — Fitur/Story

```
Fitur baru
│
├─ BC/milestone baru + belum ada spec?
│   └─→ BMAD John (PRD dulu)
│       → John buat PRD → Winston review arch
│       → lanjut ke NEXUS-lite + /gsd:plan-phase
│
├─ BC/milestone baru + spec sudah ada?
│   └─→ NEXUS-lite + /gsd:plan-phase
│       → Skip John, langsung ke planning
│
├─ Dalam milestone existing?
│   └─→ BMAD Barry QD + /gsd:execute-phase
│       → Quick design → langsung execute
│
└─ Hotfix (production issue)?
    └─→ /gsd:quick + SLOT H
        → Minimal process, langsung fix
```

---

## Cross-repo Check

Sebelum spawn workflow apapun yang menyentuh >1 repo:

```
Cross-repo? (orbit-server + orbit-mobile sekaligus)
│
└─→ Reminder: "Ini cross-repo. Selesaikan SLOT 6b Cross-repo Sync dulu
    sebelum lanjut, atau pastikan kedua repo dalam state yang konsisten."
    → Konfirmasi owner sebelum proceed
```

---

## Workflow Reference

| Workflow | Kapan dipakai | Tools |
|---|---|---|
| BMAD John PRD | BC/milestone baru, belum ada spec | @john persona + Write |
| NEXUS-lite | Ada spec, perlu planning terstruktur | /gsd:plan-phase + quality gates |
| BMAD Barry QD | Dalam milestone existing, fitur jelas | @barry persona + /gsd:execute-phase |
| /gsd:quick | Hotfix, perubahan kecil, < 1 jam | gsd quick |
| /gsd:debug | Bug, error, unexpected behavior | gsd debug + SLOT H |
| superpowers:brainstorming | Explore ide, design sistem | brainstorm skill |

---

## Model Selection Guide

| Task type | Model | Alasan |
|---|---|---|
| Read-only queries, monitoring | Haiku | Murah, cepat |
| Implementasi normal, brainstorming, planning | Sonnet | Balance quality/cost |
| Architecture decisions, security review, complex NEXUS phases | Opus | Max quality |
| Semua agents (kecuali diminta) | Sonnet default | Konsisten |
