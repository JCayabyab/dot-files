echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Installing all homebrew packages..."
for PACKAGE in $(cat brew.txt); do
    echo "Installing $PACKAGE..."
    brew install --quiet $PACKAGE
done


echo "Installing all homebrew casks..."
for PACKAGE in $(cat cask.txt); do
    echo "Installing $PACKAGE..."
    brew install --quiet $PACKAGE
done

