# univ_cm_mobile
Cross-platform mobile app for university course management, student applications, and notifications, built using React Native/Flutter. Supports role-based access for course administrators and counselors.


## Project Setup Scripts

### Execution Sequence

```shell

chmod +x setup-react-native.sh
./setup-react-native.sh

chmod +x setup-mobile-structure.sh
./setup-mobile-structure.sh

## If You Have Issues, Run the Optional Fixes
## Run these only if you face issues!

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