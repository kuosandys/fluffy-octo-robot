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

- GitHub SSH
- configuring each app with the appropriate licenses and accounts
- pinning the desired applications in Dock
- configuring other settings for mac (e.g. language settings, keyboard settings, spotlight settings.. these are easier done from System Preferences than from `defaults`)
- configuring keyboard shortcuts for iTerm2
- choosing a desktop background
