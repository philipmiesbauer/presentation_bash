#!/bin/bash

set -eu
set -o pipefail

: ' Utilities needed for a bash presentation'

source "$PWD/slides.sh"


function back() {
  if (( CURRENT_SLIDE > 0 )); then
    CURRENT_SLIDE=$((CURRENT_SLIDE - 1))
  fi
}
function next() {
  if [[ -z "${NUM_SLIDES:-}" ]]; then
    echo "Called next before present"
    return 1
  fi
  if (( CURRENT_SLIDE < NUM_SLIDES - 1 )); then
    CURRENT_SLIDE=$((CURRENT_SLIDE + 1))
  fi
}
function present() {
  NUM_SLIDES=$(($# + 1))
  SLIDES=("$@" "empty_slide")
  CURRENT_SLIDE=0
  while ((CURRENT_SLIDE < NUM_SLIDES)); do
    eval "${SLIDES[$CURRENT_SLIDE]}"
    local new_slide=false
    while [[ "$new_slide" == false ]]; do
      read -rsn 1 key
      case "$key" in
        'b'|'B') # Back 1 slide
          back
          new_slide=true
          ;;
        'n'|'N'|' ') # Next slide
          next
          new_slide=true
          ;;
        'c'|'C') # next Chapter
          next
          while [[ "${SLIDES[$CURRENT_SLIDE]}" != *"section_slide"* ]]; do
            next
          done
          new_slide=true
          ;;
        'x'|'X') # last chapter (x is beside c)
          back
          while [[ "${SLIDES[$CURRENT_SLIDE]}" != *"section_slide"* ]]; do
            back
          done
          new_slide=true
          ;;
        'h'|'H')
          CURRENT_SLIDE=0
          new_slide=true
          ;;
        'e'|'E')
          CURRENT_SLIDE=$((NUM_SLIDES - 1))
          new_slide=true
          ;;
        *)
          ;;
      esac
    done
  done
}
