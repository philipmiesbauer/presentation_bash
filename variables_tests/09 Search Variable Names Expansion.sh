#!/bin/bash

set -eu
set -o pipefail

VARIABLE1="I do not like them in a box. I do not like them with a fox."
VARIABLE2="I do not like them in a house. I do not like them with a mouse."
VARIABLE3="I do not like them here or there. I do not like them anywhere."
OTHER_VAR1="I do not like them, Sam-I-am."

echo "$VARIABLE1"
echo "$VARIABLE2"
echo "$VARIABLE3"
echo "$OTHER_VAR1"
echo "${!VAR*}"
echo "${!OTHER*}"