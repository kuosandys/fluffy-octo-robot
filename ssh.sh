#!/bin/sh

echo "===^._.^=== SSH KEY FOR GITHUB"

ssh-keygen -t ed25519 -C "$1"

eval "$(ssh-agent -s)"

if [[ ! -e ~/.ssh/config ]]; then
  touch ~/.ssh/config
fi

echo "Host github.com\n  AddKeysToAgent yes\n  UseKeychain yes\n  IdentityFile ~/.ssh/id_ed25519" >> ~/.ssh/config

ssh-add --apple-use-keychain ~/.ssh/id_ed25519

pbcopy < ~/.ssh/id_ed25519.pub

echo "SSH key generated; public key copied to clipboard."
echo "Add the new key to GitHub > Settings > Access > SSH and GPG keys"

printf "Type 'done' to continue: "
while read line; do
  if [[ "$line" == "done" ]]; then
    break
  else
    printf "Type 'done' to continue: "
  fi
done

echo "Testing SSH connection..."

# Test SSH connection
ssh -T git@github.com

