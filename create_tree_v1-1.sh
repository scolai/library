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
########################################

# Path to the input file
INPUT_FILE="structure.txt"

# Path to the boilerplate source directory
BOILERPLATE_DIR="boilerplate"

#Files to copy from boilerplate 
FILES=("index.html" "style.css" "README.md")

# Read each line from the input file
while IFS= read -r line; do
	# Line sanitizer
	clean_line=$(echo "$line" | tr -d '\r' | xargs)

	# Skip empty lines
	[[ -z "$clean_line" ]] && continue
	
	# Create the directory
	mkdir -p "$clean_line"
	
	# Confirm each step is working
	echo "Creating: $clean_line"
	
	# Copy boilerplate files into the directory
	for file in "${FILES[@]}"; do
		SOURCE_FILE="$BOILERPLATE_DIR/$file"
		TARGET_FILE="$clean_line/$file"
		
		# Only copy if the target file doesn't already exist
		if [[ -f "$SOURCE_FILE" && ! -f "$TARGET_FILE" ]]; then
			cp "$SOURCE_FILE" "$TARGET_FILE"
			# Append pwd path of file to top of file
			case "$file" in 
				*.css) 	echo "/* $(realpath "$TARGET_FILE") */" | cat - "$TARGET_FILE" > temp && mv temp "$TARGET_FILE" ;;
				*.html) echo "<!-- $(realpath "$TARGET_FILE") -->" | cat - "$TARGET_FILE" > temp && mv temp "$TARGET_FILE" ;;
				*.md) 	echo "<!-- $(realpath "$TARGET_FILE") -->" | cat - "$TARGET_FILE" > temp && mv temp "$TARGET_FILE" ;;
			esac
		fi
	done
done < "$INPUT_FILE"
