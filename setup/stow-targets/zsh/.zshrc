# antigen
source $(brew --prefix)/share/antigen/antigen.zsh

# oh-my-zsh
antigen use oh-my-zsh

# oh-my-zsh plugins
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle aws
antigen bundle command-not-found
antigen bundle autojump
# antigen bundle common-aliases -- currently a bug with installing node versions with nvm
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

# NVM
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
export PATH="/usr/local/opt/terraform@0.11/bin:$PATH"
 [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# Misc
alias resource="source ~/.zshrc"
alias zshrc="vim ~/.zshrc"

# Killing everything running on a port
findandkill() { 
  port=$(lsof -n -i4TCP:$1 | grep LISTEN | awk '{ print $2 }')
  kill -9 $port
}
alias killport=findandkill

# fuzzy search git checkout
gch() {
 git checkout “$(git branch — all | fzf| tr -d ‘[:space:]’)”
}

# Starship terminal
eval "$(starship init zsh)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

