# BMAD Method — Referensi untuk Solo Developer

**Sumber:** `forge/vendor/bmad-method/src/bmm/`
**Konteks:** Referensi ini difokuskan untuk solo developer, bukan enterprise team.

---

## Apa itu BMAD?

BMAD (Breakthrough Methodology for Agile Development) adalah framework AI-native untuk software development. Struktur utamanya: setiap fase punya **agent** dengan persona khusus dan **workflow** berbasis step-file yang dieksekusi secara berurutan dan disiplin.

Prinsip inti: *"Specs are for building, not bureaucracy. Code that ships is better than perfect code that doesn't."*

---

## Arsitektur Workflow BMAD

Semua workflow BMAD menggunakan **step-file architecture**:

- Setiap step adalah file instruksi mandiri, dimuat satu per satu (Just-In-Time)
- State di-track lewat frontmatter file output (field `stepsCompleted`)
- Dokumen dibangun secara append-only — tidak ditulis ulang, hanya ditambahkan
- User selalu konfirmasi sebelum lanjut ke step berikutnya

**Kenapa ini penting untuk solo dev:** Pattern ini mencegah "lost in the middle" — LLM tidak kehilangan konteks karena hanya membaca satu step sekaligus.

---

## Fase & Workflow BMAD (Full Flow)

```
Phase 1: Analysis
  └─ Product Brief     → dokumen executive brief (Analyst/Mary)
  └─ Market Research   → riset pasar, domain, teknis (Analyst/Mary)

Phase 2: Planning
  └─ Create PRD        → Product Requirements Document (PM/John)
  └─ UX Design         → wireframe, user flow (UX/tidak ada nama)

Phase 3: Solutioning
  └─ Create Architecture  → keputusan teknis, ADR (Architect/Winston)
  └─ Create Epics & Stories → breakdown stories dari PRD (PM/John)
  └─ Implementation Readiness → validasi PRD+UX+Arch selaras (PM/Architect)

Phase 4: Implementation
  └─ Sprint Planning    → generate sprint-status.yaml dari epics (SM/Bob)
  └─ Create Story       → buat story file lengkap untuk dev agent (SM/Bob)
  └─ Dev Story          → eksekusi story, TDD cycle (Dev/Amelia)
  └─ Code Review        → adversarial review multi-dimensi (Dev/Amelia)
  └─ Correct Course     → course correction jika ada perubahan besar
  └─ Retrospective      → review setelah epic selesai (SM/Bob)

Quick Flow (Solo Dev):
  └─ Quick Spec (QS)    → buat tech spec siap implementasi, cepat
  └─ Quick Dev (QD)     → implementasi dari spec atau instruksi langsung
  └─ Quick Dev New (QQ) → unified: clarify → plan → implement → review (experimental)
```

---

## Agent Roster

| Agen | Nama | Fokus | Relevansi Solo Dev |
|---|---|---|---|
| **quick-flow-solo-dev** | Barry | Rapid spec + lean implementation | ✅ Utama |
| **dev** | Amelia | Story execution, TDD | ✅ Utama |
| **pm** | John | PRD, epics, backlog | Opsional (fitur besar) |
| **architect** | Winston | Architecture decisions | Opsional (sistem baru) |
| **sm** | Bob | Sprint planning, story prep | Opsional |
| **analyst** | Mary | Research, product brief | Jarang untuk solo dev |
| **qa** | Quinn | Test automation, E2E | Opsional |
| **ux-designer** | — | UX design, wireframes | Jarang untuk solo dev |

---

## Quick Flow — Jalur Utama Solo Dev

Quick Flow dirancang khusus untuk efisiensi solo developer. Terdiri dari dua workflow:

### Quick Spec (QS)

**Tujuan:** Dari percakapan ke tech spec yang siap diimplementasi.

**Standard "Ready for Development":**
- **Actionable** — setiap task punya file path dan action spesifik
- **Logical** — task diurutkan berdasarkan dependency (lowest level first)
- **Testable** — semua AC pakai format Given/When/Then (happy path + edge case)
- **Complete** — tidak ada placeholder atau TBD
- **Self-Contained** — agent baru bisa implement tanpa baca workflow history

**Kapan pakai:** Perubahan kecil-menengah, fitur dalam scope yang jelas.

### Quick Dev (QD)

**Tujuan:** Implementasi dari tech spec atau instruksi langsung.

**Cara kerja:**
- Mode deteksi otomatis: ada tech spec → ikuti spec; tidak ada → terima instruksi langsung
- Implementasi autonomous end-to-end
- State persists via variabel: `{baseline_commit}`, `{execution_mode}`, `{tech_spec_path}`

### Quick Dev New / QQ (Experimental)

**Tujuan:** Unified flow — clarify intent → plan → implement → adversarial review → present.

**Scope standard:**
- Target satu user-facing goal per spec
- Optimal 900–1600 token untuk konsumsi LLM
- Jika multi-goal → split menjadi beberapa QD

---

## Full Flow — Kapan Digunakan Solo Dev

Full BMAD flow (Phase 1-4) berguna untuk solo dev dalam situasi berikut:

| Situasi | Flow yang Dipakai |
|---|---|
| Fitur kecil / enhancement | Quick Flow (QS → QD) |
| Bounded context baru | Full Flow Phase 2-4 (PRD → Arch → Epics → Stories → Dev) |
| Sistem baru dari nol | Full Flow Phase 1-4 |
| Bug fix / hotfix | Langsung Dev tanpa spec (atau QD minimal) |
| Refactor besar | Architecture workflow → Dev Story |

---

## Story Lifecycle (Status State Machine)

BMAD mendefinisikan lifecycle story yang ketat:

```
Epic:  backlog → in-progress → done

Story: backlog → ready-for-dev → in-progress → review → done

Retrospective: optional ↔ done
```

**Untuk solo dev:** Status ini bisa di-track manual di Linear atau lewat sprint-status.yaml jika pakai full BMAD setup.

---

## Prinsip Implementasi BMAD yang Berguna

Dari agent **Dev (Amelia)** — berlaku universal:

1. Baca SELURUH story file sebelum implementasi
2. Eksekusi task/subtask sesuai urutan — tidak ada skipping
3. Mark `[x]` HANYA jika implementasi DAN tests sudah selesai dan passing
4. Jalankan full test suite setelah setiap task
5. Jangan berbohong soal test — harus benar-benar exist dan passing

Dari agent **Barry (Quick Flow):**

1. Planning dan execution adalah dua sisi koin yang sama
2. Code yang ships lebih baik dari perfect code yang tidak pernah selesai
3. Minimum ceremony, ruthless efficiency

---

## Artefak Utama BMAD

| Artefak | Deskripsi | Di mana disimpan |
|---|---|---|
| `product-brief.md` | Executive brief dari fase analysis | `planning_artifacts/` |
| `prd.md` | Product Requirements Document | `planning_artifacts/` |
| `architecture.md` | Architecture Decision Record | `planning_artifacts/` |
| `epics.md` | Daftar epics + stories | `planning_artifacts/` |
| `sprint-status.yaml` | Tracking status per story | `implementation_artifacts/` |
| `{story-key}.md` | Story file lengkap per story | `implementation_artifacts/` |
| `tech-spec-wip.md` | Tech spec sementara (Quick Flow) | `implementation_artifacts/` |
| `project-context.md` | Konteks project untuk semua agent | root atau `**/*.md` |

---

## Forge vs BMAD — Pemetaan Konsep

| Forge Concept | BMAD Equivalent | Catatan |
|---|---|---|
| Forge phase (Linear) | Epic + Stories | BMAD lebih granular |
| `/gsd:plan-phase` | Quick Spec (QS) | Forge lebih informal |
| `/gsd:execute-phase` | Dev Story (QD) | Mirip, tapi BMAD lebih structured |
| Tech Lead (QD brief) | Barry / Quick Spec | Sama |
| STATE.md | sprint-status.yaml | Forge lebih ringkas |
| CLAUDE.md per sub-repo | project-context.md | Fungsi serupa |

Detail pemetaan lihat juga: `new-feature.md` section **BMAD Alignment**.

---

## Referensi File BMAD

```
forge/vendor/bmad-method/src/bmm/
├── agents/
│   ├── quick-flow-solo-dev.agent.yaml  ← Barry, main solo dev agent
│   ├── dev.agent.yaml                  ← Amelia, implementasi
│   ├── pm.agent.yaml                   ← John, PRD & epics
│   ├── architect.agent.yaml            ← Winston, architecture
│   ├── sm.agent.yaml                   ← Bob, sprint & stories
│   └── qa.agent.yaml                   ← Quinn, testing
└── workflows/
    ├── bmad-quick-flow/
    │   ├── quick-spec/workflow.md       ← QS: spec creation
    │   ├── bmad-quick-dev/workflow.md   ← QD: implementation
    │   └── bmad-quick-dev-new-preview/  ← QQ: unified flow (experimental)
    ├── 1-analysis/                      ← product brief, research
    ├── 2-plan-workflows/                ← PRD creation
    ├── 3-solutioning/                   ← architecture, epics & stories
    └── 4-implementation/                ← sprint planning, story, dev, review
```
