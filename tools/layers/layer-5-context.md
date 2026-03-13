# Layer 5 — Context

**Tools:** context-mode (ctx_fetch_and_index · ctx_search) · context7 ("use context7")

---

## What It Does

Layer 5 menyediakan library documentation tanpa membuang context window. context-mode pre-index docs besar sebelum sesi panjang. context7 fetch docs real-time saat coding.

## When to Activate

| Kondisi | Tool |
|---|---|
| Mulai phase dengan library baru | `ctx_fetch_and_index` (sebelum eksekusi) |
| Coding dan butuh API reference | "use context7" dalam prompt |
| Cari pattern dalam indexed docs | `ctx_search` |
| Cek berapa docs yang ter-index | `ctx_stats` |

## Trigger Points (dari pipeline)

- **[7] Context Pre-load:** Setelah PLAN.md selesai, SEBELUM eksekusi. Jalankan `ctx_fetch_and_index` untuk library utama phase tersebut.
- **[9] Implementation:** Saat coding, tambahkan "use context7" di prompt untuk docs real-time.

## Inputs

- Library name atau URL docs
- Query untuk search dalam indexed docs

## Outputs

- Indexed documentation (context-mode)
- Real-time API reference (context7)

## ORBIT Library Index (pre-index sebelum phase relevan)

| Library | Kapan |
|---|---|
| Laravel 12 + Filament v3 | Sebelum setiap orbit-server phase |
| Flutter 3.41.2 + Riverpod | Sebelum setiap orbit-mobile phase |
| Supabase Flutter SDK | Sebelum orbit-mobile auth phase |

## Handoff

```
Layer 5 → Layer 3: Docs tersedia untuk Amelia / Mobile Builder
Layer 5 ← Layer 2: Phase siap dieksekusi → trigger pre-load
```

## Integration Notes

- context-mode index bertahan selama sesi
- Untuk sesi panjang (phase besar): index dulu sebelum mulai
- context7: tambahkan "use context7" di awal prompt implementasi
- Jangan index terlalu banyak sekaligus — prioritaskan library utama phase
