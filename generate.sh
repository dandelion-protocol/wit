#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")"
readonly CWD="$(pwd)"

readonly PACKAGES=( common daemon )
readonly VERSION="0.1.0"

rm -rf out
mkdir -p out
for package in "${PACKAGES[@]}"; do
  cd "${CWD}/${package}"
  wit build -o "${CWD}/out/dandelion-${package}@${VERSION}.wasm"
done
