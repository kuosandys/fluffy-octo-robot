# fluffy octo robot (dotfiles)

## What's this?

Some scripts and config files useful for seting up a new macOS computer quickly with my preferences.

## How do I run this?

0. Install any macOS updates.
1. Configure a new SSH key for GitHub so you can clone this repo. Run `curl -s https://raw.githubusercontent.com/kuosandys/fluffy-octo-robot/main/ssh.sh | zsh -s <EMAIL>` replacing `<EMAIL>`.
2. Clone this repo into the home directory (see note) and run `zshsetup.sh <CONFIGURE_MAC>` from the root directory of the repo. Replace `<CONFIGURE_MAC>` with a non-empty string if you want to configure mac with the preferences specified in `dotfiles/.macos`.

(Note: If you want to clone this repo to another directory, remember to adjust the `DOTFILES` variable in `setup.sh`.)

## What remains to be done?

- [ ] Additional mac configurations (TODO: add to `.macos`)
  - [ ] Display: set text size to large, turn off auto-adjust brightness, turn on night shift
  - [ ] Spotlight: set search items to Applications and System Preferences
  - [ ] Keyboard: add additional Input languages
  - [ ] Configure menu bar, control panel, widgets
  - [ ] Customize Finder sidebar: add home directory, remove tags
- [ ] Launch Rectangle: configure shortcuts and launch app at login
- [ ] Launch Obsidian (you may need to re-install some plugins)
- [ ] Sign in
  - [ ] 1Password
  - [ ] VSCode
  - [ ] Mail
  - [ ] Calendar
- [ ] Customize browsers (if not using sync)
  - [ ] Preferences
  - [ ] Extensions
    - [ ] 1Password
    - [ ] Dark Reader
    - [ ] uBlock Origin
- [ ] Choose a desktop background

## What's a fluffy octo robot?

No clue. Ask the octocat.
