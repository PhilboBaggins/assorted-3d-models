#!/bin/sh

set -o nounset  # (set -u) No unset variables
set -o errexit  # (set -e) Exit if any statement returns non-true value

# Select one of the following and comment the other one out
OPENSCAD_BINARY="openscad"
#OPENSCAD_BINARY="C:\Program Files\OpenSCAD\openscad.exe"

# Render model into several PNG files
for i in {1..10}; do
	IMAGE_FILE="MultiChamberBox-$i.png"
	"$OPENSCAD_BINARY" MultiChamberBox.scad -o "$IMAGE_FILE"
done

# Create animated GIF from PNG files
magick convert -delay 25 -dispose previous MultiChamberBox-*.png MultiChamberBox.gif

# Delete all intermediate PNG files
rm MultiChamberBox-*.png
