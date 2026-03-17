# NEXUS Handoff — Reference Template

**Purpose:** Format standar saat Pegagan delegate task ke agent manapun.
**Rule:** Setiap delegate WAJIB gunakan format ini. Tanpa format ini, agent tidak punya cukup context.

---

## Template

```markdown
## Context
[project state + relevant files + recent decisions + dependencies]

## Deliverable
[what is needed + acceptance criteria + constraints + deadline]

## Quality Expectations
[must pass + evidence required + gate level + handoff to next agent]
```

---

## Contoh per Agent

### → Arka (Architect)

```markdown
## Context
BC-002 Inspeksi RTU sedang dalam development. Sprint 2 fokus pada form inspeksi.
File relevan: orbit-server/app/Models/RTU.php, database/migrations/
ADR-003 aktif: WIB timezone, simpan di DB langsung.
Belum ada tabel inspeksi_items.

## Deliverable
Design schema untuk tabel inspeksi_items:
- Kolom: id, inspeksi_id (FK), komponen, status (ok/nok/na), catatan, foto_url
- RLS: user hanya bisa lihat data sendiri
- Index: inspeksi_id, status
Acceptance criteria: ADR baru jika ada keputusan signifikan, migration file siap

## Quality Expectations
- Must pass: schema review oleh Tech Lead
- Evidence: migration file + ERD sederhana
- Gate: Level 3 (auto, tidak perlu approval)
- Handoff ke: Amelia untuk implementasi
```

### → Amelia (Developer)

```markdown
## Context
Schema inspeksi_items sudah di-design oleh Arka (lihat ADR-00X).
Migration file ada di database/migrations/2026_03_XX_create_inspeksi_items.php
BC-002, Sprint 2, task S2-03.

## Deliverable
Implementasi InspeksiItem model + FilamentResource:
- Model dengan relasi ke Inspeksi
- Filament Resource untuk admin CRUD
- Feature test: create, read, update, delete
Acceptance criteria: semua test pass, tidak ada N+1 query

## Quality Expectations
- Must pass: php artisan test --filter InspeksiItem
- Evidence: screenshot test output + Filament resource screenshot
- Gate: Level 3 (auto)
- Handoff ke: Quinn untuk acceptance test
```

### → Quinn (QA)

```markdown
## Context
Amelia selesai implementasi InspeksiItem (commit: abc123).
Feature ada di branch feature/S2-03-inspeksi-items.
Acceptance criteria dari QS-002.

## Deliverable
Acceptance test untuk InspeksiItem:
- Happy path: create inspeksi item dengan foto
- Edge case: item dengan status 'nok' wajib ada catatan
- E2E: flow lengkap dari Filament admin
Acceptance criteria: semua test pass, coverage > 80%

## Quality Expectations
- Must pass: php artisan test (semua test)
- Evidence: test output + coverage report
- Gate: Level 3 (auto)
- Handoff ke: Pegagan — report done, update Linear issue
```

### → Raka (DevOps)

```markdown
## Context
Feature S2-03 sudah pass QA (Quinn sign-off).
Branch: feature/S2-03-inspeksi-items
Staging: http://100.96.28.46:8000 — perlu deploy untuk UAT

## Deliverable
Deploy ke staging:
1. Backup DB staging dulu
2. Push branch ke staging
3. Run migration
4. Verify health check
Acceptance criteria: staging running, migration sukses

## Quality Expectations
- Must pass: health check endpoint return 200
- Evidence: curl output health check + migration log
- Gate: Level 2 (soft gate — notif ke #pegagan-control, tunggu 30 menit)
- Handoff ke: Pegagan — notif Agung untuk UAT
```

---

## Rules

1. **Jangan skip Context** — agent tidak tau apa yang terjadi sebelumnya
2. **Acceptance criteria harus terukur** — bukan "implementasi dengan baik"
3. **Gate level wajib dicantumkan** — agent tau kapan harus stop
4. **Handoff to wajib** — siapa yang dikerjakan selanjutnya setelah agent ini selesai
