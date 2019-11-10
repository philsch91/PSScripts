#!/bin/bash

# ignore-macos-softwareupdate.sh
# sudo softwareupdate --reset-ignored

sudo softwareupdate --ignore "macOS Catalina"
#defaults write com.apple.systempreferences AttentionPrefBundleIDs 0
