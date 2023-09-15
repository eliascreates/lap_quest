# Lap Quest ⌛

Lap Quest is an innovative stopwatch app built with clean architecture and powered by Flutter. Seamlessly manage multiple activities, each with its own stopwatch and lap history. It is the ultimate companion for your activity pursuits.

<img width="650" src="./screenshots/lap_quest_gif.gif"></a>

## Screenshots

<img width="650" src="./screenshots/screens/lap_quest_main_ticket.png"></a>
<img width="650" src="./screenshots/screens/lap_quest_activity_detail.png"></a>
<img width="650" src="./screenshots/screens/lap_quest_crud.png"></a>

## Features
- Create and manage multiple activities, each with its own stopwatch.
- Start, pause, and reset stopwatches for different activities.
- Record lap times and view lap history.
- Display the best and worst laps for each activity.
- Toggle between light, dark, or system themes for a customized user experience.

## Folder Structure

The project follows a Clean Architecture structure to separate concerns and make the codebase maintainable and scalable.

`lib`/
├── config/ \
│ ├── debug/ \
│ ├── routes/ \
│ └── themes/ \
├── config/ \
├── `features`/ \
│ ├── `activity`/ \
│ │ ├── data/ \
│ │ ├── domain/ \
│ │ └── presentation/ \
│ ├── `stopwatch`/ \
│ ├── . . . \
└── main.dart \

## State Management

The app uses the BLoC (Business Logic Component) pattern for state management. BLoC allows for separation of UI and business logic and provides a clean way to manage the state of the application.

## Data Storage
- Activity data are stored efficiently using the Isar database.
- Theme preferences are stored using Hydrated Bloc (Hive).

## Themes

Lap Quest offers both light and dark themes to provide a personalized user experience. You can switch between themes from the app settings.

<img width="650" src="./screenshots/lap_quest_theming_gif.gif"></a>

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
