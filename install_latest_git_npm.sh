#!/bin/bash

set -e

echo "🔍 Checking for and removing conflicting packages..."
apt remove -y nodejs libnode-dev || true

echo "🧼 Cleaning up old Node.js cache if exists..."
rm -f /var/cache/apt/archives/nodejs_*.deb || true
apt clean

echo "🔄 Updating package lists..."
apt update

echo "📦 Installing base dependencies..."
apt install -y curl wget git software-properties-common

echo "🛠 Adding Git PPA and installing latest Git..."
add-apt-repository -y ppa:git-core/ppa
apt update
apt install -y git

echo "✅ Git version: $(git --version)"

echo "⬇️ Installing Node.js v20 from official NodeSource..."
curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
apt install -y nodejs

echo "✅ Node.js version: $(node -v)"
echo "✅ npm version: $(npm -v)"
