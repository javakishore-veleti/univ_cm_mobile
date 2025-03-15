#!/bin/bash

echo "🚀 Checking Flutter installation..."

# ✅ Check if Flutter is installed
if command -v flutter &> /dev/null; then
    echo "✔ Flutter is already installed (Version: $(flutter --version))"
else
    echo "❌ Flutter is not installed. Installing now..."
    brew install --cask flutter
fi

# ✅ Check if Flutter's bin directory is in PATH
FLUTTER_BIN="$HOME/flutter/bin"
if [[ ":$PATH:" == *":$FLUTTER_BIN:"* ]]; then
    echo "✔ Flutter's bin directory is already in PATH."
else
    echo "🔹 Adding Flutter to PATH..."
    echo 'export PATH="$PATH:$HOME/flutter/bin"' >> ~/.zshrc
    source ~/.zshrc
fi

# ✅ Verify installation
echo "🔍 Verifying Flutter installation..."
flutter --version

flutter --disable-analytics
