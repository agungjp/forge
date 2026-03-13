# ORBIT — Persona Implementations

Delta antara Forge defaults dan konfigurasi ORBIT.

---

## Persona Mapping

| Forge Template | ORBIT Name | Notes |
|---|---|---|
| PM | (belum dibuat, default John) | PRD + user research untuk PLN SCADA |
| Tech Lead | (belum dibuat, default Barry) | Laravel + Flutter stack |
| Developer | (belum dibuat, default Amelia) | Implementasi per phase |
| QA Engineer | (belum dibuat, default Quinn) | E2E testing |
| Backend Architect | Arka | Schema + API + ADRs untuk Supabase/Laravel |
| Security Engineer | (belum dibuat, default) | OWASP + Cloudflare rules |
| DevOps Automator | Raka | Docker + GitHub Actions + Prometheus/Grafana |
| Mobile App Builder | (belum dibuat, default) | Flutter 3.41.2 + Riverpod |
| Incident Commander | (belum dibuat, default) | |
| Reality Checker | (belum dibuat, default) | |
| Evidence Collector | (belum dibuat, default) | |
| AI Resource Analyst | (belum dibuat, default) | |

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
- BC-003: Kafka SCADA Data (orbit-server)
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
