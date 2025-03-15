#!/bin/bash

echo "🚀 Setting up React Native project (MacBook - iOS & Android)..."

# ✅ Ensure dependencies are installed
if [ ! -d "node_modules" ]; then
    echo "📦 Installing dependencies..."
    npm install
fi

# ✅ Reset Metro Bundler Cache (DO NOT START IT)
echo "🔄 Resetting Metro Bundler cache..."
npx react-native start --reset-cache & sleep 5  # Run in background & wait

# ✅ Ensure both `android/` and `ios/` folders exist
if [ ! -d "android" ] || [ ! -d "ios" ]; then
    echo "⚠️ Android or iOS folder missing! Creating them..."
    
    # Run `npx react-native init` only ONCE
    npx react-native init temp_project
    
    # Move only if directories were created successfully
    if [ -d "temp_project/android" ]; then
        mv temp_project/android .
        echo "✅ Android folder restored!"
    fi

    if [ -d "temp_project/ios" ]; then
        mv temp_project/ios .
        echo "✅ iOS folder restored!"
    fi
    
    rm -rf temp_project
fi

# ✅ Install CocoaPods if `ios/` exists (MacBook only)
if [[ "$OSTYPE" == "darwin"* ]] && [ -d "ios" ]; then
    echo "🍏 Installing CocoaPods for iOS..."
    cd ios && pod install && cd ..
fi

# ✅ Android Setup (Gradle Build)
if [ -d "android" ]; then
    echo "⚙️ Running Gradle clean for Android..."
    cd android && ./gradlew clean && cd ..
else
    echo "⚠️ Android folder is still missing. Please check manually."
fi

echo "✅ React Native project setup is complete! 🚀"
echo "💡 Next Step: Run './run-react-native-project.sh' to start the app."
