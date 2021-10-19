#!/bin/bash
set -e
shopt -s dotglob

################
# For macOS, don't forget to run: brew install coreutils
################

dotfilesDir=$(dirname $(dirname $(realpath $0)))
homeDir=$(realpath ~)
vimfilesDir=$homeDir/vimfiles

# Wrapper for cp to work in macOS.
cp() {
    if [ -x "$(command -v gcp)" ]; then
        command=gcp
    else
        command=cp
    fi
    command $command "$@"
}

read -p "Install the dotfiles? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    cd $dotfilesDir
    # Copy all files here to the current user's home directory; backup any existing files.
    cp -rv --backup=numbered * $homeDir
    # Do the same, but with the dist folder's contents.
    cp -rv --backup=numbered .dotfiles.dist/* $homeDir
fi
