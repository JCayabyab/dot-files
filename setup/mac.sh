echo "-- MacOS Setup --"

echo "Removing Message of the day prompt..."
echo "> touch $HOME/.hushlogin"
touch $HOME/.hushlogin

echo "Installing command line tools if not installed already..."
echo "> xcode-select --install"
xcode-select --install

echo "Showing hidden files in Finder..."
echo "> defaults write com.apple.finder AppleShowAllFiles YES"
defaults write com.apple.finder AppleShowAllFiles YES

echo "Enable key-repeating globally"
echo "defaults write -g ApplePressAndHoldEnabled -bool false"
defaults write -g ApplePressAndHoldEnabled -bool false

echo "Disabling mouse acceleration..."
echo "> defaults write .GlobalPreferences com.apple.mouse.scaling -1"
defaults write .GlobalPreferences com.apple.mouse.scaling -1
