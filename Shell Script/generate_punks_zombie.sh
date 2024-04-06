#!/bin/bash

# Define a list of zombie archetypes for punks.
declare -a archetypes=(
  "Zombie" "Zombie (N)" "Zombie (N2)" "Zombie Female (U)" "Zombie Female"
  "Zombie Gold 1" "Zombie Gold 2" "Zombie Gold 3" "Zombie Female Gold 1" "Zombie Female Gold 2" "Zombie Female Gold 3"
)


# Specify the output directory
output_dir="../Punk Types/Zombie"

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
