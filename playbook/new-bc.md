# Playbook — New BC atau Milestone

## Kapan dipakai
Bounded Context baru atau milestone baru yang butuh spec dari awal.

## Trigger Conditions
- Kebutuhan bisnis baru dari stakeholder
- Feature yang tidak fit dalam BC existing
- Milestone baru (setelah milestone sebelumnya complete)

## Pipeline Flow
```
SLOT 1 Discovery → SLOT 2 Design → SLOT 3 Planning → SLOT 4 Build
```

## Steps

### 1. Discovery (SLOT 1)
```
/superpowers:brainstorming
```
- Explore requirements dengan PM persona
- User story: "Sebagai [role], saya ingin [action], agar [benefit]"
- User research: pain point mapping petugas lapangan
- Output: User Story + pain point notes

### 2. PRD (SLOT 1 → 2)
Invoke PM persona:
- Input: User Story + research notes
- Output: PRD dengan FR, NFR, dan AC yang testable
- Gate: Requirements clear, AC terdefinisi

### 3. Technical Spec (SLOT 2)
Invoke Tech Lead (mode QS):
- Input: PRD approved
- Output: API contracts, schema changes, external dependencies, security assumptions
- Cross-repo check: apakah butuh orbit-server + orbit-mobile?

### 4. Architecture (SLOT 2)
Invoke Arka (Backend Architect):
- Input: Technical Spec
- Output: Schema design, ADRs, BC boundary validation
- Gate: BC boundary clear

### 4b. Security Review (SLOT 2) — WAJIB
Invoke Security:
- Input: Architecture
- Gate: Security approval sebelum lanjut

### 5. UI/UX (SLOT 2) — conditional
Hanya kalau ada screen baru:
- ui-ux-pro-max + Figma MCP

### 6. Phase Breakdown (SLOT 3)
```
/gsd:plan-phase [phase-name]
```
- Buat Linear issues per phase
- Set dependencies antar phase

### 7. Context Pre-load (SLOT 3)
```
ctx_fetch_and_index [library]
```
- Index docs library utama phase pertama

### 8. Execute (SLOT 4)
Buka sesi baru di sub-repo:
```
/gsd:execute-phase [phase]
```

## Tips
- BC baru selalu mulai dari PM persona (jangan langsung code)
- Cross-repo BC: definisikan API contract dulu sebelum mulai kedua repo
- Kalau scope tidak jelas → /superpowers:brainstorming dulu
