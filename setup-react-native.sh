#!/bin/bash

PROJECT_NAME="univ_cm_mobile"

echo "🚀 Starting React Native Setup for $PROJECT_NAME..."

# ✅ Step 1: Ensure Required Tools Are Installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js first!"
    exit 1
fi

if ! command -v npm &> /dev/null; then
    echo "❌ npm is not installed. Please install npm first!"
    exit 1
fi

# ✅ Step 2: Clean Up Any Old Setup
echo "🧹 Cleaning up old installations..."
rm -rf android ios node_modules package-lock.json

# ✅ Step 3: Initialize React Native
echo "📂 Initializing React Native project..."
npx @react-native-community/cli init $PROJECT_NAME --skip-install

# ✅ Step 4: Move Android & iOS folders to Root
mv $PROJECT_NAME/android .
mv $PROJECT_NAME/ios .
rm -rf $PROJECT_NAME

# ✅ Step 5: Install Project Dependencies
echo "📦 Installing npm dependencies..."
npm install

# ✅ Step 6: Set Up Android
echo "⚡ Setting up Android..."
cd android && ./gradlew clean && cd ..

# ✅ Step 7: Set Up iOS (Mac users only)
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "🍏 Setting up iOS..."
    cd ios
    sudo gem install cocoapods
    pod install
    cd ..
else
    echo "⚠️ Skipping iOS setup (not macOS)."
fi

# ✅ Step 8: Run the App on Android
echo "🚀 Running the app on Android..."
npx react-native run-android

# ✅ Step 9: Run the App on iOS (Mac users only)
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "🚀 Running the app on iOS..."
    npx react-native run-ios
fi

echo "✅ React Native setup completed successfully! 🚀"
