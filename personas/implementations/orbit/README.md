# ORBIT — Persona Implementations

Delta antara Forge defaults dan konfigurasi ORBIT.

---

## Persona Mapping

| Forge Template | ORBIT Name | File | Notes |
|---|---|---|---|
| PM | PM | [pm.md](pm.md) | PRD + user research untuk PLN SCADA, user personas Petugas RC Pro & Admin UP2D |
| Tech Lead | Tech Lead | [tech-lead.md](tech-lead.md) | Laravel 12 + Flutter stack, ADR compliance, N+1 awareness |
| Developer | Amelia | [amelia.md](amelia.md) | TDD Pest + flutter_test, GIT_OPTIONAL_LOCKS=0, Docker artisan |
| QA Engineer | Quinn | [quinn.md](quinn.md) | E2E testing, edge cases timezone WIB + offline + concurrent |
| Backend Architect | Arka | [arka.md](arka.md) | Schema + API + ADRs untuk Supabase/Laravel |
| Security Engineer | Security | [security.md](security.md) | OWASP + Supabase RLS + Cloudflare Tunnel + GPS spoofing |
| DevOps Automator | Raka | [raka.md](raka.md) | Docker + GitHub Actions + Prometheus/Grafana |
| Mobile App Builder | Mobile Builder | [mobile-builder.md](mobile-builder.md) | Flutter 3.41.2 + Riverpod AsyncNotifier, Android-first, offline-first |
| Incident Commander | Incident Commander | [incident-commander.md](incident-commander.md) | SCADA-Critical severity, ssh orbit via Tailscale, WIB timeline |
| Reality Checker | Reality Checker | [reality-checker.md](reality-checker.md) | ORBIT AUTO-FAIL triggers (setTimezone, orbit-pgsql-1, RLS) |
| Evidence Collector | Evidence Collector | [evidence-collector.md](evidence-collector.md) | Pest output format, timezone SQL validation, flutter test evidence |
| AI Resource Analyst | AI Resource Analyst | [ai-resource-analyst.md](ai-resource-analyst.md) | Dual account Max+Pro, pegagan-metrics.md, per-phase cost projection |

---

## Stack-Specific Configs

```yaml
project:
  name: "orbit"
  type: "fullstack"
  stack:
    backend: "laravel"    # Laravel 12 + Filament v3
    frontend: "flutter"   # Flutter 3.41.2 + Riverpod
    database: "postgres"  # Supabase PostgreSQL

pegagan:
  name: "Pegagan"
  # memory di ~/.claude/projects/-Users-agungperkasa-Sandbox-orbit/memory/
```

---

## ORBIT-Specific Workflows

### BC Structure
- BC-001: RTU Trouble Ticket (orbit-server)
- BC-002: Asset Management (orbit-server)
- BC-003: Outage Management System — Kafka topic output_portal_scada (orbit-server)
- BC-005: Inspeksi RTU (orbit-server + orbit-mobile)

### Repo Structure
- Root `orbit/` — orchestration only, tidak ada kode
- `orbit-server/` — Laravel backend + Filament admin
- `orbit-mobile/` — Flutter mobile app

### ADR yang Berlaku
- ADR-001: Dev Model — Local Docker + SSH Tunnel
- ADR-003: Timezone — WIB, No Double-Convert
- ADR-004: DB Active Container — `supabase-db`
- ADR-008: Forge — Engineering Workflow Standard

### Cross-repo Concerns
- API contract antara orbit-server (Laravel API) dan orbit-mobile (Flutter)
- Deploy order: orbit-server dulu, baru orbit-mobile
- Blocking: mobile phases di-block oleh server phases yang relevan

---

## References

- System design: `orbit/docs/plans/2026-03-07-orbit-system-design.md`
- Infrastructure: `orbit/docs/infrastructure.md`
- BC registry: `orbit/docs/bc-registry.md`
- ROADMAP: `orbit/.planning/ROADMAP.md`
