#!/bin/bash

# Define a list of ape archetypes for punks.
declare -a archetypes=(
  "Ape" "Ape (N)" "Ape (N2)" "Ape Female (U)" "Ape Female"
  "Ape Gold 1" "Ape Gold 2" "Ape Gold 3" "Ape Female Gold 1" "Ape Female Gold 2" "Ape Female Gold 3"
  "Ape Black" "Ape Gray" "Ape Dark Brown" "Ape Brown" "Ape Golden Brown" "Ape Cheetah"
  "Ape Blue" "Ape DMT" "Ape Pink" "Ape Red" "Ape Tan" "Ape Cream" "Ape White" "Ape Trippy"
  "Ape Noise" "Ape Solid Gold" "Ape Bot" "Ape Death Bot"
)

# Specify the output directory
output_dir="../Punk Types//Ape"

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
