@echo off
REM setup-devcontainer.bat - Create .devcontainer setup with dotfiles

echo Setting up DevContainer environment...

REM Create directory if it doesn't exist
if not exist .devcontainer mkdir .devcontainer

REM Clone or update dotfiles repository
if not exist .devcontainer\dotfiles (
    echo Cloning dotfiles repository...
    git clone --depth 1 https://github.com/yourusername/dotfiles.git .devcontainer\dotfiles
) else (
    echo Updating dotfiles repository...
    cd .devcontainer\dotfiles
    git pull
    cd ..\..
)

REM Copy templates
echo Copying template files...
copy .devcontainer\dotfiles\templates\Dockerfile .devcontainer\Dockerfile
copy .devcontainer\dotfiles\templates\devcontainer.json .devcontainer\devcontainer.json

echo DevContainer setup complete.
echo You can now open this folder in VS Code and use 'Reopen in Container'.
