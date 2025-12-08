#!/bin/bash
# Usage: ./resize-images.sh
# Resizes all image types defined under # Loop through images
# according to widths defined under # Define target widths
# Original images are preserved; resized copies go into ./resized/

# Create output folder if it doesn't exist
mkdir -p resized

# Define target widths
widths=(200 400 500 600 800 1280)

# Loop through images
for img in *.jpg *.jpeg *.png *.webp; do
	# Skip if no matching files
	[ -e "$img" ] || continue
	
	filename=$(basename "$img")
	name="${filename%.*}"
	ext="${filename##*.}"
	
	for w in "${widths[@]}"; do
		convert "$img" -resize "${w}" "resized/${name}-${w}.${ext}"
		echo "Created/resized/${name}-${w}.${ext}"
	done
done

echo "✅  All images resized. Originals remain untouched."
