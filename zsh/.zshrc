# Starship terminal
eval "$(starship init zsh)"

# antigen
source /usr/local/share/antigen/antigen.zsh

# oh-my-zsh
antigen use oh-my-zsh

# oh-my-zsh plugins
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle aws
antigen bundle command-not-found
antigen bundle autojump
antigen bundle common-aliases
antigen bundle compleat
antigen bundle git-extras
antigen bundle npm

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search ./zsh-history-substring-search.zsh

antigen apply

# nvim
alias vim="nvim"
alias vimrc="vim ~/.vimrc"
# for the zshrc common-aliases command
export EDITOR="nvim"

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# NVM
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
export PATH="/usr/local/opt/terraform@0.11/bin:$PATH"
 [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
