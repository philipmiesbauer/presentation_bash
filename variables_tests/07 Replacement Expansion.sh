#!/bin/bash

set -eu
set -o pipefail

VARIABLE="I do not like them in a house. I do not like them with a mouse."

echo "Normal     : ${VARIABLE:-}"
echo "Replacement: ${VARIABLE/I/You}"
echo "Replacement: ${VARIABLE//not/so}"
echo "Remove     : ${VARIABLE#*them}"
echo "Remove     : ${VARIABLE##*them}"
echo "Remove     : ${VARIABLE%them*}"
echo "Remove     : ${VARIABLE%%them*}"