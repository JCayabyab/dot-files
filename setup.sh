# Mostly from https://github.com/shakeelmohamed/stow-dotfiles/blob/master/setup.sh

# MacOS System
# Remove Message of the day prompt
touch $HOME/.hushlogin

# Show hidden files in finder
defaults write com.apple.finder AppleShowAllFiles YES

# Disable mouse acceleration
defaults write .GlobalPreferences com.apple.mouse.scaling -1

# TODO: these both hijack the shell session and don't let the rest of this file complete
# Install zsh
#sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# Install brew
#/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# setup GH token here
# https://github.com/settings/tokens/new?scopes=gist,public_repo&description=Homebrew
#and then set the token as: export HOMEBREW_GITHUB_API_TOKEN="your_new_token"

# Install all homebrew packages
# TODO: use a brewfile https://github.com/ahmedelgabri/dotfiles/blob/master/homebrew/Brewfile
while IFS='' read -r line || [[ -n "$line" ]]; do
    brew install "$line"
done < "./brew.txt"

# Install all cask packages
while IFS='' read -r line || [[ -n "$line" ]]; do
    brew cask install "$line"
done < "./cask.txt"

# Remove default files
rm ~/.bashrc
rm ~/.zshrc

# Node setup
nvm install --lts
nvm use --lts
nvm alias default lts/*

# Stow ignore file first
stow -t ~ stow
# Stow rest of folders
stow -t ~ *