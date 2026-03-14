# Tool Sources

External tools/frameworks yang diintegrasikan ke Forge workflow.

## BMAD-METHOD (`bmad-code-org/BMAD-METHOD`)

**Lokasi:** `BMAD-METHOD/`
**Update:** `git -C BMAD-METHOD pull`
**Layer:** L3 Execution (lihat forge README)

Framework AI-driven agile development. Key components:

| Path | Fungsi |
|---|---|
| `src/bmm/agents/` | 9 agent YAML: pm, architect, dev, qa, sm, ux, analyst, tech-writer, quick-flow |
| `src/bmm/workflows/` | Structured workflows per skenario |
| `src/bmm/module.yaml` | Module config |

**Status integrasi:** Source tersedia, belum diintegrasikan ke forge workflow.
**Next:** Extract relevant workflows ke `forge/playbook/` sebagai referensi.
