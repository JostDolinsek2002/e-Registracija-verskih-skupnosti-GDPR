#!/usr/bin/env bash
set -e

OUT_DIR="docs/logs"
OUT_FILE="${OUT_DIR}/retention_cleanup_$(date +%Y%m%d_%H%M%S).log"

mkdir -p "$OUT_DIR"

cat <<EOF > "$OUT_FILE"
[INFO] Retention cleanup started
[INFO] Policy: Delete PII after 365 days from case closure
[INFO] Tables affected: applicant, application, consent, attachment_meta
[INFO] Deleted rows (simulated): applicant=2, application=2, consent=2, attachment_meta=5
[INFO] Result: SUCCESS
[INFO] Timestamp: $(date -u +"%Y-%m-%dT%H:%M:%SZ")
EOF

echo "Retention cleanup log created: $OUT_FILE"

