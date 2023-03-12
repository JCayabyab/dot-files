# Jofred Cayabyab's dot files

This repo is designed to make MacOS development setup as painless as possible. If you encounter any issues while trying to setup the repo, please contact me @ [me@jcayabyab.com](mailto:me@jcayabyab.com).

## Setup

1. Install homebrew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
2. Clone this repo and `cd` into it
3. Run `sudo chmod +rwx setup.sh` then `zsh ./setup.sh`
   - Some commands might need user interaction, so monitor the script's execution.
4. In `Preferences -> Profiles` of iTerm2, click on `Other Actions... -> Import JSON Profiles...` and import `iterm2.json` profile
5. Perform GitHub setup using the GitHub CLI:
   a. `gh auth login`
   b. `gh auth setup-git`

## Syncing settings after file change

After you make a change to a file:

1. Re-run `zsh ./setup.sh` script
2. Commit changes to git repo

**Note**: The files in the folders are symlinked to their respective places, so any changes made to files outside of this folder will be automatically updated in this folder.

## Known Issues

- The IntelliJ `~/.ideavimrc` does not elegantly source `~/.vimrc`. For example, pressing `f` types out `⏎overwin-f)`. Separating the `~/.vimrc` file into multiple files would make this easier.
- There's a weird issue with install the LTS version in the Bash script. The issue is found (here)[https://github.com/nvm-sh/nvm/issues/2963] and seems to be related to the `common-aliases` library with oh-my-zsh. This should be fixed soon as per (this)[https://github.com/nvm-sh/nvm/issues/2963#issuecomment-1423538863] comment, but a quick workaround would be to comment out common-aliases in `~/.zshrc`, then rerun `setup.sh`.
