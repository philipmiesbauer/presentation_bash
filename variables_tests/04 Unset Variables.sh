#!/bin/bash

set -eu
set -o pipefail

unset VARIABLE
if [[ -n "$VARIABLE" ]]; then
  echo "$VARIABLE"
else
  echo "ERROR: VARIABLE was unset"
fi