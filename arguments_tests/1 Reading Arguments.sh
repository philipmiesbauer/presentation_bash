#!/bin/bash

set -eu
set -o pipefail

echo "scriptname: ${0:-}"
echo "parameter1: ${1:-}"
echo "parameter2: ${2:-}"
echo "parameter3: ${3:-}"