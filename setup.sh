#!/bin/sh

# Assumptions: macOS, zsh as default shell

echo "===^._.^=== SET UP YOUR COMPUTER\n"

# Install xcode
echo "=== Installing Xcode CLI tools..."

if test ! $(which xcode-select); then
  xcode-select --install
  echo "    done."
else
  echo "    already installed."
fi

# Install homebrew
echo "=== Installing Homebrew..."

if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"  
  echo "    done."
else
  echo "    already installed."
fi

# Install ohmyzsh
echo "=== Installing Oh My Zsh..."

if test ! $(which omz); then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  echo "    done."
else
  echo "    already installed."
fi

# Install zsh plugins
echo "=== Installing zsh plugins"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm

# Symlink dotfiles
FILES=(".zshrc" ".vimrc" ".mackup.cfg")
DOTFILES=~/fluffy-octo-robot/dotfiles
OLD_DOTFILES=~/dotfiles_old

echo "=== Backing up old dotfiles and creating symlinks for new ones"

mkdir $OLD_DOTFILES

for file in $FILES; do
  echo "    $file... "
  mv ~/$file $OLD_DOTFILES/
  ln -s $DOTFILES/$file ~/$file
  echo "    done."
done

# Install brew packages
echo "=== Installing brew packages..."
brew bundle --file ./dotfiles/Brewfile --no-lock
echo "  done."

# Install gvm
brew install go # uninstall after gvm is installed
zsh < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
source "~/.gvm/scripts/gvm"
gvm install go1.17.6
gvm use go1.17.6 --default
brew uninstall go

# Load app configs from mackup
mackup restore

# Configure mac defaults
if [[ "$1" == "mac" ]]; then
  echo "=== Confguring mac defaults"
  source dotfiles/.macos
fi
