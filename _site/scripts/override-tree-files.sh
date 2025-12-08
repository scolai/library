#!/bin/bash

########################################
#    override-tree-files.sh
#
#	Overrides existing files in directory with
#		files of the same name in BOILERPLATE_DIR
#
#   DOES override directory files !!!
#		
#	USAGE: ./override-tree-files.sh path/to/target-directory 
#
#	NOTE: target directory path is relative to the directory from
#			where the script is run.
#	
#	eg. script location: /home/blue/webace/library/scripts
#		target location: /home/blue/webace/library
#		path to target: ../
#
#	UPDATE: changed order of inputs: entering just target path will
#			execute well.
#
########################################

# Target directory
TARGET_DIR="${1:-.}" # Default to current directory

# Path to the input file
INPUT_FILE="${2:-structure.txt}"

# Path to the boilerplate source directory
BOILERPLATE_DIR="${3:-boilerplate}"


# Dry-run
DRY_RUN="${4:-false}"

if [[ "$DRY_RUN" == "true" ]]; then
	echo "Would overwrite: $TARGET_FILE"
else
	cp -f "$file" "$TARGET_FILE"
fi


copy-file() {
	
	
	
	}

# Save copy before initiating override


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
		
		# Save backup then override any existing file with the same name
		if [[ -f "$TARGET_FILE" ]]; then 
			cp "$TARGET_FILE" "$TARGET_FILE.bak"
		fi
			cp -f "$file" "$TARGET_FILE"
		fi
	done
done < "$INPUT_FILE"
