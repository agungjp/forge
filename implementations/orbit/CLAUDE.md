# Reference: orbit/CLAUDE.md (snapshot 2026-03-14)

# CLAUDE.md — ORBIT Root

**Bahasa:** Indonesia (ikuti bahasa pengguna).

---

## Project

**ORBIT** — Sistem inspeksi & monitoring RTU untuk PLN SCADA UP2D Jawa Barat.

| Repo | Stack | GitHub |
|---|---|---|
| `orbit/` | Docs · Planning · Orchestration | agungjp/orbit |
| `orbit-server/` | Laravel 12 · Filament v3 · Docker | agungjp/orbit-server |
| `orbit-mobile/` | Flutter 3.41.2 · Riverpod · Supabase | agungjp/orbit-mobile |

Detail teknis: `orbit-server/CLAUDE.md` · `orbit-mobile/CLAUDE.md`

---

## Peran Root — Master Orchestrator

Root adalah **satu-satunya sumber kebenaran** untuk domain, milestone, dan phase.
Sub-repo hanya berisi implementasi teknis.

**Root BOLEH:** update docs, BC registry, ROADMAP, STATE, delegate ke sub-repo.
**Root TIDAK BOLEH:** eksekusi kode, migration, build, test — semua di sub-repo.

Referensi lengkap: `docs/workflow-sdlc.md`

---

## Bounded Contexts

Lihat `docs/bc-registry.md` untuk arsitektur lengkap.

- **BC-001** RTU Trouble Ticket — orbit-server (Stable)
- **BC-002** Inspeksi RTU — orbit-server + orbit-mobile (In Development)
- **BC-003** Kafka SCADA Data — orbit-server (Active)

---

## Milestones & Progress

Lihat `.planning/ROADMAP.md` — phase diberi prefix repo: `S*` = server, `M*` = mobile.

---

## Environments

| Env | Akses | URL |
|---|---|---|
| Dev (lokal) | OrbStack | `http://localhost:8000` |
| Staging | `ssh orbit_staging` (Tailscale) | `http://100.96.28.46:8000` |
| Production | `ssh orbit` (Tailscale) | `https://orbit.pegagan.online` |

**Production live — hati-hati.** Detail: `docs/infrastructure.md`

---

## Production Safety Rules

**WAJIB sebelum apapun ke production:**
1. Test di staging dulu
2. Backup DB sebelum migration: `ssh orbit "docker exec supabase-db pg_dump -U postgres orbit > /tmp/backup.sql"`
3. Gunakan deploy script — JANGAN manual docker compose di production
4. Kalau ragu → tanya dulu, jangan eksekusi

Saya (Claude) akan **selalu konfirmasi** sebelum command yang menyentuh production.

---

## Conventions

- **Commit:** `feat:` / `fix:` / `refactor:` / `docs:` / `chore:`
- **Branch:** `feature/S2-filament-resource` · `hotfix/fix-login` · `staging` · `main`
- **Timezone:** WIB — JANGAN `setTimezone()` atau double-convert
- **Git mobile:** `GIT_OPTIONAL_LOCKS=0` saat push/pull
- **DB aktif:** `supabase-db` — jangan `orbit-pgsql-1`

---

## Forge — Engineering Standard

ORBIT adalah **reference implementation** dari `agungjp/forge`.

**Prinsip:** Semua pattern/standard baru yang ditemukan saat kerja di ORBIT → update forge juga.

| Repo | Path Lokal | Fungsi |
|---|---|---|
| `agungjp/forge` | `~/Sandbox/forge/` | Engineering OS — standard + playbook + templates |

Saat ada pattern baru yang layak dijadikan standar:
1. Implementasi di orbit dulu
2. Extract pattern ke forge (`standard/`, `playbook/`, atau `personas/`)
3. Commit keduanya

Brainstorm awal: `docs/plans/2026-03-12-forge-workflow-brainstorm.md`

---

## Commands Root

```
/catchup          — resume sesi dari STATE.md
/catchup full     — orientasi penuh
/sync-state       — simpan progress ke STATE.md sebelum clear
/delegate         — buat briefing untuk sub-repo
/progress         — scan status phase semua sub-repo
```
