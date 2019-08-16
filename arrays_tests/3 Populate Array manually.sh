#!/bin/bash

set -eu
set -o pipefail

ARRAY=( "This" "is" "an" "array" "of" )
ARRAY+=( "words" "*" )
for word in "${ARRAY[@]}"; do
  echo "$word"
done
echo ""
for word in "${ARRAY[*]}"; do
  echo "$word"
done