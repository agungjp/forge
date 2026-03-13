# Playbook — New BC atau Milestone

## Kapan dipakai
Bounded Context baru atau milestone baru yang butuh spec dari awal.

## Flow
BMAD John (PRD) → Backend Architect (architecture) → Security Review → /gsd:plan-phase

## Steps
1. /superpowers:brainstorming — explore requirements
2. John: tulis PRD (user story + functional req + AC)
3. Barry QS: technical spec dari PRD
4. Backend Architect: system architecture + ADRs
5. Security Engineer: security review [4b]
6. /gsd:new-milestone atau /gsd:plan-phase
7. Linear: buat issues + set dependencies

## Tips
- Jangan skip user research kalau ada akses ke end user
- ADR wajib untuk setiap keputusan arsitektur yang signifikan
- Cross-repo? Selesaikan SLOT 6b dulu
