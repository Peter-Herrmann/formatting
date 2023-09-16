#!/bin/sh -l

# Get the directories argument, default to the current directory
DIRECTORIES=${1:-"."}

# Navigate to the repository directory
cd $GITHUB_WORKSPACE

# Run clang-format on all C/C++ files within the specified directories
find $DIRECTORIES -name '*.c' -o -name '*.cpp' -o -name '*.h' | xargs clang-format -i -style=file

# Done
echo "Clang-Format has been applied to directories: $DIRECTORIES."
