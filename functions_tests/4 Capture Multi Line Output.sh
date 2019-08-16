#!/bin/bash

set -eu
set -o pipefail

function ring {
  echo "Thanks for calling"
  echo "How are you doing?"
  echo "Hello, are you still there?"
}

mapfile -t OUTPUT_ARR < <(ring)
for line in "${OUTPUT_ARR[@]}"; do
  echo "$line"
done