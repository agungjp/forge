# Pegagan — 5 Modes

Dokumentasi detail setiap mode dengan contoh input dan output.

---

## Mode 1 — INTENT (default)

**Trigger:** Owner describe pekerjaan yang mau dikerjakan.

**Proses:**
1. Parse intent dari natural language
2. Klasifikasi ke workflow yang tepat (lihat routing.md)
3. Brief owner: "Saya akan [workflow] karena [alasan]"
4. Spawn agent/workflow

**Contoh input:**
- "mau tambah fitur export PDF ke laporan inspeksi"
- "ada bug di login, user tidak bisa masuk"
- "perlu buat BC baru untuk notifikasi WA"

**Contoh output:**
```
Saya akan jalankan BMAD Barry QD karena ini fitur dalam milestone existing (BC-002).
Plan: 1 sesi planning → execute phase. Estimasi: 2-3 jam.
Lanjut?
```

---

## Mode 2 — MONITOR

**Trigger:** Owner tanya progress atau "gimana kabar proyek".

**Proses:**
1. Baca `.planning/STATE.md` Quick Summary
2. Scan GSD phases di semua sub-repo
3. Query Linear via MCP untuk active issues
4. Tampilkan dashboard ringkas

**Output format:**
```
**Update:** [tanggal] — [aktivitas terakhir]
**Active:** [task/BC/milestone yang sedang berjalan]
**Progress:** server 01 ✅ 02 🔄 | mobile —
**Linear:** [issues aktif]
**Blockers:** [ada/tidak]
**Next:** [action konkret]
```

---

## Mode 3 — LEARN

**Trigger:** Owner minta penjelasan tentang sistem, tool, atau workflow.

**Proses:**
1. Identifikasi topik (agent, workflow, tool, layer, BC)
2. Baca file relevan
3. Jelaskan dengan bahasa yang sesuai konteks

**Contoh input:**
- "jelaskan gimana NEXUS bekerja"
- "apa itu SLOT 6b?"
- "bedanya BMAD John vs Barry apa?"

---

## Mode 4 — BRAINSTORM

**Trigger:** Owner mau explore ide baru atau design sistem.

**Proses:**
1. Invoke `superpowers:brainstorming` skill
2. Guide proses requirements gathering
3. Produksi design doc
4. Transition ke `superpowers:writing-plans`

**Contoh input:**
- "mau brainstorm fitur monitoring realtime"
- "gimana caranya integrate dengan sistem SCADA lama?"

---

## Mode 5 — META

**Trigger:** Owner minta evaluasi efisiensi sistem, token usage, atau workflow health.

**Proses:**
1. Baca `pegagan-metrics.md` untuk token dan workflow stats
2. Baca session logs terbaru
3. Cek system health: phase stuck, Linear stale, STATE outdated
4. Produksi laporan + rekomendasi konkret

**Output mencakup:**
- Token usage per workflow tier
- Workflow yang paling sering dipakai / direvisi
- Bottleneck yang teridentifikasi
- Rekomendasi model/tool/persona
- Action items prioritas

**Contoh input:**
- "evaluasi efisiensi workflow kita"
- "berapa token yang kita pakai bulan ini?"
- "workflow mana yang paling boros?"
