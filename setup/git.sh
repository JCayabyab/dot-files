echo "-- Git / GitHub Setup --"
echo "> gh auth login"
gh auth login
echo "> gh auth setup-git"
gh auth setup-git

# Use current branch only when doing git push
git config --global push.default current
# Rebase when pulling instead of merging
git config --global pull.rebase true


DEFAULT_NAME="Jofred Cayabyab"
DEFAULT_EMAIL="jofred.cayabyab1@ucalgary.ca"

read "?Enter your Git name [${DEFAULT_NAME}]: " GIT_SETUP_NAME
GIT_SETUP_NAME=${GIT_SETUP_NAME:-$DEFAULT_NAME}

read "?Enter your Git email [${DEFAULT_EMAIL}]: " GIT_SETUP_EMAIL
GIT_SETUP_EMAIL=${GIT_SETUP_EMAIL:-$DEFAULT_EMAIL}

git config --global user.name "$GIT_SETUP_NAME" --replace-all
git config --global user.email "$GIT_SETUP_EMAIL" --replace-all
