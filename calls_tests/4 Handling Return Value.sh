#!/bin/bash

set -eu
set -o pipefail

function one_plus_one_is {
  if ((${1:-0} == 2)); then
    return 0
  else
    return 1
  fi
}
ANSWER=3
echo "1 + 1 = $ANSWER"
if one_plus_one_is $ANSWER; then
  echo "Well done"
else
  echo "Oops, not quite"
fi