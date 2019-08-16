#!/bin/bash

set -eu
set -o pipefail

UPPER="I AM UPPER CASE."
LOWER="i am lower case."

echo "${LOWER^}"
echo "${LOWER^i}"
echo "${LOWER^I}"
echo "${LOWER^^}"
echo "${UPPER,}"
echo "${UPPER,I}"
echo "${UPPER,i}"
echo "${UPPER,,}"