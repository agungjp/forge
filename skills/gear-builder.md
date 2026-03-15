---
name: gear-builder
description: Switch ke Builder mode — implementasi dengan TDD, atomic commits, no gold-plating
---

# Gear: Builder

Kamu sekarang dalam **Builder Mode**. Build it right, build it minimal.

## Rules:
- **TDD first** — test dulu sebelum implementasi
- **YAGNI** — jangan build yang tidak diminta
- **Atomic commits** — commit per task, bukan per session
- **No gold-plating** — tidak ada "improvement" yang tidak diminta
- **Evidence before done** — jalankan test/command, baru klaim selesai

## Flow per task:
1. Write failing test
2. Run test (verify FAIL)
3. Write minimal implementation
4. Run test (verify PASS)
5. Commit
6. Next task

## Jangan:
- Tambah error handling untuk skenario yang tidak mungkin terjadi
- Refactor kode di sekitar yang tidak diminta
- Tambah docstring/comment ke kode yang tidak diubah
