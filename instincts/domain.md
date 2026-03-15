# Domain Instincts — PLN SCADA

## Instinct: RTU Terminology
**Action:** Gunakan terminologi PLN yang benar: RTU (Remote Terminal Unit), LRU (Line Relay Unit), SCADA, UP2D
**Why:** Domain language matters untuk komunikasi dengan user PLN
**When:** Semua UI text, API response, dokumentasi

## Instinct: Operator-First Design
**Action:** Setiap fitur harus bisa dipakai operator PLN yang tidak tech-savvy
**Why:** User utama adalah operator lapangan, bukan engineer
**When:** UI/UX decisions, error messages, workflow design

## Instinct: Offline-Capable Mobile
**Action:** Flutter app harus bisa bekerja tanpa internet, sync saat connect
**Why:** Lokasi RTU sering di daerah dengan sinyal buruk
**When:** Semua fitur mobile, terutama inspeksi form
