#!/usr/bin/env bash

set -eu

REPO_DIR="$(dirname "${0}")"
SCRIPTS=("${REPO_DIR}"/*.sh)

echo "Testing files ${SCRIPTS[*]}"
shellcheck --external-sources --exclude SC1090 "${SCRIPTS[@]}"
echo "Success"

