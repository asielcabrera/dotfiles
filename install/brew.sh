#!/bin/bash

# Verifica si Homebrew está instalado
if ! command -v brew &> /dev/null; then
    echo "Homebrew no está instalado. Instalando Homebrew..."
    # Instala Homebrew en el sistema
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew ya está instalado."
fi

echo "Installing homebrew packages..."


brew tap epk/epk
brew install --cask font-sf-mono-nerd-font

# Homebrew Packages
brew install ack
brew install --cask alacritty
brew install bat
brew install exa
brew install fish
brew install fisher
brew install fnm
brew install fzf
brew install gh
brew install git
brew install git-delta
brew install go
brew install highlight
brew install lazydocker
brew install lazygit
brew install lf
brew install lsd
brew install markdown
brew install neovim
brew install node
brew install --cask raycast
brew install starship
brew install tmux
brew install tree
brew install wget
brew install z
brew install zoxide


brew install trash-cli
brew install koekeishiya/formulae/skhd
brew services restart skhd
brew install koekeishiya/formulae/yabai
brew services restart yabai

exit 0
