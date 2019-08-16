#!/bin/bash

set -eu
set -o pipefail

echo "scriptname: ${0:-}"
echo "parameter1: ${1:-}"
shift
echo "parameter2: ${1:-}"
shift
echo "parameter3: ${1:-}"
shift