
# Task Track App

Task Track is a Flutter-based task tracking application that allows users to manage their tasks efficiently. The app integrates Firebase for user authentication and data storage, and uses Flutter Local Notifications for task reminders.

## Features

- User authentication using Firebase Auth (Email/Password).
- Task management with CRUD operations (Create, Read, Update, Delete).
- Firestore integration for storing tasks.
- Local notifications for task reminders 10 minutes before the deadline.

## Prerequisites

Before you begin, ensure you have met the following requirements:

- Flutter SDK installed on your machine. See [Flutter installation guide](https://flutter.dev/docs/get-started/install) for instructions.
- Firebase project set up with Firestore database and Firebase Authentication enabled.
- IDE (e.g., Android Studio, VS Code) with Flutter and Dart plugins installed.

## Getting Started

### Clone the repository

```bash
git clone https://github.com/sayedsinan/task-track.git
cd task-track
```

### Install dependencies

```bash
flutter pub get
```

### Set up Firebase

1. Create a Firebase project at [Firebase Console](https://console.firebase.google.com/).
2. Add your Flutter app to the Firebase project using your package name (com.example.tasktrack).
3. Download `google-services.json` and place it in the `android/app` directory (for Android) or `ios/Runner` directory (for iOS).
4. Enable Firebase Authentication (Email/Password) and Firestore database in the Firebase Console.

### Run the app

```bash
flutter run
```

The app should now be running on your device or emulator.

## Usage

- **Login/Register**: Use the authentication screens to log in or register a new account.
- **View Tasks**: Once logged in, you can view your tasks, add new tasks, edit existing tasks, and mark tasks as complete.
- **Notifications**: The app sends notifications for task reminders based on the task deadlines.

## Troubleshooting

- If you encounter any issues with dependencies, try running `flutter pub get` again.
- Ensure your Firebase project configurations (`google-services.json` for Android, `Info.plist` for iOS) are correctly set up.

## Contributing

Contributions are welcome! Fork the repository and submit a pull request for any enhancements or fixes.



## Contact

Sayedsinan7@gmail.com
https://www.linkedin.com/in/sinan-jifry-8881aa219/


https://github.com/sayedsinan/machine_test/assets/107292770/7b55e1a1-2d36-4f8c-91a8-e6c138bfee16











