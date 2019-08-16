#!/bin/bash

set -eu
set -o pipefail

echo "scriptname: ${0:-}"
count=1
for parameter in "$@"; do
  echo "Parameter $((count++)): $parameter"
done