#!/bin/zsh

echo "Configuring some sensible defaults for Mac..."

# Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock showrecents -bool false
defaults write com.apple.dock largesize -int 90
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock mineffect -string "genie"
defaults write com.apple.dock minimize-to-application -bool true
# removes all apps from dock so you can pin your own
defaults delete com.apple.dock persistent-apps

# Control Strip (ordered LtR)
defaults write com.apple.controlstrip FullCustomized -array "com.apple.system.screen-lock" "com.apple.system.show-desktop" "com.apple.system.screencapture" "com.apple.system.group.keyboard-brightness" "com.apple.system.group.brightness" "com.apple.system.group.media" "com.apple.system.group.volume"

# Finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true

# Trackpad
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write "Apple Global Domain" com.apple.swipescrolldirection -bool false

# Keyboard
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Use 24-hour time
defaults write NSGlobalDomain AppleICUForce24HourTime -bool true

# Language
defaults write NSGlobalDomain AppleLanguages -array "en-CA" "zh-Hant-CA" # still have to set up keyboard, but that's eaiser in the GUI
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticTextCompletionEnabled -bool false

# Ads
defaults write com.apple.AdLib allowApplePersonalizedAdvertising -bool false
defaults write com.apple.AdLib allowIdentifierForAdvertising -bool false

echo "Resarting Dock and Finder. You may need to restart your computer for the rest of the configurations to take effect."
killall Dock
killall Finder
