# fluffy octo robot (dotfiles)

## What's this?

Some scripts and config files useful for setting up a new mac quickly with my apps and preferences

## How do I run this?

0. Install any macOS updates.
1. Configure a new SSH key for GitHub so you can clone this repo. Run `curl -s https://raw.githubusercontent.com/kuosandys/fluffy-octo-robot/main/ssh.sh | zsh -s <EMAIL>` replacing `<EMAIL>`.
2. Clone this repo into the home directory (see note) and run `setup.sh <MAC>` from the root directory of the repo. Replace `<MAC>` with `mac` if you want to configure mac with the preferences specified in `dotfiles/.macos`.
3. Set up GitHub commit signing key.

(Note: If you want to clone this repo to another directory, remember to adjust the `DOTFILES` variable in `setup.sh`.)

## What's a fluffy octo robot?

No clue. Ask the octocat.
