#!/bin/bash
# setup-devcontainer.sh - Create .devcontainer setup with dotfiles

# Create directory if it doesn't exist
mkdir -p .devcontainer

# Clone dotfiles if not already present
if [ ! -d ".devcontainer/dotfiles" ]; then
  echo "Cloning dotfiles repository..."
  git clone --depth 1 https://github.com/veltalldev/dotfiles.git .devcontainer/dotfiles
else
  echo "Updating dotfiles repository..."
  (cd .devcontainer/dotfiles && git pull)
fi

# Copy templates
cp .devcontainer/dotfiles/templates/Dockerfile .devcontainer/
cp .devcontainer/dotfiles/templates/devcontainer.json .devcontainer/
cp .devcontainer/dotfiles/templates/requirements.txt .

echo "DevContainer setup complete."
echo "You can now open this folder in VS Code and use 'Reopen in Container'."
