# Workflow: Planning Phase

**Adapted from:** vendor/bmad-method/src/bmm/workflows/2-planning/
**Owner:** John/PM agent (PRD) + Sally/UX agent (UX spec)
**Output:** `PRD.md`, `ux-spec.md` (opsional)

## Kapan Dipakai

- Setelah Analysis phase selesai
- Feature baru yang membutuhkan formal requirements
- Multi-BC features yang butuh alignment

## Skip Jika

- Task sudah ada di ROADMAP.md dengan scope jelas
- Bugfix atau improvement kecil
- Quick Flow lebih tepat

## Steps

### 1. PRD Creation
Buat: `docs/plans/YYYY-MM-DD-<feature>-prd.md`

Sections wajib:
- Vision & scope
- Functional Requirements (FRs) — numbered FR-001, FR-002, ...
- Non-Functional Requirements (NFRs)
- Success metrics
- Out of scope
- Assumptions

### 2. UX Spec (opsional, untuk fitur dengan UI)
Buat: `docs/plans/YYYY-MM-DD-<feature>-ux.md`

Sections:
- User flows
- Key screens/states
- Error states

### 3. Gate Check
Sebelum lanjut ke Solutioning:
- [ ] Semua FRs terdefinisi dan numbered?
- [ ] NFRs include performance + security?
- [ ] Success metrics measurable?
- [ ] Stakeholder review selesai?

## Referensi BMAD
`vendor/bmad-method/src/bmm/workflows/2-planning/`
