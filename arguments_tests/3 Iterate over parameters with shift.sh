#!/bin/bash

set -eu
set -o pipefail

echo "scriptname: ${0:-}"
count=1
while [[ -n ${1:-} ]]; do
  echo "Parameter $((count++)): $1"
  shift
done