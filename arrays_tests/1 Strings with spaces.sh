#!/bin/bash

set -eu
set -o pipefail

STRING="Bash can iterate over words in string"
for word in $STRING; do
  echo "$word"
done