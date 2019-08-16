#!/bin/bash

set -eu
set -o pipefail

VARIABLE="How many characters are in this sentence?  "

echo "Length: ${#VARIABLE}"