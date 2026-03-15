# Learned — Lessons dari Pengalaman

## 2026-03-07: DB Container Confusion
**Incident:** Konek ke orbit-pgsql-1 instead of supabase-db
**Lesson:** Selalu gunakan supabase-db. orbit-pgsql-1 adalah container lama.
**ADR:** ADR-004

## 2026-03-07: Timezone Double-Convert
**Incident:** setTimezone() di Laravel menyebabkan bug waktu
**Lesson:** DB simpan WIB. Jangan convert. Jangan setTimezone().
**ADR:** ADR-003
