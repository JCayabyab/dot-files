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

# Lido specific
findandkill_lido() {
  port=$(lsof -n -i4TCP:3000 | grep LISTEN | awk '{ print $2 }')
  kill -9 $port
  port=$(lsof -n -i4TCP:4000 | grep LISTEN | awk '{ print $2 }')
  kill -9 $port
  port=$(lsof -n -i4TCP:3010 | grep LISTEN | awk '{ print $2 }')
  kill -9 $port
  port=$(lsof -n -i4TCP:3011 | grep LISTEN | awk '{ print $2 }')
  kill -9 $port
}

dryrun_proddeploy() {
  curr_pwd=$PWD

  cd /Users/jofred/Coding/Lido/lido-app
  curr_branch=$(git rev-parse --abbrev-ref HEAD)
  STAGINGSHA=$(../lido-tools/kube/get-shas staging | grep lido-app | sed 's/lido-app://')
  PRODUCTIONSHA=$(../lido-tools/kube/get-shas production | grep lido-app | sed 's/lido-app://') 
  echo $STAGINGSHA
  echo $PRODUCTIONSHA

  stash_output=$(git stash 2>&1)

  git checkout staging
  git fetch origin
  git diff --name-only $PRODUCTIONSHA $STAGINGSHA | grep server/src/db/migrations
  echo "If the output is empty, there are no DB migrations. Double-check the SHAs on GitHub then run proddeploy"

  git checkout $curr_branch

  if [[ $stash_output != *"No local changes to save"* ]]; then
    git stash pop
  fi

  cd $curr_pwd
}

proddeploy() {
  read "REPLY?Did you mean to start a prod deploy? Type Y to continue: "


  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    curr_pwd=$PWD

    echo "Starting prod deploy..."
    cd /Users/jofred/Coding/Lido/lido-app
    STAGINGSHA=$(../lido-tools/kube/get-shas staging | grep lido-app | sed 's/lido-app://')
    PRODUCTIONSHA=$(../lido-tools/kube/get-shas production | grep lido-app | sed 's/lido-app://') 
    echo $STAGINGSHA
    echo $PRODUCTIONSHA

    stash_output=$(git stash 2>&1)
    git checkout staging
    git fetch origin
    git diff --name-only $PRODUCTIONSHA $STAGINGSHA | grep server/src/db/migrations

    git checkout production
    git fetch origin
    git reset $STAGINGSHA --hard
    git push -f

    echo "Double check the SHAs on GitHub. Then, wait for prod deploy to finish and run \"watch kubectl get pods --context production\" to check executor pods"

    git checkout $curr_branch
    if [[ $stash_output != *"No local changes to save"* ]]; then
      git stash pop
    fi
    cd $curr_pwd
  else
    echo "Prod deploy canceled."
  fi
}

alias lidopd=proddeploy
alias lidodrpd=dryrun_proddeploy

alias killlido=findandkill_lido

# fuzzy search git checkout
gch() {
 git checkout "$(git branch --all | fzf | tr -d '[:space:]')"
}

# remove all local branches that have been merged remotely
gitcleanmerged() {
    git fetch -p
    git branch -vv | awk '/\[origin\/.*: gone\]/{print $1}' > /tmp/merged-branches
    vim -u NONE /tmp/merged-branches
    while read branch; do
        git branch -D "$branch"
    done < /tmp/merged-branches
    rm /tmp/merged-branches
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


# pnpm
export PNPM_HOME="/Users/jofred/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# sed
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
# gcloud auth
export PATH=$PATH:/opt/homebrew/share/google-cloud-sdk/bin
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
