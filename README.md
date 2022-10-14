# Setting up a new computer

## What's this?

Some scripts and an ansible playbook to set up a new mac laptop quickly with the minimum basics. This is currently meant to be run on a new computer, so ymmv for running it on a laptop with existing configurations.

## How do I run this?

0. Clone this repo.
1. Run `chmod u+x ./install.sh` to give exec permissions to the current user for the installation script file.
2. Execute `./install.sh`.
3. Restart your computer - this is necessary for some of the system configurations to take effect.

## What gets set up?

The installation script installs Apple CLI tools, `brew`, and `ansible` with `brew`. For a complete list of apps and utilities that get installed with `brew`, please see the lists in `playbook.yml`.

Node and Go are managed with `nvm` and `gvm` respectively. Note that we use `brew` to install Go initially in order to run `gvm`, and it is then subsequently removed after installing `gvm` and a newer version of Go.

Some configurations for preferences are also made - e.g. key repeat speed, scroll direction, 24-hour time etc. This is obviously highly opinionated. For more details on what is being configured, please see `./scripts/configure-mac.sh`.

## What remains to be done?

- [ ] GitHub SSH
- [ ] Configure each app with the appropriate licenses and accounts
  - [ ] Goland
  - [ ] Typora
- [ ] Sign in to accounts
  - [ ] VSCode
  - [ ] Mail
- [ ] Pin the desired applications in Dock
- [ ] Configure other settings for mac
  - [ ] Reorder control strip
  - [ ] Add language keyboards
  - [ ] Remove everything from Spotlight settings except for Applications and System Preferences
- [ ] Install Logitech Options+
- [ ] Customize browsers
  - [ ] preferences
  - [ ] extensions
    - [ ] raindrop.io
    - [ ] 1Password
    - [ ] dark reader
    - [ ] uBlock Origin
- [ ] Customize Finder
  - [ ] Add home directory to sidebar
  - [ ] Remove tags from sidebar
- [ ] Customize iTerm2
  - [ ] Change cursor to vertical bar
  - [ ] Change font to MesloLGS NF, font size to 13
  - [ ] Configure keyboard shortcuts for iTerm2
    - [ ] Keys: set left Option key to act as Esc+
    - [ ] Key mappings:
      - [ ] Option + <- to Send escape sequence b
      - [ ] Option + -> to Send escape sequence f
  - [ ] Set working directory for profile to reuse previous session's directory
- Choose a desktop background
