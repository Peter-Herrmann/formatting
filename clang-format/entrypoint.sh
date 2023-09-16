#!/bin/sh -l

# Get the directories argument, default to the current directory
DIRECTORIES=${1:-"."}

# Debug: Show the directories that will be processed
echo "Debug: Directories to be processed: $DIRECTORIES"

# Navigate to the repository directory
cd $GITHUB_WORKSPACE

# Variable to capture the global exit code
GLOBAL_EXIT_CODE=0

# Loop over each directory to check for formatting discrepancies
for dir in $DIRECTORIES; do
  # Debug: Show the current directory being processed
  echo "Debug: Processing directory: $dir"
  
  find "$dir" -name '*.c' -o -name '*.cpp' -o -name '*.h' | xargs clang-format -n --Werror || EXIT_CODE=$?
  if [ $EXIT_CODE -ne 0 ]; then
    GLOBAL_EXIT_CODE=1
    echo "Formatting discrepancies found in directory: $dir"
  fi
done

# If formatting discrepancies were found, fail the action
if [ $GLOBAL_EXIT_CODE -ne 0 ]; then
  echo "Formatting discrepancies found. Failing the action."
  exit $GLOBAL_EXIT_CODE
fi

# Loop over each directory and apply clang-format
for dir in $DIRECTORIES; do
  find "$dir" -name '*.c' -o -name '*.cpp' -o -name '*.h' | xargs clang-format -i -style=file
done

# Done
echo "Clang-Format has been applied to directories: $DIRECTORIES."
