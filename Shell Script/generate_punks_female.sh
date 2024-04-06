#!/bin/bash

# Define a list of female human archetypes for punks.
declare -a archetypes=(
  "Human Female 1 (U)" "Human Female 2 (U)" "Human Female 3 (U)" "Human Female 4 (U)"
  "Human Female 1" "Human Female 2" "Human Female 3" "Human Female 4"
  "Human Female 1 (N)" "Human Female 2 (N)" "Human Female 3 (N)" "Human Female 4 (N)"
  "Human Female M10" "Human Female M09" "Human Female M08" "Human Female M07" "Human Female M06" "Human Female M05" "Human Female M04" "Human Female M03" "Human Female M02" "Human Female M01"
  "Human Female Chocolate" "Human Female Espresso" "Human Female Golden" "Human Female Umber" "Human Female Bronze" "Human Female Chestnut"
  "Human Female Almond" "Human Female Band" "Human Female Honey" "Human Female Sienna" "Human Female Beige" "Human Female Limestone"
  "Human Female Rose Beige" "Human Female Sand" "Human Female Warm Ivory" "Human Female Pale Ivory" "Human Female Porcelain"
  "Human Female Ivory" "Human Female Orange" "Human Female Warm Red" "Human Female Red" "Human Female Rubine Red" "Human Female Pink"
  "Human Female Purple" "Human Female Blue" "Human Female Violet" "Human Female Yellow" "Human Female Gold 1" "Human Female Gold 2" "Human Female Gold 3"
)

# Specify the output directory
output_dir="../Punk Types/Female"

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
