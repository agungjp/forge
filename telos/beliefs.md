# Technical Beliefs

## Stack Choices
- **Laravel 12** untuk backend — team familiarity + ecosystem maturity
- **Flutter 3.41.2** untuk mobile — single codebase, offline-capable
- **Supabase/PostgreSQL** untuk DB — RLS built-in, realtime support
- **Filament v3** untuk admin — productive, Laravel-native

## Engineering Principles
- Scaffolding beats model selection — workflow architecture > prompt engineering
- Code over prompts — deterministic infrastructure > probabilistic solutions
- YAGNI ruthlessly — build what's needed now, not what might be needed
- TDD when complexity warrants — tests first untuk business logic

## Non-Negotiables
- WIB timezone, no double-convert (ADR-003)
- supabase-db bukan orbit-pgsql-1 (ADR-004)
- Staging dulu sebelum production — selalu
- Backup DB sebelum migration — wajib
- Konfirmasi sebelum destructive operations
