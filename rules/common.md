# Rules: Common (semua project)

**Adapted from:** vendor/everything-claude-code/rules/common/
**Scope:** Berlaku di semua repo, semua language

## Git

- Commit message: `feat:` | `fix:` | `refactor:` | `docs:` | `chore:` | `test:`
- Atomic commits — satu commit per task selesai
- Tidak commit: `.env`, secrets, binary files > 1MB
- Branch naming: `feature/S2-desc` | `hotfix/fix-login` | `chore/update-deps`

## Code Quality

- YAGNI — tidak build yang belum dibutuhkan sekarang
- DRY — extract kalau pattern muncul 3x, bukan 2x
- Simple over clever — kode yang mudah dibaca > kode yang pintar
- No TODO tanpa ticket — kalau ada TODO, buat Linear issue

## Testing

- Test coverage wajib untuk business logic
- Test name: describe behavior, bukan implementation
- Failing test dulu, baru implement (TDD)
- Jangan mock yang tidak perlu — integration test > unit test untuk I/O

## Security

- Tidak hardcode credentials
- Validate semua input dari user atau external API
- Tidak log sensitive data (password, token, PII)
- Production: staging dulu, backup DB, confirm sebelum destructive ops

## Documentation

- Komentar kode: jelaskan KENAPA, bukan APA
- Jangan komentar yang obvious
- Update CLAUDE.md kalau ada pattern baru yang penting
