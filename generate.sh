#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")"
readonly CWD="$(pwd)"

if ! type -t wit &>/dev/null ; then
  echo "fatal: required program 'wit' was not found" >&2
  echo "       consider running 'cargo install wit'" >&2
  exit 1
fi

. constants.bash

build_wit() {
  local dst="${1?}"
  shift
  wit build "$@" --output="$dst"
}

rm -rf out
mkdir -p out
for package in "${PACKAGES[@]}"; do
  filename="dandelion-${package}@${VERSION}.wasm"
  cd "$package"
  build_wit "../out/${filename}"
  cd "$CWD"
done
