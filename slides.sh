#!/bin/bash

set -eu
set -o pipefail

: ' Utilities needed for a bash presentation'

RED='\033[0;31m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
BOLD='\033[1m'
NONE='\033[0m'

function red() {
  echo "${RED}${1:-}${NONE}"
}
function blue() {
  echo "${BLUE}${1:-}${NONE}"
}
function green() {
  echo "${GREEN}${1:-}${NONE}"
}
function yellow() {
  echo "${YELLOW}${1:-}${NONE}"
}
function bold() {
  echo "${BOLD}${1:-}${NONE}"
}
function slide_setup() {
  COLS="$(tput cols)"
  LINES="$(tput lines)"
  clear
}
function print_title() {
  if (( $# > 0 )); then
    echo ""
    echo -e "  $(bold "${1}")"
    LINES=$((LINES - 2))
  fi
}
function file_slide() {
  slide_setup
  print_title "$@"
  shift
  if [[ -f "${1:-}" ]]; then
    FILE="$1"
    PARAMETERS=()
    while [[ -n ${2:-} ]]; do
      PARAMETERS+=( "$2" )
      shift
    done
    PRINT_LINES=$(wc --lines < "$FILE")
    PRELINES=$(((LINES - PRINT_LINES) / 6))
    MAX_LINE_LENGTH=$(wc --max-line-length < "$FILE")
    PRECOLS=$(((COLS - MAX_LINE_LENGTH) / 6))
    # shellcheck disable=SC2034
    # the variable line is not used, but not needed either
    for line in $(seq 1 $PRELINES); do
      echo ""
    done
    SPACES=""
    # shellcheck disable=SC2034
    # the variable col is not used, but not needed either
    for col in $(seq 1 $PRECOLS); do
      SPACES="$SPACES "
    done
    echo "$SPACES$> cat \"$FILE\""
    read -srn1
    count=1
    mapfile -t lines < <(cat --number "$FILE")
    for line in "${lines[@]}"; do
      if [[ "$line" != "" ]]; then
        echo -e "$SPACES${line}"
      fi
    done
  else
    echo "File \"${1:-}\" not found"
  fi
}
function list_slide() {
  slide_setup
  print_title "$@"
  shift
  PRELINES=$(((LINES - $#) / 2))
  for line in $(seq 1 $PRELINES); do
    echo ""
  done
  for item in "$@"; do
    read -srn1
    echo -e "\t- $item"
  done
}
function numbered_list_slide() {
  slide_setup
  print_title "$@"
  shift
  PRELINES=$(((LINES - $#) / 2))
  for line in $(seq 1 $PRELINES); do
    echo ""
  done
  local count=1
  for item in "$@"; do
    read -srn1
    echo -e "\t$count. $item"
    count=$((count + 1))
  done
}
function section_slide() {
  slide_setup
  FORMAT="${3:-"bold"}"
  PRELINES=$((3 * LINES / 4))
  PRECOLS=$((COLS / 6))
  if command -v jp2a > /dev/null; then
    IMAGE_LENGTH=$((9 * COLS / 10))
    CMD="jp2a --width=$IMAGE_LENGTH --colors images/logo.jpg"
    mapfile -t JLR_LOGO < <(eval "$CMD")
    PRECOLS_IMAGE=$(((COLS - IMAGE_LENGTH) / 2))
    SPACES_IMAGE=""
    # shellcheck disable=SC2034
    # the variable col is not used, but not needed either
    for col in $(seq 1 $PRECOLS_IMAGE); do
      SPACES_IMAGE="$SPACES_IMAGE "
    done
    IMAGE_HEIGHT=${#JLR_LOGO[@]}
    PRELINES_IMAGE=$(((PRELINES - IMAGE_HEIGHT) / 2))
  fi
  # shellcheck disable=SC2034
  # the variable line is not used, but not needed either
  for line in $(seq 1 ${PRELINES_IMAGE:-0}); do
    echo ""
  done
  for line in $(seq 1 $((PRELINES - PRELINES_IMAGE))); do
    echo "${SPACES_IMAGE:-}${JLR_LOGO[line]:-}"
  done
  SPACES=""
  # shellcheck disable=SC2034
  # the variable col is not used, but not needed either
  for col in $(seq 1 $PRECOLS); do
    SPACES="$SPACES "
  done
  echo -e "$SPACES$("$FORMAT" "${1:-}")"
  if [[ -n "${2:-}" ]]; then
    echo -e "$SPACES${2//\\n/\\n$SPACES}"
  fi
}
function text_slide() {
  slide_setup
  print_title "$@"
  shift
  PRINT_LINES=$(echo -e "${1:-}" | wc --lines)
  PRELINES=$(((LINES - PRINT_LINES) / 2))
  # shellcheck disable=SC2034
  # the variable line is not used, but not needed either
  for line in $(seq 1 $PRELINES); do
    echo ""
  done
  if [[ -n "${1:-}" ]]; then
    read -srn1
    echo -e "\t- ${1//\\n/\\n\\t  }"
  fi
}
function script_slide() {
  slide_setup
  print_title "$@"
  shift
  if [[ -f "${1:-}" ]]; then
    SCRIPT="$1"
    PARAMETERS=( )
    while [[ -n ${2:-} ]]; do
      PARAMETERS+=( "$2" )
      shift
    done
    PRINT_LINES=$(wc --lines < "$SCRIPT")
    PRELINES=$(((LINES - PRINT_LINES) / 6))
    MAX_LINE_LENGTH=$(wc --max-line-length < "$SCRIPT")
    PRECOLS=$(((COLS - MAX_LINE_LENGTH) / 6))
    # shellcheck disable=SC2034
    # the variable line is not used, but not needed either
    for line in $(seq 1 $PRELINES); do
      echo ""
    done
    SPACES=""
    # shellcheck disable=SC2034
    # the variable col is not used, but not needed either
    for col in $(seq 1 $PRECOLS); do
      SPACES="$SPACES "
    done
    echo "$SPACES$> cat \"$SCRIPT\""
    read -srn1
    count=1
    mapfile -t lines < <(cat --number "$SCRIPT")
    for line in "${lines[@]}"; do
      if [[ "$line" != "" ]]; then
        echo -e "$SPACES${line}"
      fi
    done
    echo -e "\n"
    if [[ -z ${PARAMETERS:-} ]]; then
      PARAMETERS=( "" )
    fi
    echo "$SPACES$> bash \"$SCRIPT\" ${PARAMETERS[*]}"
    read -srn1
    count=1
    mapfile -t lines < <(bash "$SCRIPT" "${PARAMETERS[@]}")
    if [[ -n "${lines:-}" ]]; then
      for line in "${lines[@]}"; do
        if [[ "$line" != "" ]]; then
          echo -e "$SPACES${line}"
        fi
      done
    fi
  else
    echo "File \"${1:-}\" not found"
  fi
}
function empty_slide() {
  text_slide "" ""
}
