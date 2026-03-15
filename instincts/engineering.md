# Engineering Instincts

## Instinct: WIB Timezone
**Action:** Gunakan WIB langsung. Jangan setTimezone() atau double-convert.
**Why:** ADR-003 — DB simpan WIB, konversi di app menyebabkan bug display
**When:** Semua kode yang menyentuh timestamp, baik Laravel maupun Flutter

## Instinct: Database Container
**Action:** Selalu gunakan container `supabase-db`, bukan `orbit-pgsql-1`
**Why:** ADR-004 — orbit-pgsql-1 adalah container lama yang tidak aktif
**When:** Semua operasi DB, migration, query langsung

## Instinct: Production Safety
**Action:** Staging dulu → backup DB → deploy script → verify
**Why:** Production live, error = gangguan operasional PLN
**When:** Setiap kali mau deploy ke production

## Instinct: Atomic Commits
**Action:** Commit per task selesai, bukan per session
**Why:** Easier rollback, cleaner history, lebih mudah review
**When:** Setiap task implementation selesai
