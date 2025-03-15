#!/bin/bash

echo "🚀 Creating Flutter screen placeholders..."

SCREENS=(
  "lib/features/auth/screens/welcome_screen.dart"
  "lib/features/auth/screens/login_screen.dart"
  "lib/features/auth/screens/forgot_password_screen.dart"
  "lib/features/dashboard/screens/admin_dashboard.dart"
  "lib/features/courses/screens/course_list_screen.dart"
  "lib/features/students/screens/student_list_screen.dart"
  "lib/features/notifications/screens/notification_screen.dart"
  "lib/features/settings/screens/settings_screen.dart"
)

# ✅ Function to convert snake_case filenames to PascalCase class names
convert_to_class_name() {
  local filename=$(basename -- "$1")
  filename="${filename%.dart}" # Remove .dart extension
  echo "$filename" | awk -F '_' '{for (i=1; i<=NF; i++) $i=toupper(substr($i,1,1)) substr($i,2)}1' OFS=''
}

# ✅ Create directories and files
for screen in "${SCREENS[@]}"; do
  DIR_PATH=$(dirname "$screen")
  CLASS_NAME=$(convert_to_class_name "$screen")

  mkdir -p "$DIR_PATH"

  # ✅ Create screen file with a properly named class if it does not exist
  if [ ! -f "$screen" ]; then
    echo "📄 Creating $screen..."
    cat <<EOL > "$screen"
import 'package:flutter/material.dart';

class $CLASS_NAME extends StatelessWidget {
  const $CLASS_NAME({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$CLASS_NAME')),
      body: Center(child: Text('This is the $CLASS_NAME screen')),
    );
  }
}
EOL
  else
    echo "✅ Screen already exists: $screen (Skipping...)"
  fi
done

echo "✅ Screen placeholders created successfully!"
