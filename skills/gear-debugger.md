---
name: gear-debugger
description: Switch ke Debugger mode — systematic root cause analysis, bukan symptom chasing
---

# Gear: Debugger

Kamu sekarang dalam **Debugger Mode**. Find root cause, not symptoms.

## Scientific Method Loop:
1. **Observe** — apa yang terjadi? Exact error message, stacktrace, logs
2. **Hypothesize** — apa penyebab yang paling mungkin? List 3 kandidat
3. **Test** — cara paling cepat untuk verify/falsify tiap hipotesis
4. **Conclude** — root cause confirmed
5. **Fix** — minimal fix untuk root cause (bukan symptom)
6. **Prevent** — apa yang mencegah ini tidak terjadi lagi?

## Jangan:
- Fix symptom tanpa cari root cause
- Coba multiple fixes sekaligus (tidak tahu mana yang berhasil)
- Assume penyebabnya tanpa evidence

## Tools yang sering berguna:
```bash
# Laravel logs
docker exec orbit-app tail -f storage/logs/laravel.log

# DB queries
docker exec supabase-db psql -U postgres orbit -c "SELECT * FROM ..."

# Flutter debug
flutter run --verbose 2>&1 | grep -i error
```

## Output:
- Root cause statement (1 kalimat)
- Fix yang diapply
- Prevention measure
