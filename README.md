# Flutter Test Users App

A Flutter application that implements a user authentication system with the following features:
- Animated Splash Screen
- Login with validations
- User Registration
- User List
- User Details
- State management with BLoC/Cubit
- Data persistence with SharedPreferences

## Flutter Version

3.24.5

## Prerequisites

Before starting, make sure you have installed:

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Android Studio](https://developer.android.com/studio) with Android SDK
- [Java JDK](https://www.oracle.com/java/technologies/downloads/) (for Android development)
- [Xcode](https://developer.apple.com/xcode/) (macOS only, for iOS development)
- A code editor like [VS Code](https://code.visualstudio.com/) or Android Studio

## Project Setup

1. Clone the repository:

```
git@github.com:FredyHDZR/Flutter-Test-Users.git
```

2. Open the project in your code editor.

3. Install the dependencies:

```
flutter pub get
```

- For android:

```
flutter pub get
```

- For ios:

```
flutter pub get
cd ios && pod install
```

4. Run the app:

```
flutter run
```

## Project Clean

```
flutter clean && flutter pub get
```

for android:

```
cd android
./gradlew clean
cd ..
flutter clean && flutter pub get
```

for ios:

```
flutter clean && flutter pub get
cd ios && pod deintegrate && pod install
```
