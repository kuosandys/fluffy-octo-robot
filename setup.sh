#!/bin/sh

# Assumptions: macOS, zsh as default shell

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
DOTFILES="$SCRIPT_DIR/dotfiles"
OLD_DOTFILES_DIR="$HOME/dotfiles_old"
DOTFILE_ITEMS=".zshrc .vimrc .gitconfig .config .warp"
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"

echo "===^._.^=== SET UP YOUR COMPUTER"
echo ""

# Install Xcode CLI tools
echo "=== Installing Xcode CLI tools..."
if ! xcode-select -p >/dev/null 2>&1; then
  xcode-select --install
  echo "    Xcode CLI tools installation triggered."
else
  echo "    already installed."
fi

# Install Homebrew
echo "=== Installing Homebrew..."
if ! command -v brew >/dev/null 2>&1; then
  if [ -x "/opt/homebrew/bin/brew" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [ -x "/usr/local/bin/brew" ]; then
    eval "$(/usr/local/bin/brew shellenv)"
  else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    if [ -x "/opt/homebrew/bin/brew" ]; then
      eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [ -x "/usr/local/bin/brew" ]; then
      eval "$(/usr/local/bin/brew shellenv)"
    fi
  fi
fi

# Install zinit (zsh plugin manager)
echo "=== Installing zinit..."
if [ -d "$ZINIT_HOME/.git" ]; then
  echo "    already installed."
else
  mkdir -p "$(dirname "$ZINIT_HOME")"
  if git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"; then
    echo "    installed."
  else
    echo "    zinit installation failed."
  fi
fi

if command -v brew >/dev/null 2>&1; then
  echo "    already installed."
else
  echo "    Homebrew installation skipped or failed."
fi

# Install brew packages (only if Homebrew is installed)
echo "=== Installing brew packages..."
if command -v brew >/dev/null 2>&1; then
  if [ -f "$DOTFILES/Brewfile" ]; then
    brew bundle --file="$DOTFILES/Brewfile" --no-lock
    echo "    done."
  else
    echo "    Brewfile not found."
  fi
else
  echo "    Homebrew is not installed. Skipping brew packages."
fi

# Symlink dotfiles and back up pre-existing files
echo "=== Symlinking dotfiles..."
for item in $DOTFILE_ITEMS; do
  target="$HOME/$item"
  source_file="$DOTFILES/$item"

  # Skip if item does not exist in dotfiles repository
  if [ ! -e "$source_file" ] && [ ! -L "$source_file" ]; then
    continue
  fi

  # Handle existing target in $HOME
  if [ -e "$target" ] || [ -L "$target" ]; then
    if [ -L "$target" ]; then
      link_dest="$(readlink "$target" 2>/dev/null || true)"
      if [ "$link_dest" = "$source_file" ]; then
        echo "    $item: already linked."
        continue
      else
        echo "    $item: removing obsolete symlink..."
        rm -rf "$target"
      fi
    else
      # Real file/directory exists - create backup directory on-demand and move existing item
      mkdir -p "$OLD_DOTFILES_DIR"
      echo "    $item: backing up existing file to $OLD_DOTFILES_DIR..."
      mv "$target" "$OLD_DOTFILES_DIR/"
    fi
  fi

  echo "    $item: linking..."
  mkdir -p "$(dirname "$target")"
  ln -sfn "$source_file" "$target"
done


# Configure mac defaults
if [ "$1" = "mac" ] || [ "$1" = "MAC" ]; then
  echo "=== Configuring mac defaults..."
  if [ -f "$DOTFILES/.macos" ]; then
    . "$DOTFILES/.macos"
    echo "    done."
  fi
fi

