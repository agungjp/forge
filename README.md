# Forge — Engineering OS

Engineering operating system untuk solo developer yang membangun produk serius.

## Konsep

Forge adalah workflow OS yang mengkolaborasikan tools terbaik untuk AI-assisted development:
- **Tool-agnostic** — workflow tidak berubah kalau tools diganti
- **Startup-grade** — mencakup seluruh siklus: Bisnis → Produk → Engineering → Ops
- **Orchestrated by Pegagan** — satu interface, semua workflows

## Reference Implementation

**ORBIT** (github.com/agungjp/orbit) adalah reference implementation pertama.

## Struktur

| Direktori | Isi |
|---|---|
| `pegagan/` | Chief of Staff agent — modes, routing, memory schema |
| `standard/` | 6-layer architecture, pipeline, slot registry, quality gates |
| `personas/` | Template personas (BMAD + agency-agents + custom) |
| `playbook/` | How-to per workflow |
| `hooks/` | Automation hooks (session-start, stop, precompact) |
| `templates/` | forge init skeleton |
| `implementations/` | Reference implementations (orbit) |

## Quick Start

```bash
# Clone ke project baru
cp -r ~/Sandbox/forge/.forge-template/ ./
# Edit forge.config.yaml sesuai project
```

## Tools yang Diintegrasikan

| Layer | Tool |
|---|---|
| L1 Orchestration | msitarzewski/agency-agents (NEXUS) |
| L2 Planning | gsd-build/get-shit-done + Linear MCP |
| L3 Execution | bmad-code-org/BMAD-METHOD |
| L4 Safeguards | obra/superpowers + affaan-m/everything-claude-code |
| L5 Context | mksglu/context-mode + context7 |
| L6 Design | ui-ux-pro-max + design-research |
| Infrastructure | rtk-ai/rtk + hooks |
