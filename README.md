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
| `vendor/` | Raw upstream snapshots — agency-agents, BMAD, ECC, superpowers, GSD |
| `workflows/` | SDLC workflows adapted dari BMAD — analysis, planning, solutioning, quick-flow |
| `rules/` | Coding standards per language — common, php-laravel, dart-flutter |

## Update Strategy

Vendor snapshots diupdate manual via script:
```bash
./forge-update.sh agency-agents      # update ke latest
./forge-update.sh bmad-method
./forge-update.sh everything-claude-code
./forge-update.sh superpowers
./forge-update.sh gsd
```

Forge-native layer (`personas/`, `workflows/`, `rules/`, `skills/`) **tidak** di-overwrite saat update vendor — ini adalah adaptasi opinionated Forge.

## Quick Start

```bash
# Clone ke project baru
cp -r ~/Sandbox/forge/.forge-template/ ./
# Edit forge.config.yaml sesuai project
```

## Tools yang Diintegrasikan

| Layer | Tool |
|---|---|
| L1 Orchestration | msitarzewski/agency-agents (NEXUS) — source: `vendor/agency-agents/` |
| L2 Planning | gsd-build/get-shit-done + Linear MCP |
| L3 Execution | bmad-code-org/BMAD-METHOD — source: `vendor/bmad-method/` |
| L4 Safeguards | obra/superpowers + affaan-m/everything-claude-code |
| L5 Context | mksglu/context-mode + context7 |
| L6 Design | ui-ux-pro-max + design-research |
| Infrastructure | rtk-ai/rtk + hooks |

---

## Forge v2 — Personal AI OS

Forge v2 adalah redesign sebagai **5-layer Personal AI OS** untuk solo dev.

### Architecture

```
┌─────────────────────────────────────────────────┐
│  L5: TELOS          mission · goals · beliefs   │
│  L4: PERSONAS       25 specialist agents        │
│  L3: GEARS          6 cognitive modes           │
│  L2: WORKFLOW       INTENT→DISCUSS→PLAN→        │
│                     EXECUTE→VERIFY→LEARN        │
│  L1: MEMORY         instincts · STATE · memory  │
├─────────────────────────────────────────────────┤
│  PARTY MODE (cross-layer): /forge:discuss       │
└─────────────────────────────────────────────────┘
```

### Layer 1: Memory & Learning
- `telos/` — TELOS context files (mission, goals, beliefs, stack, projects, learned)
- `instincts/` — behavioral rules (engineering, workflow, domain)
- Auto-loaded tiap session via SessionStart hook

### Layer 3: Cognitive Gears
Switch mode berpikir dengan `/gear:[mode]`:
- `/gear:founder` — rethink problem dari first principles
- `/gear:architect` — system design, ADR, contracts
- `/gear:builder` — TDD, atomic commits, no gold-plating
- `/gear:reviewer` — paranoid audit untuk production bugs
- `/gear:shipper` — release protocol, staging-first
- `/gear:debugger` — root cause analysis, scientific method

### Layer 4: Personas
25 specialist agents di `orbit/.claude/agents/` — agency-agents format dengan Identity, Deliverables, Success Metrics.

### Party Mode
`/forge:discuss` — spawn 3 perspektif paralel (Architect + Reality + Domain) sebelum keputusan besar. Output: decision matrix + recommendation.

### Installation
```bash
# Gear skills
for skill in ~/Sandbox/forge/skills/gear-*.md; do
  ln -sf "$skill" ~/.claude/commands/$(basename "$skill")
done

# Party Mode
ln -sf ~/Sandbox/forge/skills/forge-discuss.md ~/.claude/commands/forge-discuss.md
```
