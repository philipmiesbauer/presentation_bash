#!/bin/bash

set -eu
set -o pipefail

ls -l
echo "-----"
# PROBLEMATIC  
ARRAY=( $(ls -l) )
echo "${ARRAY[0]}"
echo "${ARRAY[1]}"
echo "-----"
mapfile -t ARRAY < <(ls -l)
echo "${ARRAY[0]}"
echo "${ARRAY[1]}"