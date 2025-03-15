# univ_cm_mobile
Cross-platform mobile app for university course management, student applications, and notifications, built using React Native/Flutter. Supports role-based access for course administrators and counselors.


## Project Setup Scripts

### Execution Sequence

```shell

# 1️⃣ Set up project structure
./setup-mobile-structure.sh

# 2️⃣ Fix Node & npm issues (Optional, only if needed)
./setup-optional-fix-node-npm.sh

# 3️⃣ Fix Ruby & CocoaPods issues (Only for macOS with Xcode)
if [[ "$OSTYPE" == "darwin"* ]]; then
    ./setup-optional-fix-ruby-pods.sh
    ./setup-optional-xcode-ios.sh
fi

# 4️⃣ Set up React Native (Installs dependencies)
./setup-react-native.sh

# 5️⃣ Run the app on Android (Works for all developers)
npx react-native run-android

# 6️⃣ Run the app on iOS (Only for Mac users with Xcode)
if [[ "$OSTYPE" == "darwin"* ]]; then
    npx react-native run-ios
fi


chmod +x setup-react-native.sh
./setup-react-native.sh



chmod +x setup-mobile-structure.sh
./setup-mobile-structure.sh

## If You Have Issues, Run the Optional Fixes
## Run these only if you face issues!

chmod +x setup-xcode-ios.sh
./setup-xcode-ios.sh


##  If You Have Ruby or CocoaPods Issues
## Fixes: Ruby installation, CocoaPods issues, and pod install errors.
chmod +x setup-optional-fix-ruby-pods.sh
./setup-optional-fix-ruby-pods.sh

##  If You Have Node.js or npm Issues
##  Fixes: Node.js installation, npm version issues, and dependency errors.
chmod +x setup-optional-fix-node-npm.sh
./setup-optional-fix-node-npm.sh

```

## Project Running The App

```shell

npx react-native start
npx react-native run-android  # For Android
npx react-native run-ios      # For iOS (Mac only)

```