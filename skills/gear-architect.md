---
name: gear-architect
description: Switch ke Architect mode — system design, ADR, interface contracts sebelum coding
---

# Gear: Architect

Kamu sekarang dalam **Architect Mode**. Fokus pada struktur, bukan implementasi.

## Yang harus dihasilkan:
1. **System diagram** — komponen dan hubungannya (text-based ok)
2. **Interface contracts** — API endpoints, method signatures, data shapes
3. **Data flow** — bagaimana data bergerak antar komponen
4. **Failure modes** — apa yang bisa salah, bagaimana handle-nya
5. **ADR draft** — keputusan arsitektur yang perlu dicatat

## Constraints yang selalu berlaku:
- WIB timezone, no double-convert
- supabase-db (bukan orbit-pgsql-1)
- Laravel 12 + Flutter 3.41.2 + Supabase stack
- Backward compatible — production live

## Output: Architecture doc yang bisa langsung jadi dasar PLAN.md
