#!/bin/sh
set -e

# Required input
INPUT_FILE=${INPUT_INPUT_FILE:-""}

# Optional inputs
OUTPUT_FILE=${INPUT_OUTPUT_FILE:-""}
DATA_SOURCES=${INPUT_DATA_SOURCES:-""}
OPTIONS=${INPUT_OPTIONS:-""}

# Ensure required input is provided
if [ -z "$INPUT_FILE" ]; then
  echo "Error: input_file is required"
  exit 1
fi

# Start building the command
CMD="gomplate -f \"$INPUT_FILE\""

# Handle optional output file
if [ -n "$OUTPUT_FILE" ]; then
  CMD="$CMD -o \"$OUTPUT_FILE\""
fi

# Handle multiple data sources
if [ -n "$DATA_SOURCES" ]; then
  # Convert comma or newline-separated values into multiple `-d` options
  IFS=$'\n'  # Change field separator to newline
  for source in $(echo "$DATA_SOURCES" | tr ',' '\n'); do
    CMD="$CMD -d $source"
  done
fi

# Handle extra options
if [ -n "$OPTIONS" ]; then
  CMD="$CMD $OPTIONS"
fi

echo "Executing: $CMD"
sh -c "$CMD"
