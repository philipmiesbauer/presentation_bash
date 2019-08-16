#!/bin/bash

set -eu
set -o pipefail

STRING="But it doesn't always quite work *"
for word in $STRING; do
  echo "$word"
done