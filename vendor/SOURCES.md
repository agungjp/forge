# Vendor Sources

Raw upstream snapshots. Jangan edit langsung — edit di forge-native layer.

## Update Strategy

Setiap vendor punya `last_updated` dan `pinned_commit`. Update manual via:
```bash
./forge-update.sh <vendor-name>
```

## Sources

| Vendor | Origin | Last Updated | Pinned Commit | Forge Native |
|--------|--------|--------------|---------------|--------------|
| agency-agents | msitarzewski/agency-agents | 2026-03-16 | main | personas/ |
| bmad-method | bmad-code-org/BMAD-METHOD | 2026-03-16 | main | workflows/ |
| everything-claude-code | affaan-m/everything-claude-code | 2026-03-16 | main | rules/, standard/ |
| superpowers | obra/superpowers | 2026-03-16 | main | skills/ |
| gsd | gsd-build/get-shit-done | 2026-03-16 | main | (tools only) |
