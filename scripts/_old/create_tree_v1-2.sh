#!/bin/bash

########################################
#    create_tree_1.2
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
#	NEW: Updated sources and target.
#		Can now set paths from command line
#		for source and target.
#		
#	USAGE: ./create_tree_1-2.sh path/to/structure.txt path/to/boilerplate/ path/to/target-directory 
#
#	NOTE: path to target directory is relative to the directory from
#	where the script is run
#	eg. script location: /home/blue/webace/library/scripts
#		target location: /home/blue/webace/library
#		path to target: ../components
#
#	PLUS: BOILERPLATE_DIR now grabs all files.
#
########################################

# Path to the input file
INPUT_FILE="${1:-structure.txt}"

# Path to the boilerplate source directory
BOILERPLATE_DIR="${2:-boilerplate}"

# Target directory
TARGET_DIR="${3:-.}" # Default to current directory

#Files to copy from boilerplate 
FILES=("$BOILERPLATE_DIR"/*)

# Read each line from the input file
while IFS= read -r line || [[ -n "$line" ]]; do
	# Skip empty lines
	[[ -z "$line" ]] && continue
	
	# Create the directory inside the target path
	mkdir -p "$TARGET_DIR/$line"
	
	# Copy boilerplate files into the directory
	for file in "${FILES[@]}"; do
		filename=$(basename "$file")
		TARGET_FILE="$TARGET_DIR/$line/$filename"
		
		# Only copy if the target file doesn't already exist
		if [[ -f "$file" && ! -f "$TARGET_FILE" ]]; then
			cp "$file" "$TARGET_FILE"
		fi
	done
done < "$INPUT_FILE"
