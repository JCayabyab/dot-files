export PATH=$HOME/bin:/usr/local/bin:$PATH
export NVM_LAZY_LOAD=true

export EDITOR=$(which vim)

 # added for npm-completion https://github.com/Jephuff/npm-bash-completion
PATH_TO_NPM_COMPLETION="/home/jcayabyab/.nvm/versions/node/v10.16.3/lib/node_modules/npm-completion"
source $PATH_TO_NPM_COMPLETION/npm-completion.sh

source <(antibody init)
antibody bundle < ~/.zsh_plugins.txt

export TERM=xterm-256color

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"

# nvm use v10.16.3

