# Forge — Quality Gates

Semua gate wajib dalam pipeline. Gate = checkpoint yang HARUS pass sebelum lanjut.

---

## Gate Summary

| Gate | Step | Kondisi PASS | Kondisi FAIL |
|---|---|---|---|
| PRD Gate | [2] | Requirements clear, AC terdefinisi | Requirements ambigu, AC tidak ada |
| Security Design Gate | [4b] | Security review pass | Auth/authz issues, injection risks |
| TDD Gate | [8] | Test cases ditulis SEBELUM implementasi | Skip test, test ditulis sesudah |
| Test Green Gate | [9] | Full test suite green setelah setiap task | Failing tests → STOP, jangan proceed |
| Evidence Gate | [10] | Bukti konkret ada: hasil test, screenshot, log | Klaim "done" tanpa bukti |
| Self-Audit Gate | [11] | Adversarial review selesai, temuan addressed | Zero issues found (auto-fail) |
| Docs Gate | [11c] | API docs updated, migration guide ada (jika breaking) | Perubahan tanpa docs update |
| QA Gate | [12] | Semua AC dari PRD terpenuhi, E2E pass | AC belum terpenuhi |
| Performance Gate | [12b] | Response time dalam threshold, no breaking point dalam normal load | Latency exceed threshold |
| Security Testing Gate | [12c] | Tidak ada finding critical/high | Critical/high finding ada |
| Reality Check Gate | [13] | Reality Checker output: READY | Output: NEEDS WORK (default) |
| Security Gate | [13b] | OWASP Top 10 pass, auth flows verified | Any security finding |
| Code Review Gate | [14] | PR approved | PR rejected |
| Staging Gate | [16] | Smoke test + E2E pass di staging | Staging issues → kembali ke [9] atau [12] |

---

## Detail Per Gate

### PRD Gate (setelah [2])

**PASS jika:**
- [ ] User story jelas: "Sebagai X, saya ingin Y, agar Z"
- [ ] Functional requirements terdefinisi
- [ ] Non-functional requirements ada (performance, security, availability)
- [ ] Acceptance criteria spesifik dan testable
- [ ] Edge cases didokumentasikan

**FAIL jika:**
- Acceptance criteria terlalu umum ("harus cepat", "harus aman")
- Requirements saling bertentangan
- Scope tidak jelas

---

### TDD Gate (sebelum [9])

**PASS jika:**
- [ ] Test cases written FIRST
- [ ] Semua test cases RED (belum ada implementasi)
- [ ] Test coverage plan: ≥80% per file
- [ ] Integration test cases ada untuk setiap external dependency
- [ ] Edge cases ter-cover dalam tests

**FAIL jika:**
- Test ditulis setelah implementasi
- Test langsung green tanpa implementasi (test salah)
- Zero test coverage

---

### Evidence Gate (setelah setiap task [10])

**Evidence wajib mencakup:**
- [ ] Test results (output lengkap, bukan cuplikan)
- [ ] Coverage report
- [ ] Screenshot atau response output untuk user-facing changes
- [ ] Log output untuk background processes
- [ ] Response times untuk API endpoints baru

**AUTO-FAIL (Reality Checker rule):**
- "Zero issues found" tanpa penjelasan
- "100% test coverage" tanpa laporan
- "Production ready" tanpa evidence
- "All tests pass" tanpa output

---

### Security Gate [13b] — Checklist

**WAJIB PASS sebelum [14]:**

```
Auth & AuthZ:
  [ ] Auth flows verified end-to-end (login, logout, refresh)
  [ ] Role-based access control (RBAC) benar
  [ ] Token expiry dan refresh flow benar

Data Security:
  [ ] Sensitive data tidak di-log
  [ ] PII handling sesuai kebijakan
  [ ] Database queries parameterized (no SQL injection)

OWASP Top 10 Re-verify:
  [ ] A01 Broken Access Control — cek setiap endpoint
  [ ] A02 Cryptographic Failures — cek encryption at rest + in transit
  [ ] A03 Injection — cek input validation
  [ ] A05 Security Misconfiguration — cek headers, CORS, error messages
  [ ] A07 Auth Failures — cek brute force protection, session management
  [ ] A09 Security Logging — cek audit trail

Infrastructure:
  [ ] Cloudflare rules reviewed (jika ada perubahan endpoint publik)
  [ ] Internal network isolation terjaga
  [ ] Secrets tidak di-commit ke git

Incident Response:
  [ ] Security incident escalation path terdokumentasi
```

---

### Reality Checker Rules

Reality Checker adalah gate skeptis. Default output: **NEEDS WORK**.

**Prinsip:**
1. "First implementations typically need 2-3 revision cycles" — ini normal, bukan masalah
2. Setiap klaim harus ada evidence-nya
3. "Looks good" bukan valid gate output

**AUTO-FAIL triggers:**
- "Zero issues found" tanpa penjelasan mendalam
- Perfect scores tanpa evidence
- "Production ready" sebagai klaim tanpa data
- Skip langkah dalam pipeline tanpa justifikasi
- Evidence tidak lengkap

**PASS criteria:**
- Evidence lengkap per task
- Issues yang ditemukan sudah addressed atau accepted-risk
- Known limitations terdokumentasi
- Performance baseline ada
- Security checklist complete
