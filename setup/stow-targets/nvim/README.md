# Required setup:

## Install Neovim

```bash
brew install nvim
```

## Install VimPlug

```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Then run `:PlugInstall`