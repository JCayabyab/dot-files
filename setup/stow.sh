# Function to display commands
exe() { echo "$ $@" ; "$@" ; }

echo "Removing default files..."
exe rm ~/.bashrc
exe rm ~/.zshrc

pushd stow-targets
echo "Stowing settings..."
exe stow -t ~ stow
exe stow -t ~ nvim
exe stow -t ~ zsh
popd

echo "Reloading settings..."
exe source ~/.zprofile
exe source ~/.zshrc
