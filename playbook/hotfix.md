# Playbook — Hotfix

## Kapan dipakai
Bug production, incident, atau issue yang perlu fix cepat.

## Pipeline Flow
```
SLOT H: H1 Triage → H2 Fix → H3 Deploy → H4 Post-mortem
```

## Severity Guide

| Severity | Response Time | Skip Staging? |
|---|---|---|
| Security-Critical | Immediate | Ya, cherry-pick setelahnya |
| Critical (production down) | < 1 jam | Ya |
| High (major feature broken) | < 1 hari | Tidak |
| Medium (workaround ada) | < 1 sprint | Tidak |

## Steps

### H1 — Triage
Invoke Incident Commander:
1. Assess severity (gunakan tabel di atas)
2. Scope: orbit-server saja? orbit-mobile saja? keduanya?
3. Reproduce lokal atau di staging
4. Root cause hypothesis

Quick triage commands:
```bash
# Production logs
ssh orbit "docker logs orbit-server-1 --tail=100"
# Sentry error rate (cek dashboard)
# DB health
ssh orbit "docker exec supabase-db psql -U postgres -c 'SELECT NOW()'"
```

### H2 — Fix
```
/gsd:quick [desc-singkat]
```
- Fix minimal — tidak ada scope creep
- Tambah test untuk reproduce case (WAJIB)
- Commit dengan referensi Linear issue

Branching:
```
orbit-server only: git checkout -b hotfix/[desc] (di orbit-server/)
orbit-mobile only: git checkout -b hotfix/[desc] (di orbit-mobile/)
cross-repo: fix server dulu, set blocking di Linear, lalu mobile
```

### H3 — Deploy
- PR ke main
- Critical/Security-Critical: skip staging, cherry-pick setelahnya
- GitHub Actions auto-deploy

### H4 — Post-mortem
Invoke Incident Commander (post-mortem format):
```
docs/bugs/YYYY-MM-DD-[issue-desc].md
```
- Timeline dengan timestamp WIB
- Root cause
- Prevention: ADR baru? Test case tambahan? Alert baru?
- Linear issue closed

## Tips
- JANGAN fix yang belum diketahui root cause-nya
- SELALU reproduce dulu sebelum fix
- SELALU tambah test untuk reproduce case
- Jangan force push ke main
