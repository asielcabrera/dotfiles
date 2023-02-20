#!/bin/bash

echo "Installing dotfiles"

# Check that all of our submodules work has been published before pushing the superproject
echo "Initializing submodule(s)"
git submodule update --init --recursive

source install/link.sh

if [ "$(uname)" == "Darwin" ]; then
    echo "Running on OSX"

    echo "Brewing all the things"
    source install/brew.sh
    
    echo "Updating OSX settings"
    source install/osx.sh
fi


# tpm https://github.com/tmux-plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins


echo "creating vim directories"
mkdir -p ~/.vim-tmp


echo "Configuring Fish as default shell"
sudo bash -c 'echo $(which fish) >> /etc/shells'
chsh -s $(which fish)

echo "Done."
