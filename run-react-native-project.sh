#!/bin/bash

echo "🚀 Running React Native project..."

# ✅ Start Metro Bundler
echo "📡 Starting Metro Bundler..."
npx react-native start &  # Run in background

# ✅ Run Android or iOS build
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "🍏 Running the app on iOS..."
    npx react-native run-ios
else
    echo "🤖 Running the app on Android..."
    npx react-native run-android
fi

echo "✅ App is running successfully! 🚀"
