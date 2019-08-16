#!/bin/bash

set -eu
set -o pipefail

: ' The Bash Tech Talk Presentation'
source "$PWD/navigation.sh"
if [[ "$(uname)" == *"Linux"* ]]; then
  setterm -cursor off
fi

function cursor_on {
  if [[ "$(uname)" == *"Linux"* ]]; then
    setterm -cursor on
  fi
}
trap cursor_on EXIT

SLIDES=()

SLIDES+=("section_slide 'Presentation Bash' 'by Philip Miesbauer' \"green\"")

SLIDES+=("numbered_list_slide 'Contents' \"You're my best friend\" \"Don't you forget about me\" 'I want it all' 'Take That and Party' 'Girls just wanna have FUN-ctions' 'Call me maybe'")

# SHELLCHECK
SLIDES+=("section_slide \"You're my best friend\" 'Linting for Bash' 'green'")
SLIDES+=("list_slide \"You're my best friend - Linting for Bash\" 'Shellcheck is an open-source linter for Bash scripts.' 'It can be found on github at https://github.com/koalaman/shellcheck/.' 'It has online rationale and examples of how to fix for each individual rule.' 'Has plugins to most modern IDEs'")

# Variables
SLIDES+=("section_slide \"Don't you forget about me\" 'Variables in Bash' 'green'")
SLIDES+=("list_slide \"Don't you forget about me - Variables in Bash\" 'The use of variables is seemingly straight forward, but is the largest cause of bugs in Bash scripts' 'How to read and write variables safely' 'In-Variable Parameter Expansion' 'String vs. Integer' 'String - Double vs Single vs No Quotes'")
FOLDER="variables_tests/"
for script in "$FOLDER"*; do
  SLIDES+=("script_slide \"Don't you forget about me - ${script##*/}\" '$script'")
done

# Arrays
SLIDES+=("section_slide 'I want it all' 'Arrays in Bash' 'green'")
SLIDES+=("list_slide 'I want it all - Arrays in Bash' 'STRINGS WITH SPACES ARE NOT ARRAYS!' 'Set arrays manually' 'Populate array from command' 'iterate over array'")
FOLDER="arrays_tests/"
for script in "$FOLDER"*; do
  SLIDES+=("script_slide 'I want it all - ${script##*/}' '$script'")
done

# Arguments
SLIDES+=("section_slide 'Take That and Party' 'Arguments in Bash' 'green'")
SLIDES+=("list_slide 'Take That and Party - Arguments in Bash' 'Reading Arguments' 'shift' 'Iterate over Arguments'")
FOLDER="arguments_tests/"
for script in "$FOLDER"*; do
  SLIDES+=("script_slide 'Take That and Party - ${script##*/}' '$script' 'one' 'two' 'three'")
done

# Functions
SLIDES+=("section_slide 'Girls just wanna have FUN-ctions' 'Functions in Bash' 'green'")
SLIDES+=("list_slide 'Girls just wanna have FUN-ctions - Functions in Bash' 'Defining a function' 'Passing arguments to a function' 'Output of a function' 'Sourcing other scripts' 'Return value of a function'")
FOLDER="functions_tests/"
for script in "$FOLDER"*; do
  SLIDES+=("script_slide 'Girls just wanna have FUN-ctions - ${script##*/}' '$script'")
done

# Return values
SLIDES+=("section_slide 'Call me maybe' 'Calling programs in Bash' 'green'")
SLIDES+=("list_slide 'Call me maybe - Calling programs in Bash' 'Calling a program/function' 'Handling the return value, properly'")
FOLDER="calls_tests/"
for script in "$FOLDER"*; do
  SLIDES+=("script_slide 'Call me maybe - ${script##*/}' '$script'")
done

SLIDES+=("section_slide 'Thank you' 'Philip Miesbauer\nhttps://github.com/philipmiesbauer'")

present "${SLIDES[@]}"

