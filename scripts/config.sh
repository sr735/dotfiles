#!/bin/sh

# config.sh
# Author: Soham Roy
# sr735@cornell.edu

# Instructions:
# To Run, execute:
# curl -L https://raw.githubusercontent.com/sr735/dotfiles/master/config.sh | sh

###############################################################################
# Homebrew
###############################################################################
echo "Installing Homebrew..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Updating Homebrew..."
brew doctor
brew update


###############################################################################
# Scripts
###############################################################################
echo "Installing terminal utilities..." 
sh ./scripts/utilities.sh

echo "Installing applications/utilities/tools..."
sh ./scripts/casks.sh

echo "Installing Fonts..."
sh ./scripts/fonts.sh

echo "Cleaning up..."
brew cleanup


###############################################################################
# Oh-My-Zsh + Plugins
###############################################################################
echo "Installing oh-my-zsh..."
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

cd ~/.oh-my-zsh/custom/plugins
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git


###############################################################################
# Configure macOS
###############################################################################
cecho "Configuring macOS..." $cyan
zsh ./scripts/osx.sh


###############################################################################
# Kill affected applications
###############################################################################
cecho "Done!" $cyan
cecho "################################################################################" $white
cecho "Note that some of these changes require a logout/restart to take effect." $red
cecho "Killing some open applications in order to take effect." $red

find ~/Library/Application\ Support/Dock -name "*.db" -maxdepth 1 -delete
for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
  "Dock" "Finder" "Mail" "Messages" "Safari" "SystemUIServer" \
  "Transmission"; do
  killall "${app}" > /dev/null 2>&1
done

