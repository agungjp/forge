# Layer 4 — Safeguards

**Tools:** Superpowers skills (TDD · systematic-debugging · verification · code-review · verification-before-completion)

---

## What It Does

Layer 4 adalah safety net. Superpowers skills memastikan kode ditulis dengan disiplin (TDD), bug diinvestigasi secara sistematis (tidak guessing), dan tidak ada klaim "done" tanpa verifikasi nyata.

## Skill Map

| Skill | Trigger |
|---|---|
| `superpowers:test-driven-development` | Sebelum implementasi apapun |
| `superpowers:systematic-debugging` | Saat ada bug atau test failure |
| `superpowers:verification-before-completion` | Sebelum klaim phase selesai |
| `superpowers:requesting-code-review` | Sebelum PR merge |
| `superpowers:receiving-code-review` | Saat menerima feedback review |
| `superpowers:using-git-worktrees` | Sebelum mulai feature baru |
| `superpowers:brainstorming` | Sebelum mulai fitur / komponen baru |
| `superpowers:writing-plans` | Sebelum implementasi kompleks |
| `superpowers:executing-plans` | Saat menjalankan plan yang ada |

## When to Activate

- **SELALU** sebelum implementasi: TDD skill
- **SELALU** saat ada bug: systematic-debugging (jangan guess)
- **SELALU** sebelum klaim selesai: verification-before-completion
- **WAJIB** sebelum merge: requesting-code-review

## Inputs

- PLAN.md + failing tests (TDD)
- Bug report + reproduction steps (debugging)
- Implementation + evidence (verification)
- PR diff (code review)

## Outputs

- Green tests + implementation
- Root cause analysis + fix
- Verification report
- Review comments

## Handoff

```
Layer 4 → Layer 3: "Test dulu, baru implement"
Layer 4 → Layer 1: "Verifikasi gagal → NEEDS WORK"
Layer 4 ← Layer 3: Implementation results untuk di-verify
```

## Integration Notes

- Superpowers skills dipanggil via `Skill` tool
- systematic-debugging: jangan retry tanpa diagnosa dulu
- verification-before-completion: jalankan command nyata, bukan claim
- Superpowers adalah rigid skills — follow exactly, tidak ada shortcut
