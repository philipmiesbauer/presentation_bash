#!/bin/bash

set -eu
set -o pipefail

VARIABLE="I do not like them in a house. I do not like them with a mouse."

echo "First 12           : ${VARIABLE::12}"
echo "Next 12            : ${VARIABLE:12:12}"
echo "Strip first 2 chars: ${VARIABLE:2}"