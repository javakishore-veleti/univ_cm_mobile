#!/bin/bash

REQUIRED_RUBY_VERSION="3.1.0"

echo "🚀 Checking and fixing Ruby & CocoaPods setup..."

# ✅ Step 1: Install Ruby if Missing
if ! command -v ruby &> /dev/null; then
    echo "⚠️ Ruby is not installed. Installing Ruby..."
    brew install ruby
fi

# ✅ Step 2: Check Ruby Version (Warn if below 3.1.0)
CURRENT_RUBY_VERSION=$(ruby -e 'print RUBY_VERSION')
if [ "$(printf '%s\n' "$CURRENT_RUBY_VERSION" "$REQUIRED_RUBY_VERSION" | sort -V | head -n1)" != "$REQUIRED_RUBY_VERSION" ]; then
    echo "⚠️ Warning: Ruby version $CURRENT_RUBY_VERSION is lower than recommended ($REQUIRED_RUBY_VERSION). Consider upgrading."
fi

echo "✔ Ruby version is $CURRENT_RUBY_VERSION (Proceeding...)"

# ✅ Step 3: Install Homebrew if Missing
if ! command -v brew &> /dev/null; then
    echo "⚠️ Homebrew is not installed. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew update
fi

# ✅ Step 4: Update RubyGems
echo "🔹 Updating RubyGems..."
sudo gem update --system

# ✅ Step 5: Install or Update CocoaPods
if ! command -v pod &> /dev/null; then
    echo "🔹 Installing CocoaPods..."
    sudo gem install cocoapods
else
    echo "🔹 Updating CocoaPods..."
    sudo gem update cocoapods
fi

# ✅ Step 6: Run `pod install` for iOS (If iOS Project Exists)
if [ -d "ios" ]; then
    echo "📂 Running pod install in iOS project..."
    cd ios && pod install && cd ..
    echo "✅ CocoaPods setup completed!"
else
    echo "⚠️ Warning: iOS project folder not found. Skipping pod install."
fi

echo "✅ Ruby & CocoaPods setup fixed! 🚀"
