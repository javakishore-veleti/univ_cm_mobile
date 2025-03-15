#!/bin/bash

echo "🚀 Setting up React Native project..."

# ✅ Ensure dependencies are installed
if [ ! -d "node_modules" ]; then
    echo "📦 Installing dependencies..."
    npm install
fi

# ✅ Reset Metro Bundler Cache (DO NOT START IT)
echo "🔄 Resetting Metro Bundler cache..."
npx react-native start --reset-cache & sleep 5  # Run in background & wait

# ✅ Setup iOS dependencies (Only if on macOS)
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "🍏 Installing CocoaPods for iOS..."
    cd ios && pod install && cd ..
fi

echo "✅ React Native project setup is complete! 🚀"
echo "💡 Next Step: Run './run-react-native-project.sh' to start the app."
