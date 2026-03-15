# Vendor Sources

Raw upstream snapshots. Jangan edit langsung — edit di forge-native layer.

## Update Strategy

Setiap vendor punya `last_updated` dan `pinned_commit`. Update manual via:
```bash
./forge-update.sh <vendor-name>
```

> **Note:** `forge-update.sh` belum dibuat — akan dibuat di Task 5.

## Sources

| Vendor | Origin | Last Updated | Pinned Commit | Forge Native |
|--------|--------|--------------|---------------|--------------|
| agency-agents | https://github.com/msitarzewski/agency-agents | 2026-03-16 | (unpinned) | personas/ |
| bmad-method | https://github.com/bmad-code-org/BMAD-METHOD | 2026-03-16 | (unpinned) | workflows/ |
| everything-claude-code | https://github.com/affaan-m/everything-claude-code | 2026-03-16 | (unpinned) | rules/, standard/ |
| superpowers | https://github.com/obra/superpowers | 2026-03-16 | 363923f7 | skills/ |
| gsd | https://github.com/gsd-build/get-shit-done | 2026-03-16 | 33dcb775 | (tools only) |
