# Tool Sources

External tools/frameworks yang diintegrasikan ke Forge workflow.
Semua di-clone manual — tidak ikut git commit (lihat .gitignore).

## Update semua sources

```bash
git -C BMAD-METHOD pull
git -C everything-claude-code pull
cd ../personas/sources && git -C agency-agents pull
```

---

## BMAD-METHOD (`bmad-code-org/BMAD-METHOD`)

**Lokasi:** `BMAD-METHOD/`
**Layer:** L3 Execution
**Key paths:**
- `src/bmm/agents/` — 9 agent YAML: pm, architect, dev, qa, sm, ux, analyst, tech-writer, quick-flow-solo-dev
- `src/bmm/workflows/` — 1-analysis, 2-plan, 3-solutioning, 4-implementation, bmad-quick-flow

**Status:** Source tersedia. Reference di `forge/playbook/bmad-reference.md`.

---

## everything-claude-code (`affaan-m/everything-claude-code`)

**Lokasi:** `everything-claude-code/`
**Layer:** L4 Safeguards
**Key paths:**
- `rules/common/` — 9 rules: security, git-workflow, development-workflow, coding-style, testing, patterns, performance, hooks, agents
- `commands/` — 48 commands: learn, skill-create, tdd, save-session, resume-session, orchestrate, dll
- `mcp-configs/mcp-servers.json` — referensi MCP servers

**Commands yang paling relevan untuk ORBIT solo dev:**
| Command | Fungsi |
|---|---|
| `learn.md` | Extract patterns dari sesi ke memori |
| `skill-create.md` | Generate skill dari git history |
| `tdd.md` | TDD workflow lengkap |
| `save-session.md` / `resume-session.md` | Session persistence |
| `orchestrate.md` | Multi-agent orchestration |
| `quality-gate.md` | Pre-commit quality check |
| `verify.md` | Post-implementation verification |

**Status:** Source tersedia. Belum diintegrasikan ke forge commands.
**Next:** Review `learn.md` dan `skill-create.md` untuk potensi integrasi ke orbit workflow.
