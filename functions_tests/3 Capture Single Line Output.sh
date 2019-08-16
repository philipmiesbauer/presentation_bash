#!/bin/bash

set -eu
set -o pipefail

function ring {
  echo "Thanks for calling"
}

OUTPUT="$(ring)"
echo "Answered with \"$OUTPUT\""