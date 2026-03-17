# Forge — Kirana Corp Foundation Roadmap

**Company:** Kirana Corp
**Goal:** Setup fondasi software house yang bisa diduplikasi ke proyek lain
**Reference implementation:** Orbit (PLN SCADA UP2D Jabar)

---

## Milestone 0 — Foundation Setup

**Status:** In Progress
**Goal:** Kirana Corp punya SOP, workflow, tools, dan agents yang siap dipakai

### Phase 1 — Referensi & Synthesis ✅
Kumpulkan semua referensi (Boris Cherny, starred repos, Claude docs, Anthropic GitHub, existing setup) dan buat synthesis.

**Output:** `orbit/docs/brainstorming/2026-03-17-workflow-adoption-research.md`

### Phase 2 — Komparasi & Decision Matrix ✅
Bandingkan semua referensi, hindari overlap, tentukan adopt/reference/skip.

**Output:** Master Decision Matrix di workflow-adoption-research.md

### Phase 3 — Plan Eksekusi 🔄
Buat plan konkret untuk setiap item yang akan diadopsi.

**Sub-tasks:**
- ✅ Global CLAUDE.md (Pegagan identity + workflow standards)
- ✅ KIRANA.md (company identity, load global)
- ⬜ Install plugins kritis (laravel-boost, supabase, pr-review-toolkit)
- ⬜ Install BMAD + generate project-context.md
- ⬜ Buat 4 agents gap (laravel-specialist, flutter-expert, postgres-pro, security-auditor)
- ⬜ Forge SOP documents (methodology, roles, playbook, templates)

### Phase 4 — Eksekusi
Implementasi semua item dari Phase 3.

### Phase 5 — Evaluasi & Trial
Trial workflow baru di Orbit (1 feature BC-002), ukur efisiensi, update standar.

---

## Milestone 1 — Orbit Development
Lanjut development Orbit dengan workflow Kirana Corp yang sudah matang.
- S-01: Schema BC-002 Inspeksi RTU
- S-02 dst...
