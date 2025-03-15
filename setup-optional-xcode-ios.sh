#!/bin/bash

echo "🚀 Checking Xcode & iOS Setup..."

# ✅ Check if Xcode is installed
if ! xcode-select -p &>/dev/null; then
    echo "⚠️ Xcode is NOT installed! Skipping iOS setup."
    exit 0
fi

echo "✅ Xcode is installed. Proceeding with setup..."

# ✅ Set Xcode as the active developer directory
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer

# ✅ Install Xcode Command Line Tools (if missing)
if ! command -v xcodebuild &> /dev/null; then
    echo "📥 Installing Xcode Command Line Tools..."
    xcode-select --install
fi

# ✅ Install CocoaPods (if missing)
if ! command -v pod &> /dev/null; then
    echo "📦 Installing CocoaPods..."
    sudo gem install cocoapods
else
    echo "✅ CocoaPods is already installed!"
fi

# ✅ Run `pod install` in the iOS project
if [ -d "ios" ]; then
    echo "🔄 Running pod install..."
    cd ios
    pod install
    cd ..
else
    echo "⚠️ iOS project folder not found. Skipping pod install."
fi

echo "✅ Xcode & iOS Setup Completed Successfully! 🚀"
