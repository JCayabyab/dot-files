# Function to display commands
exe() { echo "$ $@" ; "$@" ; }

echo "-- MacOS Setup --"

echo "Removing Message of the day prompt..."
exe touch $HOME/.hushlogin

echo "Installing command line tools if not installed already..."
exe xcode-select --install

echo "Fixing key-repeating..."
exe defaults write NSGlobalDomain "ApplePressAndHoldEnabled" -bool "false" 
exe defaults write -g InitialKeyRepeat -int 10
exe defaults write -g KeyRepeat -int 2

echo "Fixing screenshots..."
exe defaults write com.apple.screencapture "disable-shadow" -bool "true" 
exe mkdir -p ~/Pictures/screenshots
exe defaults write com.apple.screencapture "location" -string "~/Pictures/screenshots"
killall SystemUIServer

echo "Fixing Finder..."
exe defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"
exe defaults write com.apple.finder "QuitMenuItem" -bool "true"
exe defaults write com.apple.finder "AppleShowAllFiles" -bool "true"
exe defaults write com.apple.finder "ShowPathbar" -bool "true"
# Change default view to List view
exe defaults write com.apple.finder "FXPreferredViewStyle" -string "Nlsv"
# Put folders first in views
exe defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true"
# Change search scope to current folder
exe defaults write com.apple.finder "FXDefaultSearchScope" -string "SCcf"
exe defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "false"
exe defaults write NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud" -bool "false"
killall Finder

echo "Fixing Dock..."
exe defaults write com.apple.dock "enable-spring-load-actions-on-all-items" -bool "true"
exe defaults write com.apple.dock "autohide" -bool "true"
killall Dock

echo "Disabling mouse acceleration..."
exe defaults write .GlobalPreferences com.apple.mouse.scaling -1
