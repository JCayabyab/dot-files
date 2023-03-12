# Mostly from https://github.com/shakeelmohamed/stow-dotfiles/blob/master/setup.sh

# MacOS System
echo "Removing Message of the day prompt..."
echo "> touch $HOME/.hushlogin"
touch $HOME/.hushlogin

echo "Showing hidden files in Finder..."
echo "> defaults write com.apple.finder AppleShowAllFiles YES"
defaults write com.apple.finder AppleShowAllFiles YES

echo "Enable key-repeating globally"
echo "defaults write -g ApplePressAndHoldEnabled -bool false"
defaults write -g ApplePressAndHoldEnabled -bool false

echo "Installing command line tools if not installed already"
echo "> xcode-select --install"
xcode-select --install

echo "Disabling mouse acceleration..."
echo "> defaults write .GlobalPreferences com.apple.mouse.scaling -1"
defaults write .GlobalPreferences com.apple.mouse.scaling -1

# TODO: This hijacks the shell and doesn't let rest of script complete - find way to automate
# Install brew
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Installing all homebrew packages..."
for PACKAGE in $(cat brew.txt); do
    echo "Installing $PACKAGE..."
    brew install --quiet $PACKAGE
done


echo "Installing all homebrew casks..."
for PACKAGE in $(cat cask.txt); do
    echo "Installing $PACKAGE..."
    brew install --quiet $PACKAGE
done

echo "Removing default files..."
echo "> rm ~/.bashrc"
rm ~/.bashrc
echo "> rm ~/.zshrc"
rm ~/.zshrc

echo "Stowing settings..."
echo "> stow -t ~ stow"
stow -t ~ stow
echo "> stow -t ~ nvim"
stow -t ~ nvim
echo "> stow -t ~ zsh"
stow -t ~ zsh

echo "Reloading settings..."
echo "> source ~/.zprofile"
source ~/.zprofile
echo "> source ~/.zshrc"
source ~/.zshrc

echo "-- Vim Setup --"

echo "Installing VimPlug..."
echo "> sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "Installing plugins in Vim..."
echo "> vim +PlugInstall +qall"
vim +PlugInstall +qall

echo "-- NVM Setup --"
echo "> nvm install --lts"
nvm install --lts
echo "nvm use --lts"
nvm use --lts
echo "nvm alias default 'lts/*'"
nvm alias default 'lts/*'

echo "-- Python Setup --"
echo "Setting up Anaconda..."
echo "> conda update conda"
conda update conda
echo "> conda init zsh"
conda init zsh

echo "-- Git / GitHub Setup --"
echo "> gh auth login"
gh auth login
echo "> gh auth setup-git"
gh auth setup-git

# Use current branch only when doing git push
git config --global push.default current
# Rebase when pulling instead of merging
git config --global pull.rebase true


DEFAULT_NAME="Jofred Cayabyab"
DEFAULT_EMAIL="jofred.cayabyab1@ucalgary.ca"

read -p "Enter your Git name [${DEFAULT_NAME}]: " GIT_SETUP_NAME
GIT_SETUP_NAME=${GIT_SETUP_NAME:-$DEFAULT_NAME}

read -p "Enter your Git email [${DEFAULT_EMAIL}]: " GIT_SETUP_EMAIL
GIT_SETUP_EMAIL=${GIT_SETUP_EMAIL:-$DEFAULT_EMAIL}

git config --global user.name "$GIT_SETUP_NAME" --replace-all
git config --global user.email "$GIT_SETUP_EMAIL" --replace-all

echo "Done! Restart your Mac to ensure that all settings are enabled properly."