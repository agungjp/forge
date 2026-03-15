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
| agency-agents | https://github.com/msitarzewski/agency-agents | 2026-03-16 | 62541548 | personas/ |
| bmad-method | https://github.com/bmad-code-org/BMAD-METHOD | 2026-03-16 | d1163f85 | workflows/ |
| everything-claude-code | https://github.com/affaan-m/everything-claude-code | 2026-03-16 | c53bba9e | rules/, standard/ |
| superpowers | https://github.com/obra/superpowers | 2026-03-16 | 363923f7 | skills/ |
| gsd | https://github.com/gsd-build/get-shit-done | 2026-03-16 | 33dcb775 | (tools only) |
| gstack | https://github.com/garrytan/gstack | 2026-03-16 | bb46ca6b | skills/ |

## MCP Tools (tidak di-vendor, diinstall via MCP)
| Tool | Source | Why |
|------|--------|-----|
| context7 | upstash/context7 | Up-to-date library docs untuk LLMs |
| context-mode | mksglu/context-mode | Session continuity + context reduction |

## Notes
- Skills yang di-extract dari gstack: plan-ceo-review, plan-eng-review, review-pr, retro
- ship, browse, qa tidak di-extract (butuh browser/Playwright, di luar scope forge saat ini)
