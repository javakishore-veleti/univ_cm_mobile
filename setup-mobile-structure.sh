#!/bin/bash

PROJECT_NAME="univ_cm_mobile"
echo "🚀 Setting up project structure for $PROJECT_NAME..."

# ✅ List of Directories to Create
DIRS=(
  "src"
  "src/app"
  "src/app/navigation"
  "src/app/theme"
  "src/domains"
  "src/domains/public/screens"
  "src/domains/public/services"
  "src/domains/auth/screens"
  "src/domains/auth/services"
  "src/domains/dashboard/screens"
  "src/domains/course/screens"
  "src/domains/course/services"
  "src/domains/student/screens"
  "src/domains/student/services"
  "src/domains/notifications/screens"
  "src/domains/notifications/services"
  "src/domains/settings/screens"
  "src/domains/settings/services"
  "components"
  "store"
  "utils"
  "config"
  "tests"
  "scripts"
  ".github"
)

# ✅ Create Directories
for dir in "${DIRS[@]}"; do
  mkdir -p "$dir"
done

# ✅ Initialize package.json If Not Exists
if [ ! -f "package.json" ]; then
  echo "⚠️ Warning: package.json not found. Creating a new one..."
  cat <<EOL > package.json
{
  "name": "$PROJECT_NAME",
  "version": "1.0.0",
  "private": true,
  "scripts": {
    "start": "npx react-native start",
    "android": "npx react-native run-android",
    "ios": "npx react-native run-ios",
    "build-android": "cd android && ./gradlew assembleRelease && cd ..",
    "build-ios": "cd ios && xcodebuild -workspace $PROJECT_NAME.xcworkspace -scheme $PROJECT_NAME -sdk iphoneos -configuration Release && cd ..",
    "lint": "eslint .",
    "test": "jest",
    "e2e-test": "detox test"
  }
}
EOL
fi

# ✅ Create Empty Files
touch .gitignore .env README.md Jenkinsfile azure-pipelines.yml buildspec.yml

echo "✅ Project structure for $PROJECT_NAME created successfully! 🚀"
