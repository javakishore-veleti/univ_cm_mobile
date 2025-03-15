#!/bin/bash

echo "🚀 Starting Flutter App..."

# ✅ Check if Flutter is installed
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter is not installed! Run setup-01-install-flutter.sh first."
    exit 1
fi

# ✅ Check if inside a Flutter project
if [ ! -f "pubspec.yaml" ]; then
    echo "❌ No Flutter project detected! Run this script from inside 'univ_cm_mobile'."
    exit 1
fi

# ✅ Handle optional "clean" flag
if [[ "$1" == "clean" ]]; then
    echo "🧹 Cleaning Flutter project..."
    flutter clean
    flutter pub get
fi

flutter clean
flutter pub get

# ✅ Detect platform argument (android/ios)
if [[ "$1" == "android" ]]; then
    echo "📱 Running Flutter on Android..."
    flutter run -d android
elif [[ "$1" == "ios" ]]; then
    echo "🍏 Running Flutter on iOS..."
    flutter run -d ios
else
    echo "🔄 Running Flutter app on available device/emulator..."
    flutter run -d chrome
fi

echo "✅ Flutter app started successfully!"

university_bg.jpg