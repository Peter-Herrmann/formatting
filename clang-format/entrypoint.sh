#!/bin/sh -l

# Get the directories argument, default to the current directory
DIRECTORIES=${1:-"."}

# Navigate to the repository directory
cd $GITHUB_WORKSPACE

# Check for formatting discrepancies
find $DIRECTORIES -name '*.c' -o -name '*.cpp' -o -name '*.h' | xargs clang-format -n --Werror

# Capture the exit code
EXIT_CODE=$?

# If the exit code is non-zero, formatting discrepancies were found
if [ $EXIT_CODE -ne 0 ]; then
  echo "Formatting discrepancies found. Failing the action."
  exit $EXIT_CODE
fi

# Run clang-format to actually format the files
find $DIRECTORIES -name '*.c' -o -name '*.cpp' -o -name '*.h' | xargs clang-format -i -style=file

# Done
echo "Clang-Format has been applied to directories: $DIRECTORIES."
