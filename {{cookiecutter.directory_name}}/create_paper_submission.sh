#!/bin/bash
# Function to display usage information
usage() {
    echo "Usage: $0 MAINFILE"
    echo "where MAINFILE is the name of the main LaTeX file"
    echo "A .bbl file with the same base name must be available."
    exit 1
}

# Check if an argument is provided
if [ $# -eq 0 ]; then
    usage
fi

NAME="${1%.*}"

# Check if the .bbl file exists
if [ ! -f "$NAME.bbl" ]; then
    echo "Error: $NAME.bbl file not found!"
    exit 1
fi

# Create temp folder
TEMP_FOLDER="build/"
rm -rf $TEMP_FOLDER
mkdir $TEMP_FOLDER

# Flatten file
latexpand --expand-bbl $NAME.bbl $NAME.tex > $TEMP_FOLDER/$NAME.tex

# Define an array of file extensions
declare -a extensions=("cls" "sty" "bst" "pdf" "csv" "clo")

# Loop through the array
for ext in "${extensions[@]}"; do
    echo "Checking for *.$ext files..."
    # Find all files with the current extension except the main PDF file
    for file in *.$ext; do
        if [[ "$file" == "$NAME.pdf" || "$file" == "$NAME-submission.pdf" ]]; then
            # Skip copying the main PDF or the main PDF submission file
            echo "Skipping $file as it is the main document."
        else
            # Check if the file exists and is not the main document PDF
            if [ -f "$file" ]; then
                echo "Copying $file."
                cp "$file" $TEMP_FOLDER
            fi
        fi
    done
done


# copy figures
if [ -d figures/ ]; then
    echo "Copying figures/ folder."
    mkdir $TEMP_FOLDER/figures
    cp figures/*.pdf "$TEMP_FOLDER/figures/"
fi

# copy data
if [ -d data/ ]; then
    echo "Copying data/ folder."
    mkdir $TEMP_FOLDER/data/
    cp data/*.csv "$TEMP_FOLDER/data/"
fi

# check that compilation succeeds
cd $TEMP_FOLDER
latexmk -quiet $NAME.tex
cp $NAME.pdf ../$NAME-submission.pdf
latexmk -C $NAME.tex
cd ..

# Create zip for source folder
cd $TEMP_FOLDER
# COPYFILE disables `._` files...
COPYFILE_DISABLE=1 tar -czvf "../$NAME-sources.tar.gz" *
cd ..
rm -rf $TEMP_FOLDER 

