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
ANSWER=2
echo "1 + 1 = $ANSWER"
one_plus_one_is $ANSWER
if [[ $? == 0 ]]; then
  echo "Well done"
else
  echo "Oops, not quite"
fi