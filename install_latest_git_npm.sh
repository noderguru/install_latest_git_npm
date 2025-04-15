#!/bin/bash

set -e

echo "🧼 Removing old Node.js (if any)..."
apt remove -y nodejs || true

echo "🔄 Updating package lists..."
apt update

echo "📦 Installing required dependencies..."
apt install -y curl wget git software-properties-common

echo "🛠 Adding Git PPA and installing latest Git..."
add-apt-repository -y ppa:git-core/ppa
apt update
apt install -y git

echo "✅ Git installed, version: $(git --version)"

echo "⬇️ Installing Node.js v20 from official NodeSource repo..."
curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
apt install -y nodejs

echo "✅ Node.js installed, version: $(node -v)"
echo "✅ npm installed, version: $(npm -v)"
