# ORBIT ADR Registry

ADR yang berlaku di ORBIT sebagai reference implementation.

**Source:** `orbit/.planning/STATE.md`
**Last Synced:** 2026-03-14

---

| ADR | Keputusan | Berlaku untuk |
|---|---|---|
| ADR-001 | Dev Model — Local Docker + SSH Tunnel (tunnel: `127.0.0.1:15434` → `supabase-db:5434`). Tidak perlu duplicate DB setup, langsung konek ke orbit_dev di container yang sama dengan production DB. | orbit-server, orbit-mobile |
| ADR-003 | Timezone — WIB, No Double-Convert. DB simpan WIB. JANGAN `setTimezone()` atau double-convert di kode manapun. | orbit-server (Laravel), orbit-mobile (Flutter) |
| ADR-004 | DB Active Container — Selalu gunakan container `supabase-db`, bukan `orbit-pgsql-1`. | Dev lokal dan production |
| ADR-008 | Forge — Engineering Workflow Standard. Buat repo terpisah `agungjp/forge` sebagai engineering OS untuk solo dev. ORBIT sebagai reference implementation pertama. Structure: 6-layer architecture + slot-based pipeline. 2 pipeline: Feature + Hotfix. | forge, orbit |

---

## Notes

- ADR-002, ADR-005, ADR-006, ADR-007 tidak terdokumentasi di STATE.md (gap/skip).
- ADR baru → tambah di `orbit/.planning/STATE.md` dulu, lalu sync ke sini.
