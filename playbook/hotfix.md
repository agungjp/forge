# Playbook — Hotfix

## Kapan dipakai
Bug production, incident, atau issue yang perlu fix cepat.

## Flow
SLOT H: H1 Triage → H2 Fix → H3 Deploy → H4 Post-mortem

## Steps
1. H1 Triage: severity? scope? reproduce lokal?
2. H2 Fix: /gsd:quick [desc] — fix minimal, jangan scope creep
3. Test: harus ada test untuk reproduce case
4. H3 Deploy: PR ke main, kalau Critical skip staging
5. H4 Post-mortem: catat di docs/bugs/, update runbook

## Severity Guide
- Security-Critical: immediate, bypass normal escalation
- Critical: production down → fix dalam 1 jam
- High: major feature broken → fix dalam 1 hari
- Medium: workaround available → fix dalam 1 sprint
