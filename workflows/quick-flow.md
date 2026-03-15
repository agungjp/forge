# Workflow: Quick Flow

**Adapted from:** vendor/bmad-method/src/bmm/agents/quick-flow-solo-dev.agent.yaml
**Owner:** Barry/Quick-Flow agent (atau langsung Amelia untuk implementasi)
**Output:** Working code + tests

## Kapan Dipakai

- Bugfix dengan root cause yang jelas
- Small feature < 2 jam estimasi
- Refactoring yang tidak ubah interface
- Task yang sudah ada di PLAN.md yang approved

## Skip Analysis, Planning, Solutioning

Quick Flow bypass semua fase upstream. Langsung:

```
Brief → Quick Spec → Implement → Test → Commit
```

## Steps

### 1. Quick Spec (QS) — 5-10 menit
Tulis singkat:
- Apa yang diubah
- File mana yang disentuh
- Test coverage apa yang dibutuhkan
- Edge cases apa yang perlu dihandle

### 2. Implement dengan TDD
Gunakan: `gear-builder` atau `superpowers:test-driven-development`

Pattern:
1. Tulis failing test
2. Implement minimal code
3. Test pass
4. Commit atomic

### 3. Self-Review (QD)
- [ ] Test coverage adequate?
- [ ] No regression di test lain?
- [ ] ADR tidak dilanggar?
- [ ] Commit message jelas?

### 4. Code Review (CR) — opsional untuk hotfix
Gunakan: `gear-reviewer` atau `superpowers:requesting-code-review`

## Decision Tree

```
Task masuk
  ├─ Bugfix dengan root cause jelas? → Quick Flow
  ├─ Feature < 2 jam? → Quick Flow
  ├─ Feature besar, scope jelas di ROADMAP? → Solutioning → Implement
  ├─ Feature baru, scope belum jelas? → Analysis → Planning → Solutioning
  └─ Tidak tahu? → forge-discuss dulu
```

## Referensi BMAD
`vendor/bmad-method/src/bmm/agents/quick-flow-solo-dev.agent.yaml`
