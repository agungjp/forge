# Rules: PHP + Laravel 12

**Scope:** orbit-server, semua project Laravel
**Stack:** PHP 8.3, Laravel 12, Filament v3, Pest

## Timezone

- WAJIB: simpan timestamp sebagai WIB di DB
- JANGAN: `setTimezone()`, `->timezone('Asia/Jakarta')`, double-convert
- ADR-003: DB simpan WIB, tidak ada konversi di application layer

## Database

- Container aktif: `supabase-db` — JANGAN `orbit-pgsql-1`
- Migration: selalu backup sebelum run di production
- JANGAN: `migrate:fresh`, `migrate:reset`, `db:wipe` tanpa explicit permission
- Index: tambah index untuk semua foreign keys dan kolom yang sering di-query

## Eloquent

- Gunakan eager loading untuk relasi (N+1 prevention)
- Scopes untuk query yang sering dipakai
- Form Request untuk validation — jangan validate di controller
- Resource/Collection untuk API response formatting

## Filament v3

- Semua admin UI via Filament Resource
- Custom pages extend `Filament\Pages\Page`
- Actions: gunakan `Action` class, bukan inline closure panjang
- Notifications: `Notification::make()->success()->send()`

## Testing (Pest)

```php
// Good
it('creates RTU ticket when status changes', function () {
    // arrange
    // act
    // assert
});
```

- Feature test untuk semua API endpoints
- Unit test untuk business logic yang complex
- Gunakan `RefreshDatabase` trait untuk test yang butuh DB

## Artisan Commands

- Custom command untuk scheduled tasks, bukan plain PHP scripts
- `handle()` method: satu responsibility
- Log progress untuk long-running commands
