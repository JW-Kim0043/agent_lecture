#!/usr/bin/env bash
# export-pdf-large.sh — Thin delegate to frontend-slides export-pdf.sh --large
#
# The frontend-slides skill now supports --large natively (lossless 1.5x text,
# CSS 1280x720 @ DPR=1.5 → native 1920x1080 → PDF 1920x1080, 1:1 mapping).
# This wrapper exists so the project has a stable script path regardless of
# where the skill lives.
#
# Usage:
#   bash scripts/export-pdf-large.sh <input.html> [output.pdf]

set -euo pipefail

SKILL_SCRIPT="/Users/a10861/dev/frontend-slides/scripts/export-pdf.sh"

if [[ ! -f "$SKILL_SCRIPT" ]]; then
  echo "✗ frontend-slides skill not found at: $SKILL_SCRIPT" >&2
  echo "  Update SKILL_SCRIPT in this file or invoke export-pdf.sh --large directly." >&2
  exit 1
fi

bash "$SKILL_SCRIPT" "$@" --large
