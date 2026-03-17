# Founder Gates — Kirana Corp

**Owner:** Agung Perkasa
**Last updated:** 2026-03-17
**Purpose:** Definisikan kapan sistem harus stop dan tunggu approval founder.

---

## Level 1 — ALWAYS STOP

Sistem wajib halt dan notifikasi Agung. Tidak bisa di-bypass kecuali Agung hadir dan konfirmasi manual.

- Production deploy (orbit.pegagan.online)
- ADR baru yang mengubah DB schema (migration destructive)
- PR ke main branch — butuh review + approval Agung
- Perubahan `~/.claude/settings.json` permissions
- Rotasi credentials / secret baru

**Cara intercept:** Post ke `#pegagan-control`: `[HARD GATE] <deskripsi> — butuh approval`
**Pegagan wajib:** Stop semua agent, tunggu response Agung sebelum lanjut.

---

## Level 2 — CONFIGURABLE (default: stop)

Default: stop dan notifikasi. Agung bisa skip dengan explicit `bypass [step]`.

- Architecture review sebelum Amelia mulai implementasi besar (>1 hari)
- Staging deploy pertama kali setelah breaking change
- Breaking change di API contract yang mempengaruhi orbit-mobile
- Migrasi DB di staging
- Spawn lebih dari 3 agent concurrent

**Cara bypass:** Post `bypass [step]` di `#pegagan-control`, atau `bypass all` untuk session.
**Pegagan:** Catat bypass di STATE.md. Lanjut setelah konfirmasi.

---

## Level 3 — NEVER STOP

Fully automated. Tidak perlu notify, tidak perlu approval.

- Bugfix minor (1-3 file, non-breaking)
- Test writing (unit/feature test baru)
- Documentation update (docs/, CLAUDE.md, STATE.md, ROADMAP.md)
- Code review comment di PR
- Linear issue status update (Todo → In Progress → Done)
- Refactor tanpa behavior change
- Agent Paperclip monitoring
- Memory file update

---

## Slack Commands di `#pegagan-control`

| Command | Efek |
|---------|------|
| `stop` | Halt semua agents yang sedang jalan |
| `pause` | Pause dan tunggu instruksi lanjutan |
| `resume` | Lanjut dari titik terakhir |
| `bypass [step]` | Skip gate tertentu untuk satu langkah |
| `bypass all` | Skip semua Level 2 gates untuk sesi ini |
| `explain` | Pegagan jelaskan apa yang sedang dikerjakan |
| `status` | Report progress semua agents aktif |

---

## Ralph-Loop Safety Rules

Untuk autonomous overnight sessions:

- **Max iterasi:** 10 per session sebelum stop dan notify Slack
- **Dead man's switch:** Kalau Agung tidak respond `#pegagan-control` dalam 8 jam → system pause otomatis
- **No-progress check:** Jika tidak ada commit baru setelah 3 iterasi → escalate ke Agung
- **Budget ceiling:** Set di Agent Paperclip dashboard (lihat Wave 10)
- **Scope limit:** Jangan mulai Wave/task baru yang tidak ada di approved plan

---

## Pegagan Session-Start Ritual

Setiap sesi baru, Pegagan wajib:

1. Cek `#pegagan-control` untuk command pending
2. Cek apakah ada HARD GATE pending approval (Level 1)
3. Jangan mulai task baru kalau ada gate yang belum di-resolve
4. Jika ada `stop` atau `pause` command → halt dan report status ke Agung
