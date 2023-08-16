# Lap Quest ⌛

Lap Quest is an innovative stopwatch app built with clean architecture and powered by Flutter. Seamlessly manage multiple activities, each with its own stopwatch and lap history. It is the ultimate companion for your activity pursuits.

<img width="650" src=""></a>

## Screenshots

<img width="650" src=""></a>
<img width="650" src=""></a>
<img width="650" src=""></a>
<img width="650" src=""></a>

## Features

## Getting Started

Follow these instructions to get the app up and running on your local machine.

### Prerequisites

Before running the app, make sure you have Flutter installed on your system. If you haven't installed Flutter yet, follow the official Flutter installation guide: [Flutter Installation](https://flutter.dev/docs/get-started/install)

### Installing

## Folder Structure

The project follows a Clean Architecture structure to separate concerns and make the codebase maintainable and scalable.

- `lib/` contains the application code.
  - `features/` contains the features in the application.
    - `stopwatch/` contains the stopwatch feature with CRUD operations
        - `data/` contains the data layer with repository and data sources implementations.
        - `domain/` contains the domain layer with entities, use cases, and repositories interfaces.
        - `presentation/` contains the presentation layer with the UI, BLoCs, and other UI-related components.
          - `presentation/` contains the presentation layer with the UI, BLoCs, and other UI-related components.
            - `features/` contains the presentation layer features with the UI, BLoCs, and other UI-related components.


## State Management

The app uses the BLoC (Business Logic Component) pattern for state management. BLoC allows for separation of UI and business logic and provides a clean way to manage the state of the application.

## Data Storage

## Themes

Lap Quest offers both light and dark themes to provide a personalized user experience. You can switch between themes from the app settings.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
