# Workflow: Solutioning Phase

**Adapted from:** vendor/bmad-method/src/bmm/workflows/3-solutioning/
**Owner:** Winston/Architect agent (di Orbit: Arka)
**Output:** ADR entries, technical spec, story breakdown

## Kapan Dipakai

- Sebelum implementasi feature yang menyentuh multiple components
- Saat ada keputusan teknis yang berdampak luas (API design, DB schema, auth)
- Multi-repo work (orbit-server + orbit-mobile harus align)

## Kenapa Penting

Tanpa solutioning: Developer A pakai pattern X, Developer B pakai pattern Y
→ Integration conflict saat merge

Dengan solutioning: semua agent/developer implement dari spec yang sama.

## Steps

### 1. Architecture Decision Record (ADR)
Buat atau update: `docs/adr/ADR-XXX-<topic>.md`

Template ADR:
```
## ADR-XXX: [Title]
**Date:** YYYY-MM-DD
**Status:** Proposed | Accepted | Deprecated
**Decision:** [Satu kalimat keputusan]
**Reason:** [Kenapa keputusan ini]
**Consequences:** [Trade-offs]
```

### 2. Technical Spec (Quick Spec / QS)
Buat: `docs/plans/YYYY-MM-DD-<feature>-tech-spec.md`

Sections:
- Stack & dependencies
- Data model changes (schema, migrations)
- API contracts (endpoints, payloads, error codes)
- State management approach
- Security considerations

### 3. Story Breakdown
Buat task list di PLAN.md (GSD format) atau Linear issues

Setiap story harus punya:
- Acceptance criteria yang terukur
- Dependencies antar story
- Estimated effort

### 4. Implementation Readiness Gate
- [ ] ADRs updated?
- [ ] API contracts defined?
- [ ] DB schema changes documented?
- [ ] No conflicts antara server + mobile?
- [ ] Tech Lead / Arka approval?

## Referensi BMAD
`vendor/bmad-method/src/bmm/workflows/3-solutioning/`
