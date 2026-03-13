# Playbook — New Feature (Dalam Milestone Existing)

## Kapan dipakai
Fitur dalam milestone yang sudah berjalan. Requirements sudah cukup jelas, tidak perlu PRD baru dari awal.

## Trigger Conditions
- Tambah endpoint atau screen di dalam BC existing
- Enhancement ke fitur yang sudah ada
- Tidak butuh schema perubahan besar

## Pipeline Flow
```
Barry QD brief → /gsd:plan-phase → (opsional: context pre-load) → /gsd:execute-phase
```

## Steps

### 1. Brief Tech Lead (QD mode)
Describe fitur dalam 1-2 paragraf ke Tech Lead:
- Apa yang dibangun
- Input/output yang diharapkan
- Acceptance criteria minimal
- Output: technical brief + task breakdown kasar

### 2. Plan Phase
```
/gsd:plan-phase [phase-name]
```
Jalankan di sub-repo yang relevan (orbit-server atau orbit-mobile).

### 3. Context Pre-load (optional)
Kalau ada library baru:
```
ctx_fetch_and_index [library]
```

### 4. Execute (sesi baru)
```
/clear
# Buka sesi baru di sub-repo
/gsd:execute-phase [phase]
```

## Decision Tree

```
Scope jelas?
  Tidak → /superpowers:brainstorming dulu
  Ya → lanjut

Butuh schema change besar?
  Ya → Arka dulu (schema design)
  Tidak → Tech Lead QD langsung

Ada screen baru?
  Ya → /gsd:discuss-phase untuk design dulu
  Tidak → langsung plan-phase

Cross-repo?
  Ya → definisikan API contract dulu (SLOT 6b)
  Tidak → plan-phase di repo yang relevan
```

## Tips
- Commit per task, bukan per phase
- Kalau stuck → /gsd:debug, jangan guess
- Setelah execute → verifikasi dengan /superpowers:verification-before-completion
