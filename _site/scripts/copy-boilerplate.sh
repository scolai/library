#!/bin/bash

########################################################################
#    copy-boilerplate.sh
#
#	Overrides existing files in directory with
#		files of the same name in BOILERPLATE_DIR
#
#   DOES override directory files. Does not change or delete any documents
#		whose file names are not in boilerplate. Creates backup .bak of 
#		overridden file.
#		
#	# Usage: ./copy_boilerplate.sh [TARGET_DIR] [INPUT_FILE] [BOILERPLATE_DIR] [--dry-run] [--backup] [--log] [--confirm]
#
#	NOTE: target directory path is relative to the directory from
#			where the script is run.
#	
#
########################################################################



TARGET_DIR="${1:-.}"
INPUT_FILE="${2:-structure.txt}"
BOILERPLATE_DIR="${3:-boilerplate}"

# Flags
DRY_RUN=false
BACKUP=false
LOG=false
CONFIRM=false

# Parse flags
for arg in "$@"; do
  case "$arg" in
    --dry-run) DRY_RUN=true ;;
    --backup) BACKUP=true ;;
    --log) LOG=true ;;
    --confirm) CONFIRM=true ;;
  esac
done

# Files to copy
FILES=("$BOILERPLATE_DIR"/*)

# Logging function
log_action() {
  [[ "$LOG" == true ]] && echo "$(date) - $1" >> copy.log
}

# Copy function
copy_file() {
  local src="$1"
  local dest="$2"

  if [[ "$DRY_RUN" == true ]]; then
    echo "[DRY-RUN] Would copy $src → $dest"
    return
  fi

  if [[ "$CONFIRM" == true ]]; then
    read -p "Overwrite $dest with $src? [y/N] " confirm
    [[ "$confirm" != "y" ]] && return
  fi

  if [[ "$BACKUP" == true && -f "$dest" ]]; then
    cp "$dest" "$dest.bak"
    log_action "Backed up $dest → $dest.bak"
  fi

  cp -f "$src" "$dest"
  log_action "Copied $src → $dest"
}

# Main loop
while IFS= read -r line || [[ -n "$line" ]]; do
  [[ -z "$line" ]] && continue
  mkdir -p "$TARGET_DIR/$line"

  for file in "${FILES[@]}"; do
    filename=$(basename "$file")
    TARGET_FILE="$TARGET_DIR/$line/$filename"
    [[ -f "$file" ]] && copy_file "$file" "$TARGET_FILE"
  done
done < "$INPUT_FILE"
