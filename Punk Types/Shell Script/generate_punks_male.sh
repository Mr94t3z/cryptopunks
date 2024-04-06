#!/bin/bash

# Define list of male human archetypes
declare -a archetypes=(
  "Human 1" "Human 2" "Human 3" "Human 4"
  "Human 1 (N)" "Human 2 (N)" "Human 3 (N)" "Human 4 (N)"
  "Human M10" "Human M09" "Human M08" "Human M07" "Human M06" "Human M05" "Human M04" "Human M03" "Human M02" "Human M01"
  "Human Chocolate" "Human Espresso" "Human Golden" "Human Umber" "Human Bronze" "Human Chestnut"
  "Human Almond" "Human Band" "Human Honey" "Human Sienna" "Human Beige" "Human Limestone"
  "Human Rose Beige" "Human Sand" "Human Warm Ivory" "Human Pale Ivory" "Human Porcelain"
  "Human Ivory" "Human Orange" "Human Warm Red" "Human Red" "Human Rubine Red" "Human Pink"
  "Human Purple" "Human Blue" "Human Violet" "Human Yellow" "Human Gold 1" "Human Gold 2" "Human Gold 3"
)

# Specify the output directory
output_dir="../Male"

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
