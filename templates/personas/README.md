# Forge Personas — How to Instantiate

## Cara Instantiate Persona untuk Project Baru

1. Copy template dari `forge/personas/templates/[persona].md.tmpl`
2. Buat file baru di `forge/personas/implementations/[project]/[name].md`
3. Ganti semua `{{placeholder}}` dengan nilai project
4. Tambah project-specific context (stack, conventions, domain knowledge)
5. Copy ke project `.claude/agents/[name].md`

## Template Variables

| Variable | Description | Example |
|---|---|---|
| `{{persona_name}}` | Nama persona di project ini | Arka, Raka, Quinn |
| `{{project_name}}` | Nama project | ORBIT |
| `{{stack}}` | Tech stack | Laravel 12 + Flutter 3.41.2 |

## Persona Map (Default)

| Template | Default Name | Role |
|---|---|---|
| pm.md.tmpl | John | Product Manager |
| tech-lead.md.tmpl | Barry | Tech Lead (QS/QD/CR) |
| developer.md.tmpl | Amelia | Developer |
| qa.md.tmpl | Quinn | QA Engineer |
| backend-architect.md.tmpl | Winston | Backend Architect |
| security-engineer.md.tmpl | Security | Security Engineer |
| devops.md.tmpl | Raka | DevOps Automator |
| mobile-builder.md.tmpl | Mobile Builder | Mobile Developer |
| reality-checker.md.tmpl | Reality Checker | Gate / Skeptic |
| evidence-collector.md.tmpl | Evidence Collector | Evidence Aggregator |
| incident-commander.md.tmpl | Incident Commander | Hotfix Triage |
| ai-resource-analyst.md.tmpl | AI Analyst | Token Optimization |

## ORBIT Reference

Lihat `forge/personas/implementations/orbit/` untuk contoh implementasi lengkap.
