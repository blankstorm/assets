#!/bin/sh
current_dir=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P ) # https://stackoverflow.com/a/24112741

output_dir="${1:-$current_dir/../../assets/models}" 

# Check if Blender is not installed
if ! command -v blender >/dev/null 2>&1; then
    echo "Blender is not installed. Please install Blender to export models."
    exit 1
fi

# Blender is installed, so run Blender with Python script
echo "found Blender! Exporting models..."
blender -b -P "$current_dir/export.py" -- -i "$current_dir" -o "$output_dir"
echo "Done!"
