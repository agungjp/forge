# Forge — Kirana Corp Foundation Roadmap

**Company:** Kirana Corp
**Goal:** Setup fondasi software house AI-native yang bisa diduplikasi ke proyek lain
**Reference implementation:** Orbit (PLN SCADA UP2D Jabar)
**Last updated:** 2026-03-17 sesi 3

---

## Milestone 0 — Foundation Setup

**Status:** In Progress — Tahap 3 dimulai
**Goal:** Kirana Corp punya SOP, workflow, tools, dan agents yang siap dipakai

---

### Tahap 1 — Referensi & Synthesis ✅ SELESAI
**Selesai:** 2026-03-17 sesi 1-2
**Goal:** Kumpulkan semua referensi dan buat synthesis lengkap.

**Yang dikerjakan:**
- 4 agents paralel: starred repos agungjp (25 repos baru), Claude Code docs resmi, Anthropic GitHub (20+ repos), audit setup laptop
- Findings: Setup score 7.2/10, 4 gap P0 kritis teridentifikasi
- context-mode MCP sudah terinstall (belum dimanfaatkan)
- ralph-loop, hookify DSL, claude-md-management ditemukan sebagai novel patterns

**Output:**
- `orbit/docs/brainstorming/2026-03-17-workflow-adoption-research.md` (828+ baris)
- `orbit/docs/brainstorming/agent-a-starred-repos.md`
- `orbit/docs/brainstorming/agent-b-claude-docs.md`
- `orbit/docs/brainstorming/agent-c-anthropic-github.md`
- `orbit/docs/brainstorming/agent-d-setup-audit.md`

---

### Tahap 2 — Komparasi & Decision Matrix ✅ SELESAI
**Selesai:** 2026-03-17 sesi 3
**Goal:** Bandingkan semua referensi, hindari overlap, tentukan adopt/reference/skip, buat urutan eksekusi.

**Yang dikerjakan:**
- 8 overlap analysis diselesaikan (BMAD vs GSD, NEXUS vs Pegagan, dll)
- Changelog audit Claude Code v2.1.76 — Agent Teams, Git Worktrees, hooks baru
- Paperclip research + upgrade dari REFERENCE ke ADOPT P1
- Linear + GitHub + Slack integration research
- Cyrus (ceedaragents/cyrus) ditemukan sebagai missing link
- 61 items total dievaluasi dan dikategorisasi

**Output:**
- `orbit/docs/brainstorming/2026-03-17-tahap2-decision-matrix.md` (v3 final)

**Summary:**
| Kategori | Jumlah |
|---|---|
| ADOPT NOW (P0-P1) | 26 items |
| ADOPT LATER (P2-P3) | 18 items |
| REFERENCE ONLY | 10 items |
| SKIP | 7 items |

**Stack final yang diputuskan:**
```
Agung (Founder)
  └── Pegagan (CEO Virtual)
        ├── Paperclip (company OS — registry, budget, governance)
        ├── Cyrus (Linear → Claude Code bridge)
        ├── Agent Teams (parallel execution — 40-60% timeline compression)
        ├── Git Worktrees (isolation per agent)
        ├── BMAD + NEXUS (lifecycle management + handoff doctrine)
        ├── GSD + Superpowers (daily execution layer)
        └── Slack + Linear + GitHub (integration layer)
```

**M0 Definition of Done (22 checklist):**
- [ ] BMAD installed + project-context.md orbit
- [ ] NEXUS handoff protocol di forge + pegagan.md
- [ ] 3 specialist agents (laravel-specialist, flutter-expert, postgres-pro)
- [ ] GitHub Actions CI/CD (claude-review + security)
- [ ] `.claude/rules/` directory (laravel.md + flutter.md + deployment.md)
- [ ] Subagent memory: field di 4 agents kritis
- [ ] forge.config.yaml ter-instantiate
- [ ] methodology.md + roles.md di forge/standard/
- [ ] deploy.md + sync-state.md → Skills format
- [ ] Forge personas blueprint extraction
- [ ] Agent Teams aktif + test 1 workflow paralel
- [ ] Git Worktrees aktif di Amelia + Raka
- [ ] Agent Paperclip desktop monitor terinstall
- [ ] Paperclip platform ter-setup lokal
- [ ] `language: "indonesian"` + `respectGitignore: true` di settings.json
- [ ] PostCompact hook aktif
- [ ] claude-md-management terinstall
- [ ] Cyrus terinstall + terhubung Linear + GitHub orbit-server
- [ ] Slack MCP aktif + channel #kirana-updates
- [ ] claude-code-action via `/install-github-app`
- [ ] GitHub branch protection orbit-server
- [ ] Test full loop: Linear issue → Cyrus → PR → approve → merge

---

### Tahap 3 — Plan Eksekusi 🔄 SEDANG BERJALAN
**Dimulai:** 2026-03-17 sesi 3
**Goal:** Convert decision matrix jadi phases konkret dengan todos trackable dan urutan eksekusi yang jelas.

**Output target:**
- `forge/.planning/M0-EXECUTION-PLAN.md` — master plan eksekusi
- Todos baru di `orbit/.planning/todos/pending/` untuk semua P0-P1 items yang belum ada todosnya

**P0 items (harus selesai minggu ini — 13 items):**
1. `language: "indonesian"` + `respectGitignore: true` settings — 5 menit
2. Agent Paperclip desktop monitor install
3. Slack MCP `/plugin install slack`
4. `.claude/rules/` directory (laravel.md + flutter.md + deployment.md)
5. Subagent `memory:` field di 4 agents kritis
6. `isolation: worktree` di Amelia + Raka
7. Agent Teams aktif (`CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1`)
8. TeammateIdle + TaskCompleted hooks
9. BMAD install + project-context.md
10. 3 specialist agents (laravel-specialist, flutter-expert, postgres-pro)
11. NEXUS handoff protocol
12. GitHub Actions CI/CD (claude-code-action + security-review)
13. Cyrus install + connect Linear + GitHub

**P1 items (sprint ini — 13 items):**
1. PostCompact hook
2. ConfigChange hook
3. claude-md-management
4. `/effort` command workflow
5. `context: fork` + `agent:` di skills
6. BMAD Quick Flow (Barry) setup
7. forge.config.yaml instantiation
8. methodology.md + roles.md
9. deploy.md + sync-state.md → Skills format
10. catchup → Skills format
11. Paperclip platform setup
12. claude-code-monitoring-guide
13. Forge personas blueprint extraction

---

### Tahap 4 — Eksekusi ⬜ BELUM DIMULAI
**Goal:** Implementasi semua items dari Tahap 3 plan, berurutan P0 → P1.

---

### Tahap 5 — Evaluasi & Trial ⬜ BELUM DIMULAI
**Goal:** Trial workflow baru di Orbit (1 feature BC-002), ukur efisiensi, update standar.

**Metrics yang diukur:**
- Time to implement 1 story: sebelum vs sesudah
- Token usage per story
- Jumlah session boundary interruptions
- PR approval time (Linear issue → merged PR)

---

## Milestone 1 — Orbit Development
**Status:** Menunggu M0 selesai
**Goal:** Lanjut development Orbit dengan workflow Kirana Corp yang sudah matang.

- S-01: Schema BC-002 Inspeksi RTU
- S-02 dst...
