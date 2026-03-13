# Forge — Pipeline Lengkap

Semua SLOT dengan trigger, input, output, dan tools.

---

```
╔══════════════════════════════════════════════════════════════════╗
║  FORGE PIPELINE — SLOT SYSTEM                                    ║
╚══════════════════════════════════════════════════════════════════╝

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SLOT SESSION — Setiap Sesi
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Start → /catchup          (orientasi, baca STATE.md)
End   → /sync-state       (simpan progress)
Tool:   GSD STATE.md + Linear sync

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SLOT 0 — FOUNDATION (sekali per proyek / major pivot)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[0a] Domain Mapping
     Brainstorming semua probis, petakan domain, identifikasi BC
     Tool:   PM + Backend Architect
     Output: bc-registry.md, domain map visual

[0b] BC Prioritization
     Urutan pengerjaan berdasarkan: dependencies, business value, risk
     Tool:   PM + diskusi stakeholder
     Output: ROADMAP.md high-level

[0c] Problem Validation
     Validasi apakah solusi yang diusulkan tepat
     Tool:   PM + design-research skill
     Output: validated problem statement per BC

[0d] Product Roadmap
     Timeline, milestone targets, dependencies antar BC
     Tool:   GSD new-project + Linear milestone setup
     Output: PROJECT.md, Linear milestones

[0e] Intake Meeting
     Validate user story candidate + priority ranking
     Trigger: bi-weekly atau saat ada permintaan baru dari lapangan
     Output: user story candidate validated, priority ranked

> SLOT 0.5 (Continuous Intake): grooming backlog regular setiap 2 minggu.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SLOT 1 — DISCOVERY (per BC baru)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[1]  User Story
     Input:  Kebutuhan bisnis / probis dari lapangan
     Output: "Sebagai X, saya ingin Y, agar Z"
     Owner:  Developer + stakeholder

[1b] User Research
     Minimal 3-5 interview user untuk BC baru
     Capture pain points, mental model, validate assumptions
     Tool:   PM persona (interview template)
     Output: interview notes, pain point mapping

[2]  PRD
     Input:  User Story + User Research
     Output: Functional Requirements, Non-Functional, Acceptance Criteria
     Tool:   BMAD John (PM) — interview ringan
     Gate:   Requirements clear, acceptance criteria terdefinisi

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SLOT 2 — DESIGN (per milestone)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[3]  Technical Spec
     Input:  PRD approved
     Output: API contracts, data flow, integration points,
             External Dependencies Checklist, Security assumptions
     Tool:   Barry QS (BMAD Quick Flow)
     Slot trigger: milestone baru = full interview,
                   phase tambahan = Barry QD direct brief

[4a] Architecture Discussion (on-demand)
     Trigger: milestone kompleks atau ragu dengan pendekatan
     Format:  Conversational — bounce ideas, challenge & propose options
     Tool:    Backend Architect (discussion mode)
     Output:  Keputusan arsitektur → lanjut ke [4] untuk formalisasi

[4]  System Architecture
     Input:  Technical Spec (+ Architecture Discussion output jika ada)
     Output: Schema design, service boundaries, ADRs,
             BC boundary validation, security model,
             compliance checklist, index specifications
     Tool:   Backend Architect persona

[4b] Security Review (WAJIB)
     Input:  System Architecture
     Checklist: Auth/authz, injection vulnerabilities, data exposure risks,
                Cloudflare rules, supply chain security, compliance
     Tool:   Security Engineer persona
     Gate:   WAJIB PASS sebelum lanjut ke [5]

[5]  UI/UX Design (conditional — hanya phase dengan UI)
     Input:  PRD + Technical Spec
     Output: Component inventory, design tokens, layout, design system
     Tool:   ui-ux-pro-max + Figma MCP + design-research skill
     Mobile: Tambah "offline capability planning" sub-step

[ADR Review] (berkala — setiap 2-3 milestone)
     Audit apakah ADR yang ada masih valid
     Tool:    Backend Architect
     Output:  ADR update atau ADR baru

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SLOT 3 — PLANNING (per phase)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[6]  Phase Breakdown & Planning
     Input:  Architecture + Design approved
     Output: Phase list di ROADMAP.md,
             Linear issues dibuat + dependencies + dependency graph,
             PLAN.md per phase
     Tool:   GSD plan-phase + Linear MCP

[6b] Cross-repo Sync (conditional)
     Trigger: phase yang butuh >1 repo bersamaan
     Output:  API contract finalized, deployment order defined,
              blocking dependencies set di Linear
     Tool:    GSD + Linear blocking issues

[7]  Context Pre-load
     Input:  Phase siap dieksekusi
     Output: Library docs ter-index
     Tool:   context-mode ctx_fetch_and_index
     Timing: Setelah [6], SEBELUM [8] TDD

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SLOT 4 — BUILD (per phase, di sub-repo)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[8]  TDD — Test First
     Input:  PLAN.md
     Output: Test cases written FIRST, semua red
     Tool:   Superpowers TDD
     Rule:   NEVER skip. Tests HARUS ada sebelum implementasi.
             Unit test coverage ≥80% per file

[9]  Implementation
     Input:  Test cases (red)
     Output: Code yang buat test green, commit kecil-kecil per task
     Tool:   BMAD Amelia + GSD execute-phase + context7
     Rule:   Execute tasks IN ORDER. Run full test suite setelah SETIAP task.
             NEVER proceed dengan failing tests.

[10] Evidence Collection (per task)
     Input:  Task selesai
     Output: Test results, screenshots, response times, log output, coverage
     Tool:   Evidence Collector persona
     Rule:   Tidak ada klaim "done" tanpa evidence

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SLOT 5 — HARDEN (per phase)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[11] Self-Audit (Adversarial Review)
     Input:  Semua tasks selesai + evidence terkumpul
     Output: Temuan dari sudut pandang "apa yang bisa salah?"
     Tool:   Barry CR + Superpowers verification
     Rule:   Default assumption: ada yang salah.
             "First implementations typically need 2-3 revision cycles."

[11c] Documentation Update (WAJIB sebelum [14])
     Output: API docs updated, CONTEXT.md updated,
             Migration guide kalau ada breaking change
     Rule:   API changes WAJIB update OpenAPI spec
             Schema changes WAJIB update ERD

[11d] Data Migration Check (conditional — jika ada schema change)
     Checklist: DB schema validation di staging, backfill script,
                rollback plan, data integrity check script
     Tool:   DevOps Automator + Backend Architect

[12] QA & Acceptance
     Input:  Self-audit pass + docs updated
     Output: Semua acceptance criteria dari PRD terpenuhi
             E2E tests pass, API tests pass
     Tool:   BMAD Quinn + /gsd:verify-work
     Note:   HARUS 100% pass sebelum staging

[12b] Performance Testing
     Input:  QA pass
     Output: P50/P95/P99 response times, max concurrent users, error rate
     Tool:   DevOps Automator + k6
     Scenarios: smoke, load, stress, spike, soak

[12c] Security Testing
     Input:  QA pass
     Checklist: XSS, CSRF, auth bypass, rate limiting, SSL pinning (mobile)
     Tool:   Security Engineer persona + SAST di CI
     Gate:   Tidak ada finding critical/high

[13] Reality Check
     Input:  QA pass + performance pass + security pass + evidence
     Output: READY atau NEEDS WORK (default: NEEDS WORK)
     Tool:   Reality Checker persona
     Rule:   Automatic FAIL: "zero issues found", "production ready" tanpa bukti

[13b] Security Gate (WAJIB)
     Input:  Reality Check: READY
     Checklist: OWASP Top 10, auth flows, data exposure, Cloudflare rules
     Tool:   Security Engineer persona
     Gate:   WAJIB PASS sebelum [14]

[14] Code Review
     Input:  Security Gate pass
     Output: PR approved, siap merge
     Tool:   Superpowers requesting-code-review

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SLOT 6 — LAUNCH (per phase)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[15] Staging Deploy
     Input:  PR approved
     Output: Running di staging, CI pass
     Tool:   GitHub Actions otomatis

[16] Staging Verification
     Input:  Staging running
     Output: Smoke test pass, E2E verified di staging
     Note:   JANGAN re-verify yang sudah di [12]. Fokus environment-specific issues.

[17a] Release Planning Check (conditional — multi-repo deploy)
     Checklist: Conflicting API changes, compatibility matrix, deploy order, rollback plan
     Tool:   GSD + Linear dependency check

[17] Production Deploy
     Input:  Staging verified + release plan ready
     Tool:   GitHub Actions + Developer approve merge

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SLOT 7 — OPERATE (per phase, post-deploy)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[18] Health Check (T+5 menit post-deploy)
     Checklist: Error rate, response time, logs, backup status, crash rate (mobile)
     Note:   Anomali → trigger SLOT H langsung

[19] Observability Steady State
     Stack: Prometheus + Grafana, Loki + Promtail, Sentry self-hosted
     Requirements: performance baseline, alerts, security monitoring,
                   user behavior tracking, certificate expiry alert,
                   automated backup health check

[19b] Cost Optimization Report (berkala — per kuartal)
     Output: Infrastructure cost vs user count, API usage vs budget, rekomendasi

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SLOT 8 — RETROSPECTIVE (per milestone)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[20] AI Usage Audit
     Input:  Token usage data semua phase dalam milestone
     Output: Token usage report, efisiensi per agent/tool, rekomendasi
     Tool:   AI Resource Analyst persona
     Cadence: Per milestone

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SLOT 9 — BUSINESS LOOP (per milestone)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[21] Feedback Loop
     Input:  Production feature live
     Output: User feedback (minimal 3-5 interview), pain points baru
     Tool:   PM persona — user interview post-launch

[22] Business Review
     Input:  Observability data + feedback loop
     Output: Business impact report: adoption, usage, error reduction, satisfaction

[Q]  Quarterly System Audit
     Cek: ADRs valid, technical debt, security posture, performance baseline,
          AI usage, dependency updates
     Tool:   Backend Architect + Security Engineer + AI Resource Analyst

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SLOT H — HOTFIX (on-demand, trigger: bug/incident)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[H1] Triage & Isolate
     Output:  Severity (Critical/High/Medium/Security-Critical),
              Scope, Root cause hypothesis, reproduce steps
     Tool:    Incident Response Commander + Superpowers systematic-debugging

[H2] Fix
     Output:  Fix minimal — no scope creep
              Test untuk reproduce case WAJIB ditambah
     Tool:    GSD quick + DevOps Automator (kalau infra issue)
     Branching: single-repo → hotfix branch, cross-repo → fix sumber dulu

[H3] Fast Deploy
     Output:  PR ke main
              Skip staging kalau Critical/Security-Critical
              Cherry-pick ke staging setelahnya

[H4] Verify & Post-mortem
     Output:  Bug verified tidak muncul lagi
              Root cause + fix di docs/bugs/
              ADR update kalau ada keputusan arsitektur baru
              Linear issue closed, Runbook updated

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SLOT CC — CORRECT COURSE (on-demand)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Trigger:   >30% timeline slip ATAU major scope change ATAU
           requirement berubah fundamental mid-milestone
Tool:      BMAD [CC] Correct Course workflow
Output:    Updated PRD + revised phase plan + Linear re-prioritization
Note:      Jangan lanjut implementasi sampai CC selesai dan disetujui
```
