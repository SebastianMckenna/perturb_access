#!/bin/bash

# Source directory
source_dir="/g/data/hh5/tmp/zg0866/ACCESS-CM2_archive/cm000/restart"

# Patterns to search for
pattern_a="11000101"
pattern_b="10991231"
pattern_c="1100-01-01"

# Find files matching the patterns and copy them while maintaining directory structure
find "$source_dir" -type f \( -name "*$pattern_a*" -o -name "*$pattern_b*" -o -name "*$pattern_c*" \) -exec bash -c '
    destination_dir="/g/data/e14/sm2435/RESTARTS/cm000/restart"
    for file; do
	# Get the directory structure after the source directory
        rel_dir="${file#'"$source_dir"'}"
        # Construct destination directory
        dest="$destination_dir$rel_dir"
        # Ensure destination directory exists, create if not
        mkdir -p "$(dirname "$dest")"
        # Copy file to destination
        cp "$file" "$dest"
    done
' bash {} +
