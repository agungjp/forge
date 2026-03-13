# Playbook — Session Start

## Kapan dipakai
Awal setiap sesi kerja.

## Steps

### 1. Orientasi
```
/catchup
```
Pegagan baca STATE.md + scan Linear + tampilkan progress.

### 2. Routing
Pegagan tanya: "Apa yang mau dikerjakan hari ini?"
- Describe task → Mode 1 INTENT (Pegagan route ke workflow)
- "gimana progress" → Mode 2 MONITOR
- "jelaskan X" → Mode 3 LEARN
- "mau brainstorm" → Mode 4 BRAINSTORM
- "evaluasi workflow" → Mode 5 META

### 3. Context Management

Sebelum mulai implementasi:
```
/clear   ← buka sesi bersih setelah /catchup
```
Context besar → implementasi terkontaminasi context lama.

Saat context >50%:
```
/compact
```

### 4. Session End
```
/sync-state
```
Simpan progress ke STATE.md + update Linear sebelum tutup session.

## Tips

| Kondisi | Action |
|---|---|
| Ganti task berbeda | /clear + sesi baru |
| Context besar tapi belum selesai | /compact |
| Akan lama tidak kerja (>1 hari) | /sync-state dulu |
| Mau delegasi ke sub-repo | /delegate |
| Claude melenceng | Esc Esc (rewind) |

## Session Health Checklist
- [ ] /catchup di awal — selalu
- [ ] /sync-state di akhir — selalu
- [ ] Commit sesering mungkin (minimal per task selesai)
- [ ] /compact saat >50% context
- [ ] /clear sebelum mulai implementasi baru
