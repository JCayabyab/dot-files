# Setup git for the first time

gitsetup() {
    echo "WARNING: not checking for existing SSH keys!"

    # Use current branch only when doing git push
    git config --global push.default current

    echo "What's your git name? (e.g., Jofred Cayabyab)"
    read GIT_SETUP_NAME

    echo "What's your git email? (e.g., jjay.cayabyab@gmail.com)"
    read GIT_SETUP_EMAIL

    git config --global user.name $GIT_SETUP_NAME
    git config --global user.email $GIT_SETUP_EMAIL

    echo "Now configuring SSH keys..."
    ssh-keygen -t rsa -C $GIT_SETUP_EMAIL

    echo "Let's start the ssh-agent..."
    eval "$(ssh-agent -s)"

    echo "Adding SSH key..."
    ssh-add ~/.ssh/id_rsa

    echo "Now copying SSH key to clipboard..."
    pbcopy < ~/.ssh/id_rsa.pub

    echo "Your SSH public key has been copied to your clipboard."
    echo "Paste this SSH key in GitHub settings -> SSH and GPG Keys."
    echo "https://github.com/settings/keys"
}

gitsetup