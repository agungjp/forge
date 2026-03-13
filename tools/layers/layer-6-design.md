# Layer 6 — Design

**Tools:** ui-ux-pro-max · Figma MCP · design-research skill

---

## What It Does

Layer 6 menangani semua UI/UX work — dari design research hingga component inventory. ui-ux-pro-max menggenerate design system dan component specs. Figma MCP baca/tulis ke Figma. design-research skill spawn 10 browser agents paralel untuk research.

## When to Activate

| Kondisi | Tool |
|---|---|
| Phase baru dengan screen baru | ui-ux-pro-max |
| Mockup Figma sudah ada | Figma MCP (read mode) |
| Research design referensi | design-research skill |
| Generate ke Figma | ui-ux-pro-max → Figma MCP (write mode) |

## ORBIT UI Context

### Filament Admin (orbit-server)
- Filament v3 punya design system sendiri
- Fokus: functionality > aesthetics (admin tool)
- Dark mode support via Filament built-in

### Flutter Mobile (orbit-mobile)
- Target: Android (petugas RC Pro di lapangan)
- Kondisi penggunaan: outdoor, bright sunlight → contrast tinggi
- Aksi cepat: satu tangan, tombol besar
- Offline indicator: selalu tampilkan status koneksi

## Trigger Points (dari pipeline)

- **[5] UI/UX Design:** Hanya untuk phase yang involve UI baru
- Phase backend-only (migration, API): skip Layer 6
- Phase dengan screen baru: wajib design dulu sebelum implement

## Inputs

- PRD (screen requirements)
- Figma mockup existing (via Figma MCP)
- Design reference dari design-research

## Outputs

- Component inventory
- Design tokens
- Layout specs
- Figma update (optional)

## Handoff

```
Layer 6 → Layer 3: Component specs → Amelia / Mobile Builder implement
Layer 6 ← Layer 1: "Design [screen] ini" (Pegagan dispatch)
```

## Integration Notes

- Layer 6 hanya aktif untuk UI-heavy phases
- Mobile design: pertimbangkan offline state, loading state, error state
- Filament: lebih sering extend built-in component daripada custom dari scratch
