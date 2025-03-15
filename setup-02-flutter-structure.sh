#!/bin/bash

echo "🚀 Setting up Flutter project structure inside univ_cm_mobile..."

# ✅ Check if Flutter is installed
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter is not installed! Please run setup-01-install-flutter.sh first."
    exit 1
fi

# ✅ Check if the project has a pubspec.yaml file
if [ ! -f "pubspec.yaml" ]; then
    echo "⚠️ No Flutter project detected. Initializing Flutter..."
    flutter create .
else
    echo "✔ Flutter project already exists. Skipping 'flutter create .'"
fi

# ✅ Define directory structure
DIRS=(
  "lib/core"
  "lib/core/theme"
  "lib/core/network"
  "lib/app"
  "lib/features/auth/screens"
  "lib/features/auth/services"
  "lib/features/dashboard/screens"
  "lib/features/courses/screens"
  "lib/features/courses/services"
  "lib/features/courses/models"
  "lib/features/students/screens"
  "lib/features/students/services"
  "lib/features/notifications/screens"
  "lib/features/notifications/services"
  "lib/features/settings/screens"
  "lib/features/settings/services"
  "lib/shared/widgets"
  "lib/shared/utils"
  "assets/images"
  "assets/fonts"
  "test"
  "scripts"
)

# ✅ Create directories if they don’t exist
for dir in "${DIRS[@]}"; do
  mkdir -p "$dir"
done

# ✅ Create essential files if they don’t exist
touch lib/core/config.dart
touch lib/core/theme/theme.dart
touch lib/core/network/api_client.dart
touch lib/app/routes.dart
touch lib/app/navigation.dart
touch lib/main.dart
touch README.md
touch .gitignore
touch .env

# ✅ Install dependencies
echo "📦 Running 'flutter pub get'..."
flutter pub get

echo "✅ Flutter project structure setup complete! 🚀"
echo "💡 Next step: Run 'flutter run' inside the project to test your setup."
