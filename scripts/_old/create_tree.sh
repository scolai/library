#!/bin/bash

########################################
#    Takes input from a text file 
#     and generates directories
#	  and subdirectories.
#    
#   Does NOT overwrite nor delete.
#
########################################

# Path to the input file
INPUT_FILE="structure.txt"

#Files to create in each subdirectory
FILES=("index.html" "style.css" "README.md")

# Read each line from the input file
while IFS= read -r line || [[ -n "$line" ]]; do
	# Skip empty lines
	[[ -z "$line" ]] && continue
	
	# Create the directory
	mkdir -p "$line"
	
	# Create default files inside the directory
	for file in "${FILES[@]}"; do
		FILE_PATH="$line/$file"
		if [[ ! -f "$FILE_PATH" ]]; then
			echo "<!-- $file for $line -->" > "$FILE_PATH"
		fi
	done
done < "$INPUT_FILE"
