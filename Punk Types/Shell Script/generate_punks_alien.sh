#!/bin/bash

# Define a list of alien archetypes for punks.
declare -a archetypes=(
  "Alien" "Alien (N)" "Alien (N2)" "Alien Female B&W" "Alien Female (U)" "Alien Female"
  "Alien (Ape)" "Alien (Ape) (N)"
  "Alien Gold 1" "Alien Gold 2" "Alien Gold 3" "Alien Female Gold 1" "Alien Female Gold 2" "Alien Female Gold 3"
  "Alien 0°" "Alien 30°" "Alien 60°" "Alien 90°" "Alien 120°" "Alien 150°" "Alien 180°"
  "Alien 210°" "Alien 240°" "Alien 270°" "Alien 300°" "Alien 330°"
  "Alien (Ape) 0°" "Alien (Ape) 30°" "Alien (Ape) 60°" "Alien (Ape) 90°" "Alien (Ape) 120°" "Alien (Ape) 150°"
  "Alien (Ape) 180°" "Alien (Ape) 210°" "Alien (Ape) 240°" "Alien (Ape) 270°" "Alien (Ape) 300°" "Alien (Ape) 330°"
  "Alien Female 0°" "Alien Female 30°" "Alien Female 60°" "Alien Female 90°" "Alien Female 120°" "Alien Female 150°"
  "Alien Female 180°" "Alien Female 210°" "Alien Female 240°" "Alien Female 270°" "Alien Female 300°" "Alien Female 330°"
)

# Specify the output directory
output_dir="../Alien"

# Create the output directory if it doesn't exist
mkdir -p "$output_dir"

# Loop through each archetype and generate a punk
for archetype in "${archetypes[@]}"; do
  # Convert archetype to a suitable filename format
  filename=$(echo "$archetype" | tr ' ' '-' | tr '[:upper:]' '[:lower:]')
  filename="punk-$filename.png"

  # Generate the punk
  punk gen "$archetype"

  # Immediately rename and move the generated punk-0000.png file
  if [ -f punk-0000.png ]; then
    mv punk-0000.png "$output_dir/$filename"
    echo "Generated and moved: $filename"
  else
    echo "Expected punk-0000.png was not found. Check the generation command."
  fi
done
