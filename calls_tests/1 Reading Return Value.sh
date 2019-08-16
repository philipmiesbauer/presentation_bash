#!/bin/bash

set -eu
set -o pipefail

function one_plus_one_is {
  if (($1 == 2)); then
    return 0
  else
    return 1
  fi
}

one_plus_one_is 2
echo $?
