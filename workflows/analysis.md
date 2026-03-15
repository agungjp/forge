# Workflow: Analysis Phase

**Adapted from:** vendor/bmad-method/src/bmm/workflows/1-analysis/
**Owner:** Pegagan (orchestrate) → Mary/Analyst agent
**Output:** `product-brief.md` atau `research-report.md`

## Kapan Dipakai

- Mulai project baru yang belum jelas scope-nya
- Feature besar yang butuh validasi asumsi dulu
- Competitive landscape belum dipahami

## Skip Jika

- Task sudah jelas (bugfix, small feature dengan scope terdefinisi)
- Sudah ada PRD atau brief dari stakeholder
- Quick Flow lebih tepat (lihat `quick-flow.md`)

## Steps

### 1. Project Context Check
Baca: `forge.config.yaml`, `telos/mission.md`, `telos/projects.md`
Tujuan: pahami domain sebelum analisis

### 2. Brainstorming (opsional)
Trigger: kalau problem belum jelas
Gunakan: `gear-founder` (first principles) atau `forge-discuss` (multi-perspektif)
Output: list asumsi + hipotesis

### 3. Product Brief
Buat dokumen: `docs/plans/YYYY-MM-DD-<topic>-brief.md`
Template di: `vendor/bmad-method/src/bmm/data/project-context-template.md`

Isi minimal:
- Problem statement
- Target user
- Success metrics
- Out of scope

### 4. Gate Check
Sebelum lanjut ke Planning:
- [ ] Problem terdefinisi dengan jelas?
- [ ] Target user diidentifikasi?
- [ ] Success metrics bisa diukur?

## Referensi BMAD
`vendor/bmad-method/src/bmm/workflows/1-analysis/`
