# M0 Execution Plan — Kirana Corp Foundation

**Created:** 2026-03-17
**Status:** Active — Tahap 3
**Source:** `orbit/docs/brainstorming/2026-03-17-tahap2-decision-matrix.md`

Urutan eksekusi berdasarkan dependency dan impact. Setiap item bisa dikerjakan independen kecuali ada dependency eksplisit.

---

## Wave 1 — Quick Wins (< 30 menit total, zero dependency)

### W1-1: Settings JSON update
**File:** `~/.claude/settings.json`
**Action:** Tambah 2 settings:
```json
{
  "language": "indonesian",
  "respectGitignore": true
}
```
**Effort:** 2 menit

### W1-2: Agent Paperclip desktop monitor
**Source:** https://github.com/fredruss/agent-paperclip
**Action:** Install via README instructions
**Fungsi:** Notif ketika Claude selesai/butuh input, token usage live
**Effort:** 10 menit

### W1-3: Slack MCP
**Action:** `/plugin install slack` di Claude Code
**Atau:** Tambah ke `~/.claude/settings.json` MCP config
**Effort:** 10 menit

---

## Wave 2 — Identity & Rules Layer (dependency: none)

### W2-1: `.claude/rules/` directory di orbit
**Path:** `orbit/.claude/rules/`
**Files:**
- `laravel.md` — `paths: ["orbit-server/**/*.php"]` — content dari `forge/rules/php-laravel.md`
- `flutter.md` — `paths: ["orbit-mobile/**/*.dart"]` — content dari `forge/rules/dart-flutter.md`
- `deployment.md` — `paths: ["**/docker-compose*.yml", "**/*.Dockerfile"]`

### W2-2: Subagent `memory:` field
**Files to update:**
- `~/.claude/agents/pegagan.md` → tambah `memory: user`
- `orbit/.claude/agents/arka.md` → tambah `memory: project`
- `orbit/.claude/agents/tech-lead.md` → tambah `memory: project`
- `~/.claude/agents/code-reviewer.md` → tambah `memory: user`

### W2-3: `isolation: worktree` di executor agents
**Files to update:**
- `orbit/.claude/agents/amelia.md` → tambah `isolation: worktree`
- `orbit/.claude/agents/raka.md` → tambah `isolation: worktree`

---

## Wave 2.5 — Founder Control Layer (dependency: W1 selesai)

### W2.5-1: Dokumen `forge/standard/founder-gates.md`
**Content — definisikan 3 level gate:**

```
ALWAYS STOP (tidak bisa di-skip, sistem halt):
  - Production deploy
  - ADR baru yang ubah DB schema
  - PR ke main branch

CONFIGURABLE (default stop, Agung bisa skip eksplisit):
  - Architecture review sebelum Amelia mulai implementasi
  - Staging deploy
  - Breaking change di API contract

NEVER STOP (fully auto, tidak perlu notify):
  - Bugfix minor
  - Test writing
  - Documentation update
  - Code review comment
  - Linear issue status update
```

### W2.5-2: `#pegagan-control` Slack channel
**Action:**
- Buat channel `#pegagan-control` di Slack workspace
- Pegagan monitor channel ini di setiap session start via Slack MCP
- Commands yang dikenali:
  - `stop` — halt semua agents yang sedang jalan
  - `pause` — pause dan tunggu instruksi
  - `resume` — lanjut dari titik terakhir
  - `bypass [step]` — skip gate tertentu
  - `explain` — Pegagan jelaskan apa yang sedang dikerjakan

### W2.5-3: ralph-loop safety config
**Rules sebelum ralph-loop diaktifkan:**
- Max 10 iterasi per session sebelum stop dan notify Slack
- Jika tidak ada commit baru setelah 3 iterasi → escalate ke Agung
- Budget ceiling di Paperclip: Rp X per overnight session
- "Dead man's switch": kalau Agung tidak respond Slack dalam 8 jam → system pause otomatis

### W2.5-4: Pegagan session-start ritual update
**Tambah ke `~/.claude/agents/pegagan.md`:**
- Cek `#pegagan-control` channel setiap session start
- Cek apakah ada HARD GATE yang pending approval dari Agung
- Jangan mulai task baru kalau ada gate yang belum di-resolve

---

## Wave 3 — Agent Teams & Hooks (dependency: W2 selesai)

### W3-1: Agent Teams enable
**Action:** Tambah ke shell environment (`~/.config/fish/config.fish`):
```fish
set -x CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS 1
```
**Test:** Spawn Arka + Amelia concurrent, verify tidak conflict

### W3-2: TeammateIdle + TaskCompleted hooks
**File:** `~/.claude/settings.json` hooks section
```json
{
  "TeammateIdle": [{"type": "command", "command": "~/.claude/hooks/teammate-idle.sh"}],
  "TaskCompleted": [{"type": "command", "command": "~/.claude/hooks/task-completed.sh"}]
}
```
**Script:** Log ke `~/.claude/MEMORY/STATE/agent-activity.md`

### W3-3: PostCompact hook
**Action:** Tambah hook yang fires setelah auto-compact
**Script:** Auto-update `STATE.md` quick summary + append ke session log

---

## Wave 4 — BMAD Setup (dependency: W2 selesai)

### W4-1: Install BMAD di orbit
```bash
cd ~/Sandbox/orbit && npx bmad-method install --modules bmm --tools claude-code
```

### W4-2: Buat `orbit/_bmad/project-context.md`
**Content yang harus dicakup:**
- Tech stack: Laravel 12, Flutter 3.41.2, Supabase PostgreSQL, Filament v3
- ADRs: ADR-001, ADR-003 (WIB timezone), ADR-004 (supabase-db), ADR-008
- BC registry: BC-001 (stable), BC-002 (in-dev), BC-003 (active)
- Non-negotiables: WIB timezone, supabase-db, staging-first, backup-before-migrate
- Agent mapping: Arka=Architect, Amelia=Dev, Quinn=QA, Pegagan=SM, Raka=DevOps
- Anti-patterns: jangan setTimezone(), jangan orbit-pgsql-1, jangan direct deploy ke production

### W4-3: BMAD Quick Flow template
**Path:** `orbit/_bmad/quick-spec/template.md`
**Content:** Quick Spec (QS) 15 menit template untuk feature ≤1 hari

---

## Wave 5 — Specialist Agents (dependency: W4 selesai)

### W5-1: laravel-specialist agent
**Path:** `orbit/.claude/agents/laravel-specialist.md`
**Format:** Agency Agents format + PLN SCADA context
**Knowledge:** Laravel 12, Filament v3, Eloquent ORM, Artisan, PHP 8.3, WIB timezone non-negotiable

### W5-2: flutter-expert agent
**Path:** `orbit/.claude/agents/flutter-expert.md`
**Knowledge:** Flutter 3.41.2, Riverpod 2.x, Supabase Flutter SDK, offline-capable, Android-first, GIT_OPTIONAL_LOCKS=0

### W5-3: postgres-pro agent
**Path:** `orbit/.claude/agents/postgres-pro.md`
**Knowledge:** PostgreSQL 15, Supabase RLS, pgvector, migrations, WIB timezone, supabase-db container

---

## Wave 6 — CI/CD & Integration (dependency: W2 selesai)

### W6-1: claude-code-action
**Action:** `/install-github-app` di Claude Code terminal
**Files buat:**
- `orbit-server/.github/workflows/claude-review.yml`
- `orbit-mobile/.github/workflows/claude-review.yml`
**GitHub Secret:** `CLAUDE_API_KEY` di agungjp/orbit-server + orbit-mobile

### W6-2: claude-code-security-review
**Files buat:**
- `orbit-server/.github/workflows/security.yml`
**Custom instructions:** Laravel/Filament specific — SQL injection via Eloquent, RLS bypass, hardcoded secrets

### W6-3: GitHub branch protection orbit-server
**Settings:**
- Require PR review: Claude (required) + Agung (required)
- Require status checks: security scan pass
- Auto-merge on Agung approval

### W6-4: Cyrus setup
**Repo:** https://github.com/ceedaragents/cyrus
**Action:**
```bash
npm install -g cyrus-ai
cyrus auth <token>
```
**Config:** Connect ke Linear workspace + orbit-server GitHub repo
**Gotcha:** Unset `CLAUDECODE` + `CLAUDE_CODE_ENTRYPOINT` via wrapper script (env var leak issue)
**Test:** Buat 1 Linear issue → assign ke Cyrus → verify worktree + PR terbuat

---

## Wave 7 — NEXUS Protocol (dependency: W5 selesai)

### W7-1: Update pegagan.md dengan NEXUS handoff template
**File:** `~/.claude/agents/pegagan.md`
**Tambah section:** Setiap delegate ke agent wajib gunakan format:
```markdown
## Context
[project state + relevant files + dependencies]

## Deliverable
[what needed + acceptance criteria + constraints]

## Quality Expectations
[must pass + evidence required + handoff to]
```

### W7-2: Buat `forge/playbook/nexus-handoff.md`
**Content:** Reference template NEXUS handoff + contoh per agent (Arka, Amelia, Quinn)

---

## Wave 8 — Skills Migration (dependency: W2 selesai)

### W8-1: deploy.md → Skills format
**From:** `orbit/.claude/commands/deploy.md`
**To:** `orbit/.claude/skills/deploy/SKILL.md`
**Add:** `disable-model-invocation: true` frontmatter

### W8-2: sync-state.md → Skills format + fix project-aware
**From:** `~/.claude/commands/sync-state.md` (hardcoded ke orbit)
**To:** `~/.claude/skills/sync-state/SKILL.md`
**Fix:** Project-aware — detect current repo, push ke repo sendiri

### W8-3: catchup → Skills format
**From:** `orbit/.claude/commands/catchup.md` (sudah ada sebagai project skill)
**Enhancement:** Tambah `!git log --oneline -10` + `!cat STATE.md` dynamic injection

---

## Wave 9 — Forge SOP (dependency: W4 + W5 selesai)

### W9-1: forge/standard/methodology.md
**Content:**
- Engineering lifecycle: Discovery → Architecture → Planning → Build → QA → Deploy → Operate
- Scale routing: Bugfix → Quick Flow → Full BMAD
- Quality gates per stage
- AI-agnostic format (bisa dibaca tool apapun)

### W9-2: forge/standard/roles.md
**Content:**
- Agung (Founder): authority, decision rights, bypass rules
- Pegagan (CEO Virtual): orchestration, routing, state
- Semua agents: responsibilities, when to use, escalation matrix

### W9-3: forge.config.yaml instantiation
**File:** `forge/implementations/orbit/forge.config.yaml`
**Update dari template ke nilai aktual:**
- project.name: orbit
- stack.backend: Laravel 12 + Filament v3
- stack.mobile: Flutter 3.41.2 + Riverpod
- stack.database: Supabase PostgreSQL

---

## Wave 10 — Monitoring & Observability (dependency: W6 selesai)

### W10-1: claude-code-monitoring-guide setup
**Action:** Setup Prometheus + OTel dari docker-compose.yml monitoring guide
**Integration:** Linear weekly report via `report-generation-prompt.md`
**Output:** `forge/standard/claude-code-roi-metrics.md`

### W10-2: Paperclip platform setup
**Action:** `npx paperclipai onboard --yes`
**Config:** Register orbit agents sebagai workers
**Dashboard:** Setup budget per agent per bulan

---

## Wave 11 — P1 Remaining (dependency: Wave 1-9 selesai)

### W11-1: claude-md-management install
**Action:** Install dari claude-plugins-official
**Add:** `/revise-claude-md` ke workflow akhir sesi di Pegagan

### W11-2: ConfigChange hook
**Action:** Hook yang log + optionally block perubahan settings.json
**Script:** Append ke audit log di `~/.claude/MEMORY/STATE/config-changes.md`

### W11-3: Sandbox + permission rules
**File:** `orbit/.claude/settings.json`
**Add:**
```json
{
  "permissions": {
    "deny": ["Read(./.env)", "Read(./secrets/**)"]
  }
}
```

### W11-4: Forge personas blueprint extraction
**Action:** Extract orbit persona implementations sebagai template reusable
**Output:** `forge/personas/implementations/template/`

---

## Urutan Eksekusi yang Disarankan

```
Wave 1 (quick wins, 30 menit)
  → Wave 2 (identity/rules, 1 jam) [paralel dengan Wave 2.5]
  → Wave 2.5 (founder control layer, 30 menit)
  → Wave 3 (agent teams + hooks, 1 jam) [paralel dengan Wave 4]
  → Wave 4 (BMAD, 2 jam)
  → Wave 5 (specialist agents, 1 jam)
  → Wave 6 (CI/CD + Cyrus, 2 jam)
  → Wave 7 (NEXUS, 1 jam)
  → Wave 8 (skills migration, 1 jam)
  → Wave 9 (forge SOP, 2 jam)
  → Wave 10 (monitoring, 1 jam)
  → Wave 11 (P1 remaining, 1 jam)

Total estimasi: ~14 jam kerja
Bisa paralel Wave 3+4 dan Wave 5+6 → efektif ~10 jam
```

---

## Test Full Loop (setelah semua wave selesai)

```
1. Buat Linear issue: "Tambah endpoint GET /api/rtu/{id}/status"
2. Assign ke Cyrus
3. Verify: Cyrus baca issue, buat worktree, spawn Claude Code
4. Verify: Amelia implement di worktree terisolasi
5. Verify: Quinn test di worktree terpisah (Agent Teams)
6. Verify: PR terbuat di orbit-server
7. Verify: claude-code-action review PR otomatis
8. Verify: security scan pass
9. Verify: Agung approve → auto-merge
10. Verify: Linear issue auto-close
11. Verify: Slack notif di #kirana-updates
```

Kalau semua 11 steps verified → **M0 SELESAI**, siap Milestone 1.
