#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")"
readonly CWD="$(pwd)"

readonly PACKAGES=( core daemon )

rm -rf out
mkdir -p out
for package in "${PACKAGES[@]}"; do
  cd "${CWD}/${package}"
  wit build -o "${CWD}/out/${package}.wasm"
done
