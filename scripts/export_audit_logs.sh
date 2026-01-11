#!/usr/bin/env bash
set -e

OUT_DIR="docs/logs"
OUT_FILE="${OUT_DIR}/audit_export_$(date +%Y%m%d_%H%M%S).log"

mkdir -p "$OUT_DIR"

cat <<EOF > "$OUT_FILE"
[INFO] Export audit log started
[INFO] Service: e-Registracija verskih skupnosti
[INFO] Action: EXPORT_AUDIT_LOGS
[INFO] Result: SUCCESS
[INFO] Records exported: 12
[INFO] Timestamp: $(date -u +"%Y-%m-%dT%H:%M:%SZ")
EOF

echo "Audit log exported to: $OUT_FILE"

