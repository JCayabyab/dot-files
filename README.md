## Setup

1. Install homebrew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
2. Clone this repo and `cd` into it
3. Run `sudo chmod +rwx git-setup.sh` then `./git-setup.sh`
4. Run `sudo chmod +rwx setup.sh` then `zsh ./setup.sh`
5. In `Preferences -> Profiles` of iTerm2, import `iterm2.json` profile

## Syncing settings after file change

After you make a change to a file:

1. Re-run `zsh ./setup.sh` script
2. Commit changes to git repo

**Note**: The files in the folders are symlinked to their respective places, so any changes made to files outside of this folder will be automatically updated in this folder.
