#!/bin/bash

# Directory where your dotfiles are stored (adjust as necessary)
DOTFILES_DIR="$HOME/projects/dotfiles"

# List of dotfiles and their locations in the home directory
declare -A DOTFILES=(
    [".zshrc"]="$HOME/.zshrc"
    [".config/nvim/init.lua"]="$HOME/.config/nvim/init.lua"
    [".tmux.conf"]="$HOME/.tmux.conf"
)

# Function to create symlinks
create_symlink() {
    local source=$1
    local dest=$2

    if [[ -e $dest || -L $dest ]]; then
        echo "Removing existing symlink or file at $dest"
        rm -rf $dest
    fi

    echo "Creating symlink: $source -> $dest"
    ln -s $source $dest
}

# Create symlinks for each dotfile
for file in "${!DOTFILES[@]}"; do
    source_file="$DOTFILES_DIR/$file"
    dest_file="${DOTFILES[$file]}"
    
    if [[ ! -e $source_file ]]; then
        echo "Source file $source_file does not exist. Skipping..."
        continue
    fi

    create_symlink "$source_file" "$dest_file"
done

echo "Dotfiles symlinking complete!"

