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
antigen bundle compleat
antigen bundle git-extras
antigen bundle npm
antigen bundle 1password
antigen bundle sudo
antigen bundle dirhistory
antigen bundle jsontools
antigen bundle macos
# antigen bundle common-aliases -- currently a bug with installing node versions with nvm

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search ./zsh-history-substring-search.zsh
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle djui/alias-tips

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
 git checkout "$(git branch --all | fzf | tr -d '[:space:]')"
}

# remove all local branches that have been merged remotely
gitcleanmerged() {
  # not sure why vim doesn't work with plugins, bypassing vimrc
  git fetch -p ; git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' >/tmp/merged-branches && vim -u NONE /tmp/merged-branches && xargs git branch -D </tmp/merged-branches && rm /tmp/merged-branches
}

alias gclmg="gitcleanmerged"

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

