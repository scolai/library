#!/bin/bash

########################################
#    create_tree_1.1
#
#	  Takes input from a text file 
#     and generates directories
#	  and subdirectories.
#
#	  Takes files from folder as boilerplate
#     to create default files containing
#	  boilerplate for each directory.
#
#     Does NOT overwrite nor delete.
#
#	NOTE: Directories will appear in same directory
#		as script.
#		
#
########################################

# Path to the input file
INPUT_FILE="structure.txt"

# Path to the boilerplate source directory
BOILERPLATE_DIR="boilerplate"

#Files to copy from boilerplate 
FILES=("index.html" "style.css" "README.md")

# Read each line from the input file
while IFS= read -r line || [[ -n "$line" ]]; do
	# Skip empty lines
	[[ -z "$line" ]] && continue
	
	# Create the directory
	mkdir -p "$line"
	
	# Copy boilerplate files into the directory
	for file in "${FILES[@]}"; do
		SOURCE_FILE="$BOILERPLATE_DIR/$file"
		TARGET_FILE="$line/$file"
		
		# Only copy if the target file doesn't already exist
		if [[ -f "$SOURCE_FILE" && ! -f "$TARGET_FILE" ]]; then
			cp "$SOURCE_FILE" "$TARGET_FILE"
		fi
	done
done < "$INPUT_FILE"
