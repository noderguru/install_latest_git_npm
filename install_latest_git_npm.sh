#!/bin/bash

set -e

echo "=== Updating packages and installing required dependencies ==="
sudo apt update
sudo apt install -y software-properties-common curl wget git

echo "=== Installing the latest version of Git ==="
sudo add-apt-repository -y ppa:git-core/ppa
sudo apt update
sudo apt install -y git
echo "Git installed, version: $(git --version)"

echo "=== Installing NVM (Node Version Manager) ==="
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Load NVM into the current shell session
export NVM_DIR="$HOME/.nvm"
source "$NVM_DIR/nvm.sh"

echo "=== Installing the latest version of Node.js and npm ==="
nvm install node

echo "Node.js installed, version: $(node -v)"
echo "npm installed, version: $(npm -v)"

echo "✅ Installation completed successfully."
