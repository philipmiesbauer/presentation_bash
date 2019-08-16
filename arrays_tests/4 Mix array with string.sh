#!/bin/bash

set -eu
set -o pipefail

ARRAY=( "This" "is" "an" "array" "of" )
ARRAY+=( "words" "*" )

echo "${ARRAY[@]}"
echo "String ${ARRAY[*]}"