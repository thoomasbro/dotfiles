#!/usr/bin/env bash

# Check for Homebrew
if ! hash brew 2>/dev/null; then
  echo "Installing Homebrew for you."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/thomasbrosset/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"

fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

brew bundle --file=brew/Brewfile

# Remove outdated versions from the cellar.
brew cleanup
