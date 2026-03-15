# Standard: Agent Harness Architecture

**Adapted from:** vendor/everything-claude-code/ architecture
**Reference:** affaan-m/everything-claude-code (77K stars)

## Konsep

Agent harness adalah infrastruktur yang memungkinkan agents bekerja secara konsisten
dan saling melengkapi. Terdiri dari 5 komponen:

```
agents/          ← siapa yang bekerja (identity + tools)
skills/          ← bagaimana cara kerja (workflows + patterns)
rules/           ← standar yang harus dipatuhi (per language)
hooks/           ← automasi yang berjalan otomatis (events)
AGENTS.md        ← index semua agents yang tersedia
```

## agents/ (.claude/agents/)

Format file: `.claude/agents/<name>.md`

Frontmatter wajib:
```yaml
---
name: AgentName
description: One-liner — kapan agent ini dipanggil (dipakai oleh Claude untuk auto-select)
tools:
  - Read
  - Write
  - Edit
  - Bash
  - Grep
  - Glob
model: sonnet  # opsional, override model default
---
```

Sections dalam body (urutan penting):
1. **Identity** — siapa, domain expertise, personality
2. **Kapan Dipakai** — trigger conditions yang jelas
3. **Core Mission** — apa yang dilakukan, output yang dihasilkan
4. **Critical Rules** — constraints yang tidak boleh dilanggar (ADRs, safety)
5. **Workflow** — step-by-step cara kerja

## skills/ (.claude/commands/)

Format file: `.claude/commands/<name>.md` atau `.claude/commands/<namespace>/<name>.md`

Dipanggil via: `/<name>` atau `/<namespace>:<name>`

Frontmatter opsional:
```yaml
---
name: skill-name
description: Kapan skill ini dipakai (1 kalimat)
---
```

## rules/

Format file: `rules/<scope>.md`

Di-reference di CLAUDE.md per repo:
```markdown
## Coding Standards
Lihat `../../forge/rules/common.md` dan `../../forge/rules/php-laravel.md`
```

Atau symlink ke forge/rules/ di repo masing-masing.

## hooks/

Format: `~/.claude/hooks/<name>.sh` atau `<name>.js`

Registered di `~/.claude/settings.json`:
```json
{
  "hooks": {
    "SessionStart": [{ "hooks": [{"type": "command", "command": "path/to/hook.sh"}] }],
    "PreToolUse": [{ "matcher": "Bash", "hooks": [{"type": "command", "command": "..."}] }],
    "PostToolUse": [...],
    "Stop": [...]
  }
}
```

## AGENTS.md

File index di root repo, berisi daftar agents aktif + kapan masing-masing dipakai.

Format:
```markdown
# Agents

## [AgentName]
**File:** `.claude/agents/agentname.md`
**Dipakai untuk:** [deskripsi singkat trigger]
**Tools:** Read, Write, Edit, Bash
```

## Referensi

- `vendor/everything-claude-code/AGENTS.md` — contoh AGENTS.md
- `vendor/everything-claude-code/agents/` — contoh agent format
- `vendor/agency-agents/engineering/` — contoh agency-agents style
