#!/bin/bash

# Function to convert HTTPS URL to SSH format and clone repositories
clone_repo() {
    REPO_URL="$1"  # The original input URL
    
    # Remove surrounding quotes, if present
    REPO_URL=$(echo "$REPO_URL" | sed 's/^"//; s/"$//')

    # If the URL starts with https://, replace it with the SSH format
    if [[ "$REPO_URL" == https://* ]]; then
        REPO_URL=$(echo "$REPO_URL" | sed -e 's|https://github.com/|git@github.com:|' -e 's|/$||')
        REPO_URL="${REPO_URL}.git"
    fi

    # Extract the repository name from the modified URL
    REPO_NAME=$(basename -s .git "$REPO_URL")

    # Check if the directory already exists
    if [ -d "$REPO_NAME" ]; then
        echo "Repository '$REPO_NAME' already exists in the current directory."
    else
        echo "Cloning repository '$REPO_NAME' from $REPO_URL..."
        git clone "$REPO_URL"
        if [ $? -eq 0 ]; then
            echo "Repository cloned successfully."
        else
            echo "Failed to clone repository."
        fi
    fi
}

# Check whether input is from a file or stdin (pipe)
if [ -t 0 ]; then
    # If input is from a file
    if [ -z "$1" ]; then
        echo "Usage: $0 <file_with_repo_urls> or use with a pipe (e.g., cat file.txt | $0)"
        exit 1
    fi

    FILE="$1"

    # Check if the file exists
    if [ ! -f "$FILE" ]; then
        echo "File '$FILE' not found!"
        exit 1
    fi

    # Read the file line by line
    while IFS= read -r REPO_URL; do
        # Skip empty lines or lines that start with #
        if [[ -z "$REPO_URL" || "$REPO_URL" == \#* ]]; then
            continue
        fi
        clone_repo "$REPO_URL"
    done < "$FILE"
else
    # If input is from stdin (piped)
    while IFS= read -r REPO_URL; do
        # Skip empty lines or lines that start with #
        if [[ -z "$REPO_URL" || "$REPO_URL" == \#* ]]; then
            continue
        fi
        clone_repo "$REPO_URL"
    done
fi

