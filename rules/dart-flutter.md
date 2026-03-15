# Rules: Dart + Flutter 3.41.2

**Scope:** orbit-mobile, semua project Flutter
**Stack:** Flutter 3.41.2, Riverpod, Supabase Flutter SDK

## Git

- WAJIB: `GIT_OPTIONAL_LOCKS=0` saat push/pull di Flutter repo
- Jangan commit: `build/`, `.dart_tool/`, `*.g.dart` (generated)

## State Management (Riverpod)

- Gunakan `@riverpod` annotation (code generation)
- Provider per feature, bukan satu global provider
- AsyncNotifier untuk async state
- Tidak gunakan `StateProvider` untuk complex state

## Supabase

- Gunakan `supabase_flutter` SDK, bukan raw HTTP
- Auth: `supabase.auth.signInWithPassword()`
- Realtime: subscribe di `initState`, dispose di `dispose`
- Row Level Security (RLS) selalu enable di semua tabel

## Offline-First

- Semua fitur inspeksi harus bisa jalan tanpa internet
- Sync saat koneksi tersedia
- Local storage: `drift` atau `sqflite` untuk structured data
- Queue pending actions saat offline

## UI

- Android-first — test di Android dulu sebelum iOS
- Minimum SDK: Android API 24 (Android 7)
- Widget test untuk semua custom widgets
- Integration test untuk critical user journeys

## Performance

- `const` constructor untuk widget yang tidak berubah
- `ListView.builder` untuk list panjang, bukan `ListView` biasa
- Image caching dengan `cached_network_image`
- Tidak gunakan `setState` di StatefulWidget untuk complex state — gunakan Riverpod
