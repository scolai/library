#!/bin/bash
# Usage: ./resize-images-v1-1.sh
# Resizes all images defined under # Loop through images
# according to widths defined under # Define target widths
# and converts image types under img to .jpg .webp and .avif.
# Original images are preserved; copies are placed in ./resized/
# which is created if it does not already exist


mkdir -p resized
widths=(200 400 500 600 800 1280)

for img in *.jpg *.jpeg *.png *.webp *.avif; do
  # Skip if no matching files
  [ -e "$img" ] || continue 
	
  filename=$(basename "$img")
  name="${filename%.*}"
	
  for w in "${widths[@]}"; do
    # JPEG
    convert "$img" -resize "${w}" -quality 80 -strip "resized/${name}-${w}.jpg"
    # WebP
    convert "$img" -resize "${w}" -quality 80 -strip "resized/${name}-${w}.webp"
    # AVIF (if supported)
    convert "$img" -resize "${w}" -quality 50 -strip "resized/${name}-${w}.avif"
    echo "Created ${name}-${w} in JPG, WebP, AVIF"
  done
done
