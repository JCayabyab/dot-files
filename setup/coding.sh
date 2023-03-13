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
