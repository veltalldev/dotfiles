# My Dev Container Dotfiles

A personal collection of configuration files for consistent development environments across projects.

## Overview

This repository contains my preferred configuration files and setup scripts for containerized development environments. It's designed to work with VS Code's Dev Containers feature to ensure consistent Git and shell configurations across all my projects.

## Contents

- `.gitconfig` - Git configuration with sensible defaults and my personal identity
- `.bashrc` - Bash shell customizations and aliases
- `setup-devcontainer.sh` - Script to set up a new project with these configurations
- `setup-devcontainer.bat` - Same setup script for Windows environment
- `templates/` - Template files for Dev Containers

## How to Use

### Quick Setup

To set up a new project with these configurations:

```bash
# Run from the root of any new project
curl -s https://raw.githubusercontent.com/veltalldev/dotfiles/main/setup-devcontainer.sh | bash
```

OR clone and run `setup-devcontainer.bat` on Windows. Make sure Git is installed and available in your Windows PATH.

### Manual Setup

1. Create a `.devcontainer` directory in your project
2. Clone this repository into that directory
3. Copy the template files to the parent directory
4. Open the project in VS Code and select "Reopen in Container"

```bash
mkdir -p .devcontainer
git clone https://github.com/veltalldev/dotfiles.git .devcontainer/dotfiles
cp .devcontainer/dotfiles/templates/* .devcontainer/
```

## Customization
Feel free to modify any of these files directly in this repository. Changes will be applied to new projects or when rebuilding containers.

## Why This Exists
I created this repository to:

- Keep consistent Git and shell configurations across projects
- Avoid repetitive setup for new development environments
- Have a single source of truth for my preferred development settings, which evolve over time

# Notes to Future Self

Remember to update this repository when you make configuration changes you want to keep
The `.gitconfig` already contains your preferred settings and safe directory configurations
The `.bashrc` sets the default shell to bash and includes helpful aliases
