# univ_cm_mobile
Cross-platform mobile app for university course management, student applications, and notifications, built using React Native/Flutter. Supports role-based access for course administrators and counselors.


## Project Setup Scripts

### Execution Sequence

#### You only need to run this once after cloning the repo or resetting dependencies.
```shell

# 1.1 Setup the Mobile Project Structure
# This script creates the required directory structure for the project.

./setup-mobile-structure.sh

# 1.2 (Optional) Fix Node & npm Issues
# If you face issues with npm install or node_modules, run:

./setup-optional-fix-node-npm.sh

# 1.3 (Optional) Fix Ruby & CocoaPods Issues (For macOS Users)
# If working on iOS (MacBook) and encountering CocoaPods issues, run:

./setup-optional-fix-ruby-pods.sh

# 1.4 (Optional) Fix Xcode & iOS Issues (For macOS Users)
# If Xcode is installed, but pod install or xcodebuild is failing, run:

./setup-optional-xcode-ios.sh

# 1.5 Install and Setup React Native
# This installs all dependencies, CocoaPods (for iOS), and ensures Metro Bundler is ready.

./setup-react-native.sh


```


## Project Running The App

```shell

# Use this script every time you start working on the project.
# 2.1 Start the React Native App

./run-react-native-project.sh

# This script:
# Starts Metro Bundler
# Runs Android (default) or iOS (on Mac)


```

##  Building the App for Release

```shell

## 3.1 Build Android APK
npx react-native run-android --variant=release


```