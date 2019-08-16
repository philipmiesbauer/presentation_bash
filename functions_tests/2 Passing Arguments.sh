#!/bin/bash

set -eu
set -o pipefail

function ring {
  echo "Argument 1: ${1:-}"
  echo "Argument 2: ${2:-}"
}

echo "Argument 1: ${1:-}"
echo "Argument 2: ${2:-}"
ring one two