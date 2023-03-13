echo "Removing default files..."
echo "> rm ~/.bashrc"
rm ~/.bashrc
echo "> rm ~/.zshrc"
rm ~/.zshrc

pushd stow-targets
echo "Stowing settings..."
echo "> stow -t ~ stow"
stow -t ~ stow
echo "> stow -t ~ nvim"
stow -t ~ nvim
echo "> stow -t ~ zsh"
stow -t ~ zsh
popd

echo "Reloading settings..."
echo "> source ~/.zprofile"
source ~/.zprofile
echo "> source ~/.zshrc"
source ~/.zshrc
