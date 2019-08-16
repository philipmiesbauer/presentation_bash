# Presentation Bash

A slide-based presentation tool that is run as a bash executable.

I started this project for a presentation about safe and advanced bash scripting,
but it turned into something more useful than I originally expected.

I am well aware of how nerdy this project is, but I am happy to share it with anybody
who is interested in making an impression on their next presentation.

### Overview

The presenation will autoformat on each new slide to fit the available window size
and it was designed and tested on `bash version 4.3.48` on Ubuntu 16.04.

This project uses the `mapfile` built-in bash command, which was introduced
in bash 4, so that is why bash 4 is minimum requirement.

### Requirements

- bash (=> 4)

### Run presentation

The presentaiton can be run with the command

```bash
bash presentation.sh
```
### Setup presentation

1. Ensure that the presenation sources `navigation.sh`
1. Populate `SLIDES` array with slide commands
1. Call `present` with the SLIDES array's elements as parameters `present "${SLIDES[@]}"`

### Navigation

Within a single slide with multiple elements, e.g. a list slide or scritp slide, any button will
progress the presenation. Moving backwards within a slide is currently not possible.

1. Pressing `n` will move to the **n**ext slide
1. Pressing `b` will move **b**ack 1 slide
1. Pressing `c` will move to the next **c**hapter
1. Pressing `x` will move back 1 chapter (because it is left beside c on an irish keyboard, like b is left beside n)

### Type of slides

#### Empty slide

An empty slide needs no information. It keeps the screen empty until the slide is changed.

```bash
empty_slide
```

#### Section slide

A section slide has a title, subtitle and an optional formatting. The formatting will only apply to the title, but not
the subtitle.

The subtitle may include `\n` for multiline subtitles.

```bash
section_slide "Title" "Subtitle\n2nd Subtitle" "green"
```

All valid formatting options are listed here:
  - red
  - yellow
  - blue
  - green
  - bold (default)

If `jp2a` is installed on the machine running the presentation, then it will dispaly the image called logo on
the slide.

#### File Slide

The file_slide has a title and a filename.

This slide will print the contents of a file in the middle of currently available screen

```bash
file_slide "Title" "some_file.txt" 
```

#### List Slide

The list_slide has a title and an arbituary number of list elements.

This slide will print the contents of a file in the middle of currently available screen.

Each element will require another key press to appear.

```bash
list_slide "Title" "1st item" "2nd item" "3rd item" 
```

#### Numbered List Slide

A numbered_list_slide behaves identical to a list_slide, except for the fact that it numbers its elements.

```bash
numbered_list_slide "Title" "1st item" "2nd item" "3rd item" 
```

#### Text Slide

A text slide has a title and the text. Multiple lines of the text are separated by `\n`.

```bash
text_slide "Title" "1st line\n2nd line\n3rd line" 
```

All text will be dispalyed at once, one key press after the title. The first line of the text is preceeded
by `- `.

#### Script Slide

A script slide has a title, a valid filename to a bash executable script and an arbituary number of parameters
that should get passed to the script.

```bash
script_slide "Title" "script_without_parameters.sh" 
script_slide "Title" "script_with_parameters.sh" "1st parameter" "2nd parameter"
```

The script slide will first print the title and the cat command for the file, then print the contents of the scripts and
the bash command to be executed and then the output of the executed script.
