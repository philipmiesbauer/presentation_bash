#!/bin/bash

set -eu
set -o pipefail

VAR_STR="One fish, two fish, red fish, blue fish."
VAR_NUM=1

echo "$VAR_STR"
echo "$VAR_NUM"
echo "$((VAR_NUM + 1))"
echo "$((VAR_NUM++))"
echo "$((VAR_NUM / 2))"
echo "$((VAR_NUM ** 2))"
echo "$((VAR_NUM * 2))"
echo "$((VAR_NUM + 2))"
echo "$((VAR_NUM - 2))"