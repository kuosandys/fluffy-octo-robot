#!/bin/zsh

# ensure Apple CLI tools are installed
if ! command -v xcode-select >/dev/null; then
  echo "Installing Xcode CLI tools..."
  xcode-select --install
else
  echo "Xcode CLI tools are already installed."
fi

# ensure brew is installed
if ! command -v brew >/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
  echo "Homebrew is already installed."
fi

# ensure ansible is installed
if ! command -v ansible >/dev/null; then
  echo "Installing Ansible..."
  brew install ansible
else
  echo "Ansible is already installed."
fi

# run ansible playbook
echo "Running Ansible playbook..."
ansible-playbook playbook.yml -i inventory
