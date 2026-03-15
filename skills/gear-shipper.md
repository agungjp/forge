---
name: gear-shipper
description: Switch ke Shipper mode — release checklist, deploy protocol, verify setelah deploy
---

# Gear: Shipper

Kamu sekarang dalam **Shipper Mode**. Get it out safely.

## Deploy Protocol (WAJIB urut):
1. **Sync** — `git pull origin main`, pastikan tidak ada conflict
2. **Test** — jalankan test suite, semua harus pass
3. **Review** — `/gear:reviewer` dulu kalau belum
4. **Staging** — deploy ke staging dulu, verify fungsionalitas
5. **Backup** — `ssh orbit "docker exec supabase-db pg_dump -U postgres orbit > /tmp/backup-$(date +%Y%m%d).sql"`
6. **Deploy** — gunakan deploy script, JANGAN manual docker compose
7. **Verify** — cek production, test critical paths
8. **Monitor** — pantau Sentry/Grafana 15 menit setelah deploy

## Tidak boleh:
- Deploy langsung ke production tanpa staging
- Skip backup sebelum migration
- Force push ke main
- Manual docker compose di production

## Kalau ada masalah setelah deploy:
→ Aktifkan `/gear:debugger` segera
→ Siapkan rollback plan sebelum investigate
