#!/bin/bash

REQUIRED_NODE_VERSION="18.0.0"

echo "🚀 Checking and fixing Node.js & npm setup..."

# ✅ Step 1: Install Node.js if Missing
if ! command -v node &> /dev/null; then
    echo "⚠️ Node.js is not installed. Installing latest Node.js..."
    brew install node
fi

# ✅ Step 2: Check Node.js Version (Warn if below 18.0.0)
CURRENT_NODE_VERSION=$(node -v | sed 's/v//')
if [ "$(printf '%s\n' "$CURRENT_NODE_VERSION" "$REQUIRED_NODE_VERSION" | sort -V | head -n1)" != "$REQUIRED_NODE_VERSION" ]; then
    echo "⚠️ Warning: Node.js version $CURRENT_NODE_VERSION is lower than recommended ($REQUIRED_NODE_VERSION). Consider upgrading."
fi

echo "✔ Node.js version is $CURRENT_NODE_VERSION (Proceeding...)"

# ✅ Step 3: Check npm Version
echo "🔹 Checking npm version..."
npm -v
echo "🔹 Updating npm..."
npm install -g npm

# ✅ Step 4: Clean Cache & Reinstall Dependencies
echo "🧹 Cleaning npm cache..."
npm cache clean --force

echo "📦 Reinstalling dependencies..."
rm -rf node_modules package-lock.json
npm install

echo "✅ Node.js & npm setup fixed! 🚀"
