[English](README.md) | [فارسی](README.fa.md)

# Rock Paper Scissors

![Flutter](https://img.shields.io/badge/Flutter-SDK-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-%5E3.12.0-0175C2?logo=dart&logoColor=white)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

A small Flutter rock, paper, scissors app with a Persian interface. Tap **شروع بازی** (Start game) to randomly pick a new hand for each side.

## Screenshots

| Rock / rock | Paper / scissors | Scissors / paper |
| :---: | :---: | :---: |
| <img src="assets/screenshots/rock_paper_scisser.png" width="200" alt="Game screen showing rock for both hands"/> | <img src="assets/screenshots/rock_paper_scisser(1).png" width="200" alt="Game screen showing paper above and scissors below"/> | <img src="assets/screenshots/rock_paper_scisser(2).png" width="200" alt="Game screen showing scissors above and paper below"/> |

These images live in `assets/screenshots/`. Replace them in place, or update the paths in both READMEs when adding new captures. They are documentation images, not runtime assets; they do not need a `pubspec.yaml` entry. Include this folder when committing the documentation so the images appear on GitHub.

## Key features

- Generate two independent random hands with one button press.
- Display rock, paper, and scissors using bundled PNG images.
- Persian title and button text, with the bundled **Vazir** font.
- A single orange-themed Material screen with vertically arranged hands and a central start button.
- Works offline: the app has no backend, network calls, accounts, or external service configuration.

### How it works

Both hand indices start at `1`. Pressing the button calls `Random().nextInt(3) + 1` for each hand, then `setState` rebuilds the screen with the corresponding image from `assets/images/`. Since each choice is random, either hand can stay the same between presses.

This version is a hand-pair generator rather than a complete player-versus-computer game. It does not offer manual hand selection, determine the winner, keep scores, or save previous rounds.

## Tech stack and architecture

The app uses a **single-file, widget-based structure**. UI and game state both live in `lib/main.dart`; there are no separate data, domain, or presentation layers, repositories, services, or routing setup. It does not use Clean Architecture, MVVM, or a feature-first layout.

### State management

`GameApplication` is a `StatefulWidget`. Its `_GameApplicationState` stores the `top` and `bottom` hand indices and updates them with Flutter's built-in `setState`. No BLoC, Provider, Riverpod, or other State Management package is used.

### Packages and assets

Direct dependencies declared in `pubspec.yaml`:

- **`flutter`** — SDK dependency for widgets, Material UI, theming, and asset loading.
- **`cupertino_icons: ^1.0.8`** — declared icon package; the current screen does not use Cupertino icons.

Development dependencies:

- **`flutter_test`** — Flutter's widget-testing tools.
- **`flutter_lints: ^6.0.0`** — recommended analyzer rules, enabled through `analysis_options.yaml`.

Random selection uses **`dart:math`**, which is part of the Dart SDK, not a third-party package. There are no networking, local storage, or additional UI dependencies, and no `build_runner` or code generation setup.

The app bundles `assets/images/1.png`, `2.png`, and `3.png`, plus `assets/fonts/vb.ttf`, registered as the `Vazir` font family.

### Directory structure

```text
lib/
└── main.dart                 # Entry point, GameApplication, UI, and hand state
```

```text
rock_paper_scisser/
├── lib/
│   └── main.dart
├── assets/
│   ├── images/               # Three hand images used by the app
│   ├── fonts/
│   │   └── vb.ttf            # Vazir font
│   └── screenshots/          # Images used in these READMEs
├── test/
│   └── widget_test.dart      # Original counter template test; see below
├── android/                  # Android platform project
├── web/                      # Web platform project
├── windows/                  # Windows desktop platform project
├── analysis_options.yaml
├── pubspec.yaml
├── pubspec.lock
├── .gitattributes            # Excludes boilerplate/generated code from Linguist
├── LICENSE
├── README.md
└── README.fa.md
```

Platform projects currently exist for **Android, web, and Windows**. iOS, macOS, and Linux platform folders are not included in this checkout.

## Getting started

### 1. Prerequisites

- Git and a Flutter SDK that includes **Dart 3.12.0 or newer, below 4.0.0**, matching the `sdk: ^3.12.0` constraint. The manifest does not pin a specific Flutter release.
- An editor such as Android Studio or VS Code with Flutter/Dart support.
- The tooling for your target: Android SDK and an emulator or physical device for Android; Chrome for web; Visual Studio with the **Desktop development with C++** workload for Windows desktop.

Check your environment:

```bash
flutter --version
flutter doctor
```

The package name is `rock_paper_scisser`, version `1.0.0+1`. It is an application with `publish_to: 'none'`, not a package intended for publication on pub.dev.

### 2. Clone the repository

```bash
git clone https://github.com/mehrshadkhv/rock_paper_scisser.git
cd rock_paper_scisser
```

If you already have the project locally, open its root directory instead.

### 3. Install dependencies

```bash
flutter pub get
```

No API keys, environment files, backend setup, or code generation commands are needed.

### 4. Run the app

Start an emulator or connect a device, then run:

```bash
flutter devices
flutter run
```

To choose a specific target, use `flutter run -d <device-id>` with an ID from `flutter devices`. For the included web and Windows targets:

```bash
flutter run -d chrome
flutter run -d windows
```

Windows desktop requires a Windows host with the tooling described above. Included platform folders indicate project configuration, not a guarantee that every target has been tested.

## Development checks

```bash
flutter analyze
flutter test
```

**Known test issue:** `test/widget_test.dart` is still the starter counter smoke test. It expects a `0` label and an add icon, neither of which exists in this app, so it does not currently validate the game and is expected to fail. It needs to be replaced with a widget test for `GameApplication`, its two images, and the **شروع بازی** button.

## GitHub language statistics

`.gitattributes` marks platform boilerplate in `android/`, `ios/`, `web/`, `linux/`, `macos/`, and `windows/` as `linguist-vendored=true`. It also marks `*.g.dart` and `*.freezed.dart` as `linguist-generated=true`. These files are excluded from GitHub Linguist's language statistics so the application's Dart source remains the focus. This does not affect Flutter builds or remove files from Git.

## License

Released under the [MIT License](LICENSE). Copyright © 2026 Mehrshad Khodavirdizadeh.
