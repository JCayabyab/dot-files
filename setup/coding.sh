# Function to display commands
exe() { echo "$ $@" ; "$@" ; }

echo "-- Vim Setup --"

echo "Installing VimPlug..."
exe sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "Installing plugins in Vim..."
exe vim +PlugInstall +qall

echo "-- NVM Setup --"
exe nvm install --lts
exe nvm use --lts
exe nvm alias default 'lts/*'

echo "-- Python Setup --"
echo "Setting up Anaconda..."
exe conda update conda
exe conda init zsh
