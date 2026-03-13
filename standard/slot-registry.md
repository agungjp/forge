# Forge — Slot Registry

Registry lengkap semua slot dan step dengan trigger condition, input, output, dan tools.

---

| Slot | Step | Nama | Trigger | Input | Output | Tool |
|---|---|---|---|---|---|---|
| SESSION | — | Session Start | Setiap sesi | — | Context loaded | /catchup |
| SESSION | — | Session End | Setiap sesi | — | State saved | /sync-state |
| SLOT 0 | 0a | Domain Mapping | Sekali per proyek | Kebutuhan bisnis | bc-registry.md | PM + Backend Architect |
| SLOT 0 | 0b | BC Prioritization | Sekali per proyek | bc-registry.md | ROADMAP.md high-level | PM + stakeholder |
| SLOT 0 | 0c | Problem Validation | Sekali per proyek | Domain map | validated problem statement | PM + design-research |
| SLOT 0 | 0d | Product Roadmap | Sekali per proyek | Validated problems | PROJECT.md, Linear milestones | GSD new-project |
| SLOT 0 | 0e | Intake Meeting | Bi-weekly | Permintaan lapangan | user story candidates | PM + stakeholder |
| SLOT 0.5 | — | Continuous Intake | Bi-weekly | Backlog | Backlog groomed | PM |
| SLOT 1 | 1 | User Story | Per BC baru | Kebutuhan bisnis | User story statement | Developer + stakeholder |
| SLOT 1 | 1b | User Research | Per BC baru | User story | Interview notes, pain points | PM (interview template) |
| SLOT 1 | 2 | PRD | Per BC baru | User story + research | PRD dengan AC | BMAD John |
| SLOT 2 | 3 | Technical Spec | Per milestone | PRD approved | API contracts, data flow | Barry QS |
| SLOT 2 | 4a | Arch Discussion | On-demand | Ragu dengan approach | Keputusan arsitektur | Backend Architect (discussion) |
| SLOT 2 | 4 | System Architecture | Per milestone | Technical Spec | Schema, ADRs, security model | Backend Architect |
| SLOT 2 | 4b | Security Review | Per milestone (WAJIB) | System Architecture | Security approval | Security Engineer |
| SLOT 2 | 5 | UI/UX Design | Per phase dengan UI | PRD + Tech Spec | Design system, component inventory | ui-ux-pro-max + Figma |
| SLOT 2 | ADR | ADR Review | Setiap 2-3 milestone | Existing ADRs | ADR updates | Backend Architect |
| SLOT 3 | 6 | Phase Breakdown | Per milestone | Architecture approved | ROADMAP.md, PLAN.md, Linear issues | GSD plan-phase + Linear |
| SLOT 3 | 6b | Cross-repo Sync | Phase multi-repo | Phase dependencies | API contract, deploy order | GSD + Linear |
| SLOT 3 | 7 | Context Pre-load | Per phase (jika perlu) | Phase siap eksekusi | Library docs indexed | context-mode |
| SLOT 4 | 8 | TDD | Per phase | PLAN.md | Test cases (red) | Superpowers TDD |
| SLOT 4 | 9 | Implementation | Per phase | Test cases (red) | Code + green tests | BMAD Amelia + GSD execute |
| SLOT 4 | 10 | Evidence Collection | Per task | Task selesai | Test results, screenshots | Evidence Collector |
| SLOT 5 | 11 | Self-Audit | Per phase | All tasks done | Adversarial review findings | Barry CR + Superpowers |
| SLOT 5 | 11c | Docs Update | Per phase (WAJIB) | Implementasi selesai | API docs, CONTEXT.md updated | Developer |
| SLOT 5 | 11d | Data Migration Check | Phase dengan schema change | Schema changes | Migration + rollback scripts | DevOps + Backend Architect |
| SLOT 5 | 12 | QA & Acceptance | Per phase | Self-audit pass | AC terpenuhi, E2E pass | BMAD Quinn + gsd:verify-work |
| SLOT 5 | 12b | Performance Testing | Per phase | QA pass | Performance report | DevOps Automator + k6 |
| SLOT 5 | 12c | Security Testing | Per phase | QA pass | Security report | Security Engineer + SAST |
| SLOT 5 | 13 | Reality Check | Per phase | All gates pass | READY / NEEDS WORK | Reality Checker |
| SLOT 5 | 13b | Security Gate | Per phase (WAJIB) | Reality Check: READY | Security approval | Security Engineer |
| SLOT 5 | 14 | Code Review | Per phase | Security Gate pass | PR approved | Superpowers code-review |
| SLOT 6 | 15 | Staging Deploy | Per phase | PR approved | Staging running | GitHub Actions |
| SLOT 6 | 16 | Staging Verification | Per phase | Staging running | Smoke test + E2E pass | Developer + Quinn |
| SLOT 6 | 17a | Release Planning Check | Multi-repo deploy | Phase dependencies | Compatibility matrix, rollback plan | GSD + Linear |
| SLOT 6 | 17 | Production Deploy | Per phase | Staging verified | Production running | GitHub Actions |
| SLOT 7 | 18 | Health Check | T+5 post-deploy | Production running | Health confirmed / SLOT H triggered | Developer |
| SLOT 7 | 19 | Observability | Per phase | Health check pass | Monitoring stack aktif | DevOps Automator |
| SLOT 7 | 19b | Cost Optimization | Per kuartal | Usage data | Cost report + rekomendasi | DevOps + AI Resource Analyst |
| SLOT 8 | 20 | AI Usage Audit | Per milestone | Token usage data | AI efficiency report | AI Resource Analyst |
| SLOT 9 | 21 | Feedback Loop | Per milestone | Feature live | User feedback, pain points | PM |
| SLOT 9 | 22 | Business Review | Per milestone | Observability + feedback | Business impact report | AI Resource Analyst |
| SLOT 9 | Q | Quarterly Audit | Per kuartal | All data | Audit report + action items | Backend Architect + Security Engineer |
| SLOT H | H1 | Triage & Isolate | Bug/incident | Bug report | Severity, scope, hypothesis | Incident Response + Superpowers debug |
| SLOT H | H2 | Fix | Root cause confirmed | Reproduce confirmed | Fix + test | GSD quick |
| SLOT H | H3 | Fast Deploy | Fix + test pass | — | PR ke main | GitHub Actions |
| SLOT H | H4 | Verify & Post-mortem | Production fix deployed | — | Post-mortem, docs updated | Developer |
| SLOT CC | — | Correct Course | >30% slip / major scope change | Current state | Updated PRD + revised plan | BMAD CC workflow |
