#!/usr/bin/env bash
set -euo pipefail
repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
command -v hspice >/dev/null || { echo "hspice is not on PATH" >&2; exit 1; }
[[ -f "$repo_dir/models/mm018.l" ]] || { echo "Place mm018.l in models/" >&2; exit 1; }
mkdir -p "$repo_dir/runs"
cd "$repo_dir/netlists"
for deck in *.sp; do
  hspice -i "$deck" -o "$repo_dir/runs/${deck%.sp}"
done
