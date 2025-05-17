#!/bin/bash

ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}

declare -A plugins
plugins=(
  [zsh-autosuggestions]="https://github.com/zsh-users/zsh-autosuggestions"
  [zsh-syntax-highlighting]="https://github.com/zsh-users/zsh-syntax-highlighting"
)

for plugin in "${!plugins[@]}"; do
  plugin_dir="$ZSH_CUSTOM/plugins/$plugin"
  plugin_repo="${plugins[$plugin]}"

  if [ -d "$plugin_dir" ]; then
    echo "$plugin is already installed at $plugin_dir"
  else
    echo "Installing $plugin..."
    git clone "$plugin_repo" "$plugin_dir"
    echo "$plugin installed."
  fi
done

echo
echo "Done!"

